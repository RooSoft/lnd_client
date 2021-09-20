defmodule LndClient.Connectivity do
  def connect(%{
    node_uri: node_uri,
    cert_path: cert_path,
    macaroon_path: macaroon_path
  }) do
    creds = get_creds(cert_path)

    GRPC.Stub.connect(
      node_uri,
      cred: creds,
      adapter_opts: %{http2_opts: %{keepalive: :infinity}}
    )
    |> manage_new_connection(macaroon_path)
  end

  def disconnect(channel) do
    GRPC.Stub.disconnect(channel)
  end


  defp manage_new_connection { :ok, connection }, macaroon_path do
    macaroon = get_macaroon(macaroon_path)

    { :ok, %{ connection: connection, macaroon: macaroon } }
  end

  defp manage_new_connection { :error, error }, _ do
    { :error, error }
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
