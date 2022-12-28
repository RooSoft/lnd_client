defmodule LndClient.LightningServiceHandler do
  @callback get_info(GRPC.Channel.t(), String.t()) :: {:ok, Lnrpc.GetInfoResponse.t()}

  def get_info(channel, macaroon) do
    Lnrpc.Lightning.Stub.get_info(
      channel,
      Lnrpc.GetInfoRequest.new(),
      metadata: %{macaroon: macaroon}
    )
  end

  @callback add_invoice(Lnrpc.Invoice.t(), GRPC.Channel.t(), String.t()) ::
              {:ok, Lnrpc.AddInvoiceResponse.t()}

  def add_invoice(invoice, channel, macaroon) do
    Lnrpc.Lightning.Stub.add_invoice(
      channel,
      invoice,
      metadata: %{macaroon: macaroon}
    )
  end

  @callback send_payment_sync(Lnrpc.SendRequest.t(), GRPC.Channel.t(), String.t()) ::
              {:ok, Lnrpc.SendResponse.t()}

  def send_payment_sync(send_request, channel, macaroon) do
    Lnrpc.Lightning.Stub.send_payment_sync(
      channel,
      send_request,
      metadata: %{macaroon: macaroon}
    )
  end
end
