LndClient.start_link(nil)

node_uri = System.get_env("NODE") || "localhost:10009"
cert_path = System.get_env("CERT") || "~/.lnd/lnd.cert"
macaroon_path = System.get_env("MACAROON") || "~/.lnd/readonly.macaroon"

case LndClient.connect(node_uri, cert_path, macaroon_path) do
  { :ok, _connection } ->
    IO.puts "SUCCESS: connected to node"

  { :error, error } ->
    IO.puts "ERROR: cannot connect to node"
    IO.inspect error
end

LndClient.Tools.HtlcUpdates.start_link
LndClient.Tools.InvoiceUpdates.start_link
LndClient.Tools.ChannelUpdates.start_link

defmodule Benchmark do
  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end

# example testing a long running function
# Benchmark.measure(fn -> LndClient.describe_graph end)
