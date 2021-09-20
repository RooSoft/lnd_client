LndClient.start_link(nil)

node_uri = System.get_env("NODE") || "localhost:10009"
cert_path = System.get_env("CERT") || "~/.lnd/lnd.cert"
macaroon_path = System.get_env("MACAROON") || "~/.lnd/readonly.macaroon"

case LndClient.connect(node_uri, cert_path, macaroon_path) do
  { :ok, _connection } ->
    IO.puts "SUCCESS: connected to node"
    IO.puts "Connected to the node"

  { :error, error } ->
    IO.puts "ERROR: cannot connect to node"
    IO.inspect error
end
