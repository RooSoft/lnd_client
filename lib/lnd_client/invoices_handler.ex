defmodule LndClient.InvoicesHandler do
  alias Invoicesrpc.Invoices.Stub
  alias Invoicesrpc.AddHoldInvoiceRequest

  def add_hold_invoice(%AddHoldInvoiceRequest{} = request, grpc_channel, macaroon) do
    Stub.add_hold_invoice(grpc_channel, request, metadata: %{macaroon: macaroon})
  end
end
