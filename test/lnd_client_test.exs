defmodule LndClientTest do
  use ExUnit.Case

  alias LndClient.ConnConfig
  alias Lnrpc.{Invoice, SendRequest}

  import Mox

  setup :set_mox_from_context
  setup :verify_on_exit!

  setup context do
    if context[:start_genserver] do
      LndClient.MockConnectivity
      |> expect(
        :connect,
        fn %ConnConfig{
             node_uri: "node_uri",
             cert_path: "cert_path",
             macaroon_path: "macaroon_path"
           } ->
          {:ok,
           %{
             conn_config: %ConnConfig{
               node_uri: "node_uri",
               cert_path: "cert_path",
               macaroon_path: "macaroon_path"
             },
             grpc_channel: %GRPC.Channel{},
             macaroon: "fakedmac"
           }}
        end
      )

      conn_config = %ConnConfig{
        node_uri: "node_uri",
        cert_path: "cert_path",
        macaroon_path: "macaroon_path"
      }

      LndClient.start_link(%{conn_config: conn_config})
    end

    :ok
  end

  @tag :start_genserver
  test "get_info returns the info of the given server" do
    LndClient.MockLightningServiceHandler
    |> expect(
      :get_info,
      fn _grpc_channel, macaroon ->
        assert macaroon == "fakedmac"
        {:ok, %Lnrpc.GetInfoResponse{identity_pubkey: "abc"}}
      end
    )

    {:ok, get_info_response} = LndClient.get_info()

    assert get_info_response.identity_pubkey == "abc"
  end

  test "child_spec is defined make it cleaner starting from a Supervisor" do
    conn_config = %LndClient.ConnConfig{}

    expected_result = %{
      id: :alice_lnd,
      start:
        {LndClient, :start_link, [%{conn_config: conn_config, name: :alice_lnd, subscribers: []}]}
    }

    assert LndClient.child_spec(%{conn_config: conn_config, name: :alice_lnd}) == expected_result
  end

  @tag :start_genserver
  test "add_invoice creates an invoice" do
    LndClient.MockLightningServiceHandler
    |> expect(
      :add_invoice,
      fn request, _grpc_channel, macaroon ->
        assert request.value_msat == 100_000
        assert macaroon == "fakedmac"

        {:ok, %Lnrpc.AddInvoiceResponse{payment_request: "pr"}}
      end
    )

    {:ok, add_invoice_response} =
      %Invoice{value_msat: 100_000}
      |> LndClient.add_invoice()

    assert add_invoice_response.payment_request == "pr"
  end

  @tag :start_genserver
  test "send_payment_sync sends a payment" do
    LndClient.MockLightningServiceHandler
    |> expect(
      :send_payment_sync,
      fn request, _grpc_channel, macaroon ->
        assert request.payment_request == "pr"
        assert macaroon == "fakedmac"

        {:ok, %Lnrpc.SendResponse{payment_hash: "ph"}}
      end
    )

    {:ok, send_response} =
      %SendRequest{payment_request: "pr"}
      |> LndClient.send_payment_sync()

    assert send_response.payment_hash == "ph"
  end

  @tag :start_genserver
  test "add_hold_invoice adds a hold invoice" do
    LndClient.MockInvoiceServiceHandler
    |> expect(
      :add_hold_invoice,
      fn request, _grpc_channel, macaroon ->
        assert request.value == 1000
        assert macaroon == "fakedmac"

        {:ok, %Invoicesrpc.AddHoldInvoiceResp{payment_request: "pr"}}
      end
    )

    {:ok, response} =
      %Invoicesrpc.AddHoldInvoiceRequest{value: 1000}
      |> LndClient.add_hold_invoice()

    assert response.payment_request == "pr"
  end
end
