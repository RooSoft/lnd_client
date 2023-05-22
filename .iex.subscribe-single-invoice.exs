node_uri = System.get_env("NODE") || "127.0.0.1:10003"
cert_path = System.get_env("CERT") || "/Users/ramon/.polar/networks/1/volumes/lnd/alice/tls.cert"

macaroon_path =
  System.get_env("MACAROON") ||
    "/Users/ramon/.polar/networks/1/volumes/lnd/alice/data/chain/bitcoin/regtest/admin.macaroon"

defmodule SingleSubscriber do
  use LndClient.SingleInvoiceUpdatesSubscriber

  @impl LndClient.SingleInvoiceUpdatesSubscriber
  def handle_subscription_update(invoice) do
    IO.puts("Single invoice subscription update:")
    IO.inspect(invoice)
  end
end

%LndClient.Config{
  conn_config: %LndClient.ConnConfig{
    node_uri: node_uri,
    cert_path: cert_path,
    macaroon_path: macaroon_path
  },
  single_invoice_subscriber: SingleSubscriber,
  name: :alice
}
|> LndClient.start_link()

case LndClient.SingleInvoiceSubscription.DynamicSupervisor.start_link(%{
       name: :"LndClient.SingleInvoiceSubscription.DynamicSupervisor.alice"
     }) do
  {:ok, ds_pid} -> IO.puts("Started DynamicSupervisor with pid #{inspect(ds_pid)}")
  {:error, reason} -> IO.puts("Failed to start DynamicSupervisor: #{inspect(reason)}")
end

pr =
  "lnbcrt500u1p36l0ahpp5d9ufvhepuc805993ymqmg0jn03kphz5m2m38f2svzcxakzjesqvqdqqcqzpgxqyz5vqsp5g2a7wvca27w6ku0v93xx0kncr6t9ymtkzujq92n3je9hdd0gwu9q9qyyssqk3ggdskn55clu0zc9j3x6uea4x0mszn5ncmuwjkhfgcl2cplraynuanwgfthu75sx2hyww2fseyr9ctkuayg75aa5w7q99cqcskzx8qpgr5tz4"

{:ok, pay_req} = pr |> LndClient.decode_payment_request(:alice)

payment_hash_bytes =
  pay_req.payment_hash
  |> String.upcase()
  |> Base.decode16!()

lookup_invoice_msg = %Invoicesrpc.LookupInvoiceMsg{
  invoice_ref: {:payment_hash, payment_hash_bytes}
}

inspect(lookup_invoice_msg)

{:ok, invoice} =
  lookup_invoice_msg
  |> LndClient.lookup_invoice_v2(:alice)

subscribe_single_invoice_request = %Invoicesrpc.SubscribeSingleInvoiceRequest{
  r_hash: invoice.r_hash
}

LndClient.SingleInvoiceSubscription.DynamicSupervisor.add_subscriber(
  :alice,
  SingleSubscriber,
  subscribe_single_invoice_request
)

# NOTES: when system is restarted, we may miss some updates. How do we recover in a stateless manner?
#
# List all invoices to know the latest status?
# How do we know when to stop and not go back since the beginning of the node's db?
# How do we know which ones to watch again, because single invoice updates are needed only for hold invoices? What if we watch all? Elixir can handle that anyway.
#
# It seems like we ought to leave that to the dev, but we must provide a way for them to hook into the start up process so that they can:
# - fetch what invoices they want to watch from their db and subscribe to those
# - get updates for each of the invoices they care about for any updates they may have missed
