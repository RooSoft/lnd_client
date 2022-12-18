defmodule LndClient.LightningServiceHandler do
  alias Lnrpc.{
    Invoice,
    SendRequest,
    InvoiceSubscription,
    GetInfoRequest,
    GetInfoResponse,
    AddInvoiceResponse,
    SendResponse
  }

  alias Lnrpc.Lightning.Stub

  @callback get_info(GRPC.Channel.t(), String.t()) :: {:ok, GetInfoResponse.t()}

  def get_info(channel, macaroon) do
    Stub.get_info(
      channel,
      GetInfoRequest.new(),
      metadata: %{macaroon: macaroon}
    )
  end

  @callback add_invoice(Invoice.t(), GRPC.Channel.t(), String.t()) ::
              {:ok, AddInvoiceResponse.t()}

  def add_invoice(invoice, channel, macaroon) do
    Stub.add_invoice(
      channel,
      invoice,
      metadata: %{macaroon: macaroon}
    )
  end

  @callback send_payment_sync(SendRequest.t(), GRPC.Channel.t(), String.t()) ::
              {:ok, SendResponse.t()}

  def send_payment_sync(send_request, channel, macaroon) do
    Stub.send_payment_sync(
      channel,
      send_request,
      metadata: %{macaroon: macaroon}
    )
  end

  @callback subscribe_invoices(InvoiceSubscription.t(), GRPC.Channel.t(), String.t()) ::
              {:ok, {Invoice.t(), true}}
  def subscribe_invoices(request \\ InvoiceSubscription.new(), channel, macaroon) do
    Stub.subscribe_invoices(
      channel,
      request,
      metadata: %{macaroon: macaroon}
    )
  end
end
