defmodule LndClient do
  require Logger

  alias LndClient.{
    Connectivity,
    ConnConfig,
  }
  alias LndClient.Models.{
    OpenChannelRequest,
    ListInvoiceRequest,
    ListPaymentsRequest
  }
  alias LndClient.Calls.{
    GetForwardingHistory
  }
  alias Lnrpc.{
    Invoice,
    SendRequest,
  }

  @long_timeout 500_000
  @server LndClient.Server

  def start(%ConnConfig{} = conn_config) do
    GenServer.start(@server, init_state(conn_config), name: @server)
  end

  @doc """
  Starts a process which connects to an LND instance.

  ## Examples

      iex> {:ok, pid} = %LndClient.Config.new{
        node_uri: "127.0.0.1:10001",
        cert_path: "/path/to/tls.cert",
        macaroon_path: "/path/to/readonly.macaroon"
      } |> LndClient.start_link()

  You may pass something like the following to a Supervisor:

  ```ex
  {
    LndClient,
    %LndClient.ConnConfig{
      node_uri: System.get_env("NODE_URI"),
      cert_path: System.get_env("CERT_PATH"),
      macaroon_path: System.get_env("MACAROON_PATH")
    },
  },
  ```
  """
  def start_link(%ConnConfig{} = conn_config) do
    GenServer.start_link(@server, init_state(conn_config), name: @server)
  end

  def stop(reason \\ :normal, timeout \\ :infinity) do
    GenServer.stop(@server, reason, timeout)
  end

  def subscribe_uptime(%{pid: pid}) do
    GenServer.call(@server, { :subscribe_uptime, %{ pid: pid } })
  end

  def get_info() do
    GenServer.call(@server, :get_info)
  end

  def get_fee_report() do
    GenServer.call(@server, :get_fee_report)
  end

  def get_network_info() do
    GenServer.call(@server, :get_network_info)
  end

  def describe_graph() do
    GenServer.call(@server, :describe_graph, @long_timeout)
  end

  def subscribe_htlc_events(%{pid: pid}) do
    GenServer.call(@server, { :subscribe_htlc_events, %{ pid: pid } })
  end

  def subscribe_channel_graph(pid) do
    GenServer.call(@server, { :subscribe_channel_graph, %{ pid: pid } })
  end

  def subscribe_channel_event(%{ pid: pid } ) do
    GenServer.call(@server, { :subscribe_channel_event, %{ pid: pid } })
  end

  def subscribe_invoices(%{ pid: pid } ) do
    GenServer.call(@server, { :subscribe_invoices, %{ pid: pid } })
  end

  def get_node_info(pubkey, include_channels \\ false) do
    GenServer.call(@server, { :get_node_info, %{ pubkey: pubkey, include_channels: include_channels } })
  end

  def get_channels(active_only \\ false) do
    GenServer.call(@server, { :get_channels, %{ active_only: active_only } })
  end

  def get_closed_channels() do
    GenServer.call(@server, { :get_closed_channels, %{} })
  end

  def get_channel(id) do
    GenServer.call(@server, { :get_channel, %{ id: id } })
  end

  def open_channel(%OpenChannelRequest{} = request) do
    GenServer.call(@server, { :open_channel, request})
  end

  def get_invoices(%ListInvoiceRequest{} = request \\ %ListInvoiceRequest{}) do
    GenServer.call(@server, { :list_invoices, request })
  end

  def get_payments(%ListPaymentsRequest{} = request \\ %ListPaymentsRequest{}) do
    GenServer.call(@server, { :list_payments, request })
  end

  @doc """
  Takes an %Lnrpc.Invoice and adds that to LND.

  ## Examples

      iex> Lnrpc.Invoice.new(value_msat: 100_000) |> LndClient.add_invoice
      {:ok, %Lnrpc.AddInvoiceResponse{}}

  """
  def add_invoice(%Invoice{} = invoice) do
    GenServer.call(@server, { :add_invoice, invoice })
  end

  @doc """
  Takes a %Lnrpc.SendRequest and attempts to pay the invoice

  ## Examples

      iex> Lnrpc.SendRequest.new(payment_request: "lnbcrt500paymentrequest") |> LndClient.send_payment_sync
      { :ok, %Lnrpc.SendResponse{} }

  """
  def send_payment_sync(%SendRequest{} = send_request) do
    GenServer.call(@server, { :send_payment_sync, send_request })
  end

  def close_channel(%{
    txid: txid,
    output_index: output_index,
    force: force,
    target_conf: target_conf,
    sat_per_vbyte: sat_per_vbyte
    }) do
    GenServer.call(@server, {
      :close_channel, %{
        txid: txid,
        output_index: output_index,
        force: force,
        target_conf: target_conf,
        sat_per_vbyte: sat_per_vbyte
      }
    })
  end

  def get_node_balance() do
    GenServer.call(@server, :get_node_balance)
  end

  def get_wallet_balance() do
    GenServer.call(@server, :get_wallet_balance)
  end

  @forwarding_history_defaults %{ max_events: 100, offset: 0, start_time: nil, end_time: nil }
  def get_forwarding_history(parameters \\ []) do
    parameter_map = Enum.into(parameters, @forwarding_history_defaults)

    GenServer.call(@server, { :get_forwarding_history, parameter_map })
  end

  def update_channel_policy(%{
    txid: txid,
    output_index: output_index,
    base_fee_msat: base_fee_msat,
    fee_rate: fee_rate,
    time_lock_delta: time_lock_delta,
    max_htlc_msat: max_htlc_msat
  }) do
    GenServer.call(@server, {
      :update_channel_policy,
      %{
        txid: txid,
        output_index: output_index,
        base_fee_msat: base_fee_msat,
        fee_rate: fee_rate,
        time_lock_delta: time_lock_delta,
        max_htlc_msat: max_htlc_msat
      }
    })
  end

  defp init_state(conn_config) do
    %{
      subscriptions: %{},
      conn_config: conn_config,
    }
  end

end
