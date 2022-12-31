node_uri = System.get_env("NODE") || "127.0.0.1:10003"
cert_path = System.get_env("CERT") || "/Users/ramon/.polar/networks/1/volumes/lnd/alice/tls.cert"

macaroon_path =
  System.get_env("MACAROON") ||
    "/Users/ramon/.polar/networks/1/volumes/lnd/alice/data/chain/bitcoin/regtest/admin.macaroon"

defmodule SingleSubscriber do
  use LndClient.SingleInvoiceUpdatesSubscriber

  @impl LndClient.SingleInvoiceUpdatesSubscriber
  def handle_subscription_update(invoice) do
    IO.puts("Hello from Tools")
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

LndClient.SingleInvoiceSubscription.DynamicSupervisor.start_link(%{name: :alice})

pr =
  "lnbcrt500u1p36apcrpp56xjpxsglm2xrg9q869nd74gtzhne338dcw4zcdwfahrtm8gndwdqdqqcqzpgxqyz5vqsp50tf4730er4snqmx57flctteuzzlgg8cdmh3umcnht2hew0xtrseq9qyyssq4t4ry38vy42zsf8wmyrf0yt2d5za3q3gqe4jc3tdrnp7czjj0q74k0dl0h2aa8xad05j5zuq5wg2cjhpsc4x4pwawvepysx8yskrq3cpxvjdft"

{:ok, %Lnrpc.PayReq{}} =
  pr
  |> LndClient.decode_payment_request(:alice)
