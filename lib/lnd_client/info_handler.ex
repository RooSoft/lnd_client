defmodule LndClient.InfoHandler do
  def get(grpc_channel, macaroon) do
    Lnrpc.Lightning.Stub.get_info(
      grpc_channel,
      Lnrpc.GetInfoRequest.new(),
      metadata: %{macaroon: macaroon}
    )
  end
end
