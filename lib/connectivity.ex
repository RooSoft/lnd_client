defmodule LndClient.Connectivity do
  def connect(server, cert_path, macaroon_path) do
    creds = get_creds(cert_path)

    { :ok, connection } = GRPC.Stub.connect(
      server,
      cred: creds,
      adapter_opts: %{http2_opts: %{keepalive: :infinity}}
    )

    macaroon = get_macaroon(macaroon_path)

    %{ connection: connection, macaroon: macaroon }
  end

  def disconnect(channel) do
    GRPC.Stub.disconnect(channel)
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
