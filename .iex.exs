node_uri = System.get_env("NODE") || "localhost:10009"
cert_path = System.get_env("CERT") || "~/.lnd/tls.cert"
macaroon_path = System.get_env("MACAROON") || "~/.lnd/readonly.macaroon"

conn_config =
  %LndClient.ConnConfig{
    node_uri: node_uri,
    cert_path: cert_path,
    macaroon_path: macaroon_path
  }
  |> LndClient.start_link()

LndClient.Tools.HtlcUpdates.start_link()
LndClient.Tools.InvoiceUpdates.start_link()
LndClient.Tools.ChannelUpdates.start_link()

defmodule Benchmark do
  def measure(function) do
    function
    |> :timer.tc()
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end

# example testing a long running function
# Benchmark.measure(fn -> LndClient.describe_graph end)
