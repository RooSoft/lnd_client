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

    ssl_opts =
      [cacertfile: filename]
      |> append_verify_settings

    GRPC.Credential.new(ssl: ssl_opts)
  end

  defp get_macaroon(macaroon_path) do
    filename = Path.expand(macaroon_path)

    File.read!(filename) |> Base.encode16()
  end

  defp append_verify_settings(list) do
    list |> append_if(Application.get_env(:lnd_client, :env) == :test, verify: :verify_none)
  end

  defp append_if(list, condition, item) do
    if condition, do: list ++ [item], else: list
  end
end
