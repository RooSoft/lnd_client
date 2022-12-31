defmodule LndClient.InvoiceServiceHandler do
  alias Invoicesrpc.Invoices.Stub
  alias Lnrpc.Invoice
  alias Invoicesrpc.{AddHoldInvoiceRequest, LookupInvoiceMsg}

  def add_hold_invoice(%AddHoldInvoiceRequest{} = request, grpc_channel, macaroon) do
    Stub.add_hold_invoice(grpc_channel, request, metadata: %{macaroon: macaroon})
  end

  @callback lookup_invoice_v2(LookupInvoiceMsg.t(), GRPC.Channel.t(), String.t()) ::
              {:ok, Invoice.t()}
  def lookup_invoice_v2(%LookupInvoiceMsg{} = request, grpc_channel, macaroon) do
    Stub.lookup_invoice_v2(grpc_channel, request, metadata: %{macaroon: macaroon})
  end
end
