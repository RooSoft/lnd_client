defmodule LndClient.Connectivity do
  alias LndClient.ConnConfig

  def connect(%ConnConfig{} = conn_config) do
    creds = get_creds(conn_config.cert_path)

    GRPC.Stub.connect(
      conn_config.node_uri,
      cred: creds,
      adapter_opts: %{http2_opts: %{keepalive: :infinity}}
    )
    |> manage_new_grpc_channel(conn_config.macaroon_path)
  end

  def disconnect(channel) do
    GRPC.Stub.disconnect(channel)
  end

  defp manage_new_grpc_channel({:ok, grpc_channel}, macaroon_path) do
    macaroon = get_macaroon(macaroon_path)

    {:ok, %{grpc_channel: grpc_channel, macaroon: macaroon}}
  end

  defp manage_new_grpc_channel({:error, error}, _) do
    {:error, error}
  end

  defp get_creds(cert_path) do
    filename = Path.expand(cert_path)

    GRPC.Credential.new(ssl: [cacertfile: filename])
  end

  defp get_macaroon(macaroon_path) do
    filename = Path.expand(macaroon_path)

    File.read!(filename) |> Base.encode16()
  end
end
