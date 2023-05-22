defmodule LndClient.InvoiceServiceHandlerTest do
  use ExUnit.Case

  test "add_hold_invoice adds a hold invoices" do
    GrpcMock.defmock(Invoicesrpc.Invoices.ServiceMock, for: Invoicesrpc.Invoices.Service)

    GRPC.Server.start(Invoicesrpc.Invoices.ServiceMock, 50_052)

    {:ok, grpc_channel} = GRPC.Stub.connect("localhost:50052")

    Invoicesrpc.Invoices.ServiceMock
    |> GrpcMock.expect(:add_hold_invoice, fn _req, stream ->
      Invoicesrpc.AddHoldInvoiceResp.new(payment_request: "abcd")
    end)

    # hash field of a decoded invoice in hex-encoded byte form
    hash_bytes =
      "87550a73354fa8f098632c34268c8d2012708a8f56bc7c08209460fb4a3add0e"
      |> String.upcase()
      |> Base.decode16!()

    # This does not test that macaroon is even passed in and
    # set in metadata; the tests pass if that is commented out
    {:ok, response} =
      %Invoicesrpc.AddHoldInvoiceRequest{value_msat: 150_000, hash: hash_bytes}
      |> LndClient.InvoiceServiceHandler.add_hold_invoice(grpc_channel, "fakemacaroon")

    assert response.payment_request == "abcd"
  end
end
