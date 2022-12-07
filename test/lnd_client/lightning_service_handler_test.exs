defmodule LndClient.LightningServiceHandlerTest do
  use ExUnit.Case

  @handler LndClient.LightningServiceHandler

  import Mox

  setup :verify_on_exit!

  setup_all do
    GrpcMock.defmock(Lnrpc.Lightning.ServiceMock, for: Lnrpc.Lightning.Service)

    GRPC.Server.start(Lnrpc.Lightning.ServiceMock, 50_051)

    {:ok, grpc_channel} = GRPC.Stub.connect("localhost:50051")

    %{grpc_channel: grpc_channel}
  end

  test "get_info returns the info of the given server", %{grpc_channel: grpc_channel} do
    Lnrpc.Lightning.ServiceMock
    |> GrpcMock.expect(:get_info, fn _req, _stream ->
      Lnrpc.GetInfoResponse.new(identity_pubkey: "abcd")
    end)

    # This does not test that macaroon is even passed in and
    # set in metadata; the tests pass if that is commented out
    {:ok, response} = @handler.get_info(grpc_channel, "fakemacaroon")

    assert response.identity_pubkey == "abcd"
  end

  test "add_invoice/3 adds the invoice to LND", %{grpc_channel: grpc_channel} do
    Lnrpc.Lightning.ServiceMock
    |> GrpcMock.expect(:add_invoice, fn request, _stream ->
      assert request.memo == "memo"

      Lnrpc.AddInvoiceResponse.new(payment_request: "pr")
    end)

    request = %Lnrpc.Invoice{memo: "memo"}

    # This does not test that macaroon is even passed in and
    # set in metadata; the tests pass if that is commented out
    {:ok, response} = @handler.add_invoice(request, grpc_channel, "fakemacaroon")

    assert response.payment_request == "pr"
  end
end
