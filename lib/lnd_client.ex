defmodule LndClient do
  use GenServer
  require Logger

  alias LndClient.Connectivity, as: Connectivity
  alias LndClient.Models.{
    OpenChannelRequest,
    ListInvoiceRequest,
    ListPaymentsRequest
  }
  alias LndClient.Calls.{
    GetForwardingHistory
  }

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def stop(reason \\ :normal, timeout \\ :infinity) do
    GenServer.stop(__MODULE__, reason, timeout)
  end

  def init(_) do
    state = connect()
    |> init_subscriptions

    { :ok, state }
  end

  def init_subscriptions(state) do
    state
    |> Map.put(:subscriptions, %{})
  end

  def connect do
    server = System.get_env("SERVER") || "localhost:10009"
    cert_path = System.get_env("CERT") || "~/.lnd/umbrel.cert"
    macaroon_path = System.get_env("MACAROON") || "~/.lnd/readonly.macaroon"

    Connectivity.connect(server, cert_path, macaroon_path)
  end

  def subscribe_uptime(%{pid: pid}) do
    GenServer.call(__MODULE__, { :subscribe_uptime, %{ pid: pid } })
  end

  def get_info() do
    GenServer.call(__MODULE__, :get_info)
  end

  def get_fee_report() do
    GenServer.call(__MODULE__, :get_fee_report)
  end

  def get_network_info() do
    GenServer.call(__MODULE__, :get_network_info)
  end

  def describe_graph() do
    GenServer.call(__MODULE__, :describe_graph)
  end

  def subscribe_htlc_events(%{pid: pid}) do
    GenServer.call(__MODULE__, { :subscribe_htlc_events, %{ pid: pid } })
  end

  def subscribe_channel_graph(pid) do
    GenServer.call(__MODULE__, { :subscribe_channel_graph, %{ pid: pid } })
  end

  def subscribe_channel_event(%{ pid: pid } ) do
    GenServer.call(__MODULE__, { :subscribe_channel_event, %{ pid: pid } })
  end

  def subscribe_invoices(%{ pid: pid } ) do
    GenServer.call(__MODULE__, { :subscribe_invoices, %{ pid: pid } })
  end

  def get_node_info(pubkey, include_channels \\ false) do
    GenServer.call(__MODULE__, { :get_node_info, %{ pubkey: pubkey, include_channels: include_channels } })
  end

  def get_channels(active_only \\ false) do
    GenServer.call(__MODULE__, { :get_channels, %{ active_only: active_only } })
  end

  def get_closed_channels() do
    GenServer.call(__MODULE__, { :get_closed_channels, %{} })
  end

  def get_channel(id) do
    GenServer.call(__MODULE__, { :get_channel, %{ id: id } })
  end

  def open_channel(%OpenChannelRequest{} = request) do
    GenServer.call(__MODULE__, { :open_channel, request})
  end

  def get_invoices(%ListInvoiceRequest{} = request \\ %ListInvoiceRequest{}) do
    GenServer.call(__MODULE__, { :list_invoices, request })
  end

  def get_payments(%ListPaymentsRequest{} = request \\ %ListPaymentsRequest{}) do
    GenServer.call(__MODULE__, { :list_payments, request })
  end

  def close_channel(%{
    txid: txid,
    output_index: output_index,
    force: force,
    target_conf: target_conf,
    sat_per_vbyte: sat_per_vbyte
    }) do
    GenServer.call(__MODULE__, {
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
    GenServer.call(__MODULE__, :get_node_balance)
  end

  def get_wallet_balance() do
    GenServer.call(__MODULE__, :get_wallet_balance)
  end

  @forwarding_history_defaults %{ max_events: 100, offset: 0, start_time: nil, end_time: nil }
  def get_forwarding_history(parameters \\ []) do
    parameter_map = Enum.into(parameters, @forwarding_history_defaults)

    GenServer.call(__MODULE__, { :get_forwarding_history, parameter_map })
  end

  def update_channel_policy(%{
    txid: txid,
    output_index: output_index,
    base_fee_msat: base_fee_msat,
    fee_rate: fee_rate,
    time_lock_delta: time_lock_delta,
    max_htlc_msat: max_htlc_msat
  }) do
    GenServer.call(__MODULE__, {
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

  def handle_call({ :subscribe_uptime, %{ pid: pid } }, _from, state) do
    { :reply, nil,
      state
      |> Map.put(:uptime_subscription, pid)}
  end

  def handle_call(:get_wallet_balance, _from, state) do
    result = Lnrpc.Lightning.Stub.wallet_balance(
      state.connection,
      Lnrpc.WalletBalanceRequest.new(),
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, result, state}
  end

  def handle_call(:get_fee_report, _from, state) do
    result = Lnrpc.Lightning.Stub.fee_report(
      state.connection,
      Lnrpc.FeeReportRequest.new(),
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, result, state}
  end

  def handle_call(:get_network_info, _from, state) do
    result = Lnrpc.Lightning.Stub.get_network_info(
      state.connection,
      Lnrpc.NetworkInfoRequest.new(),
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, result, state}
  end

  def handle_call(:describe_graph, _from, state) do
    result = Lnrpc.Lightning.Stub.describe_graph(
      state.connection,
      Lnrpc.ChannelGraphRequest.new(),
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, result, state}
  end

  def handle_call({:open_channel, %OpenChannelRequest{} = request}, _from, state) do
    request_map = Map.from_struct(request)

    result = Lnrpc.Lightning.Stub.open_channel(
      state.connection,
      Lnrpc.OpenChannelRequest.new(request_map),
      metadata: %{macaroon: state.macaroon}
    )

    {:reply, result, state}
  end

  def handle_call({:list_invoices, %ListInvoiceRequest{} = request}, _from, state) do
    request_map = Map.from_struct(request)

    result = Lnrpc.Lightning.Stub.list_invoices(
      state.connection,
      Lnrpc.ListInvoiceRequest.new(request_map),
      metadata: %{macaroon: state.macaroon}
    )

    {:reply, result, state}
  end

  def handle_call({:list_payments, %ListPaymentsRequest{} = request}, _from, state) do
    request_map = Map.from_struct(request)

    result = Lnrpc.Lightning.Stub.list_payments(
      state.connection,
      Lnrpc.ListPaymentsRequest.new(request_map),
      metadata: %{macaroon: state.macaroon}
    )

    {:reply, result, state}
  end

  def handle_call({:close_channel, %{
    txid: txid,
    output_index: output_index,
    force: force,
    target_conf: target_conf,
    sat_per_vbyte: sat_per_vbyte
  }}, _from, state) do

    channel_point = %{
      funding_txid: {
        :funding_txid_str, txid
      },
      output_index: output_index
    }

    params = %{
      channel_point: channel_point,
      force: force,
      target_conf: target_conf,
      sat_per_vbyte: sat_per_vbyte
    }

    result = Lnrpc.Lightning.Stub.close_channel(
      state.connection,
      Lnrpc.CloseChannelRequest.new(params),
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, result, state}
  end

  def handle_call(:get_node_balance, _from, state) do
    result = Lnrpc.Lightning.Stub.channel_balance(
      state.connection,
      Lnrpc.ChannelBalanceRequest.new(),
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, result, state}
  end

  def handle_call(:get_info, _from, state) do
    result = Lnrpc.Lightning.Stub.get_info(
      state.connection,
      Lnrpc.GetInfoRequest.new(),
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, result, state}
  end

  def handle_call({ :subscribe_htlc_events = subscription_type, %{ pid: pid } }, _from, state) do
    state
    |> subscribe_to_node_event(pid, subscription_type)

    { :reply, nil,
      state
      |> record_node_event_subscription(subscription_type, pid)}
  end

  def handle_call({ :subscribe_channel_graph = subscription_type, %{ pid: pid } }, _from, state) do
    state
    |> subscribe_to_node_event(pid, subscription_type)

    { :reply, nil,
      state
      |> record_node_event_subscription(subscription_type, pid)}
  end

  def handle_call({ :subscribe_channel_event = subscription_type, %{ pid: pid } }, _from, state) do
    state
    |> subscribe_to_node_event(pid, subscription_type)

    { :reply, nil,
      state
      |> record_node_event_subscription(subscription_type, pid)}
  end


  def handle_call({ :subscribe_invoices = subscription_type, %{ pid: pid } }, _from, state) do
    state
    |> subscribe_to_node_event(pid, subscription_type)

    { :reply, nil,
      state
      |> record_node_event_subscription(subscription_type, pid)}
  end

  def handle_call({ :get_node_info, %{ pubkey: pubkey, include_channels: include_channels } }, _from, state) do
    result = Lnrpc.Lightning.Stub.get_node_info(
      state.connection,
      Lnrpc.NodeInfoRequest.new(pub_key: pubkey, include_channels: include_channels),
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, result, state}
  end

  def handle_call({ :get_channels, %{ active_only: active_only } }, _from, state) do
    result = Lnrpc.Lightning.Stub.list_channels(
      state.connection,
      Lnrpc.ListChannelsRequest.new(active_only: active_only),
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, result, state}
  end

  def handle_call({ :get_closed_channels, %{} }, _from, state) do
    result = Lnrpc.Lightning.Stub.closed_channels(
      state.connection,
      Lnrpc.ClosedChannelsRequest.new(),
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, result, state}
  end

  def handle_call({ :get_channel, %{ id: id } }, _from, state) do
    result = Lnrpc.Lightning.Stub.get_chan_info(
      state.connection,
      Lnrpc.ChanInfoRequest.new(chan_id: id),
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, result, state}
  end

  def handle_call({ :get_forwarding_history, params }, _from, state) do
    { :reply,
      GetForwardingHistory.handle(params, state.connection, state.macaroon),
      state }
  end

  def handle_call({ :update_channel_policy, %{
    txid: txid,
    output_index: output_index,
    base_fee_msat: base_fee_msat,
    fee_rate: fee_rate,
    time_lock_delta: time_lock_delta,
    max_htlc_msat: max_htlc_msat
  }}, _from, state) do

    channel_point = %{
      funding_txid: {
        :funding_txid_str, txid
      },
      output_index: output_index
    }

    request = Lnrpc.PolicyUpdateRequest.new(%{
      scope: {:chan_point, channel_point},
      base_fee_msat: base_fee_msat,
      fee_rate: fee_rate,
      time_lock_delta: time_lock_delta,
      max_htlc_msat: max_htlc_msat,
      min_htlc_msat: 1,
      min_htlc_msat_specified: false
    })

    result = Lnrpc.Lightning.Stub.update_channel_policy(
      state.connection,
      request,
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, result, state}
  end

  def handle_info({:gun_down, _pid, _protocol, _state, _}, state) do
    Logger.warning "LND node is down"

    if (state.uptime_subscription != nil) do
      send(state.uptime_subscription, :down)
    end

    {:noreply, state}
  end

  def handle_info({:gun_up, _pid, _protocol}, state) do
    Logger.warning "LND node is back online, reinitializing LndClient"

    if (state.uptime_subscription != nil) do
      send(state.uptime_subscription, :up)
    end

    # this delay proved necessary because the node was apparently
    # not ready at that point to handle new connections
    :timer.sleep(2000)

    {:noreply, state
      |> reconnect_subscriptions}
  end

  def handle_info(whatever, state) do
    IO.puts "---- got gun trailers ----"
    IO.inspect whatever
    IO.puts "---- end gun trailers ----"

    {:noreply, state}
  end

  def record_node_event_subscription(state, subscription, pid) do
    subscriptions = state.subscriptions
    |> Map.put(subscription, pid)

    state
    |> Map.put(:subscriptions, subscriptions)
  end

  def reconnect_subscriptions(state) do
    Map.keys(state.subscriptions)
    |> Enum.reduce(state, fn subscription_type, state ->
      pid = Map.get(state.subscriptions, subscription_type)

      Logger.info("Reconnection to #{subscription_type}")

      state |> subscribe_to_node_event(pid, subscription_type)
    end)

    state
  end

  def subscribe_to_node_event state, pid, :subscribe_htlc_events do
    state
    |> LndClient.Managers.HtlcEventManager.start_link()

    pid
    |> LndClient.Managers.HtlcEventManager.monitor()

    state
  end

  def subscribe_to_node_event state, pid, :subscribe_channel_event do
    state
    |> LndClient.Managers.ChannelEventManager.start_link()

    pid
    |> LndClient.Managers.ChannelEventManager.monitor()

    state
  end

  def subscribe_to_node_event state, pid, :subscribe_channel_graph do
    state
    |> LndClient.Managers.ChannelGraphManager.start_link()

    pid
    |> LndClient.Managers.ChannelGraphManager.monitor()

    state
  end

  def subscribe_to_node_event state, pid, :subscribe_invoices do
    state
    |> LndClient.Managers.InvoiceEventManager.start_link()

    pid
    |> LndClient.Managers.InvoiceEventManager.monitor()

    state
  end

  def terminate(_reason, state) do # perform cleanup
    Connectivity.disconnect(state.connection)
  end
end
