defmodule LndClientTest do
  use ExUnit.Case

  alias LndClient.ConnConfig
  alias Lnrpc.{Invoice, SendRequest}

  test "get_info returns the info of the given server" do
    LndClient.start_link(
      %ConnConfig{
        node_uri: System.get_env("BOB_NODE"),
        cert_path: System.get_env("BOB_CERT"),
        macaroon_path: System.get_env("BOB_MACAROON")
      },
      BobLndClient
    )

    {:ok, get_info_response} = LndClient.get_info(BobLndClient)

    assert get_info_response.alias == "bob"
  end

  test "child_spec is defined make it cleaner starting from a Supervisor" do
    expected_result = %{
      id: LndClient,
      start: {LndClient, :start_link, ["1"]}
    }

    assert LndClient.child_spec("1") == expected_result
  end

  test "add_invoice creates an invoice" do
    # Create an invoice that can be paid
    LndClient.start_link(
      %ConnConfig{
        node_uri: System.get_env("ALICE_NODE"),
        cert_path: System.get_env("ALICE_CERT"),
        macaroon_path: System.get_env("ALICE_MACAROON")
      },
      AliceLndClient
    )

    {:ok, add_invoice_response} =
      LndClient.add_invoice(
        %Invoice{value_msat: 100_000},
        AliceLndClient
      )

    assert add_invoice_response.payment_request != nil
  end

  test "send_payment_sync sends a payment" do
    # Create an invoice that can be paid
    LndClient.start_link(
      %ConnConfig{
        node_uri: System.get_env("ALICE_NODE"),
        cert_path: System.get_env("ALICE_CERT"),
        macaroon_path: System.get_env("ALICE_MACAROON")
      },
      AliceLndClient
    )

    {:ok, add_invoice_response} =
      LndClient.add_invoice(
        %Invoice{value_msat: 100_000},
        AliceLndClient
      )

    LndClient.start_link(
      %ConnConfig{
        node_uri: System.get_env("BOB_NODE"),
        cert_path: System.get_env("BOB_CERT"),
        macaroon_path: System.get_env("BOB_MACAROON")
      },
      BobLndClient
    )

    {:ok, send_response} =
      LndClient.send_payment_sync(
        %SendRequest{payment_request: add_invoice_response.payment_request},
        BobLndClient
      )

    assert send_response.payment_error == ""
  end
end
