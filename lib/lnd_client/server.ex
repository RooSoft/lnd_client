defmodule LndClient.Server do
  use GenServer

  require Logger

  alias LndClient.{
    Connectivity
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
    SendRequest
  }

  def init(state) do
    connect_to_lnd(state)
  end

  def handle_call({:subscribe_uptime, %{pid: pid}}, _from, state) do
    {:reply, nil,
     state
     |> Map.put(:uptime_subscription, pid)}
  end

  def handle_call(:get_wallet_balance, _from, state) do
    result =
      Lnrpc.Lightning.Stub.wallet_balance(
        state.grpc_channel,
        Lnrpc.WalletBalanceRequest.new(),
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call(:get_fee_report, _from, state) do
    result =
      Lnrpc.Lightning.Stub.fee_report(
        state.grpc_channel,
        Lnrpc.FeeReportRequest.new(),
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call(:get_network_info, _from, state) do
    result =
      Lnrpc.Lightning.Stub.get_network_info(
        state.grpc_channel,
        Lnrpc.NetworkInfoRequest.new(),
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call(:describe_graph, _from, state) do
    result =
      Lnrpc.Lightning.Stub.describe_graph(
        state.grpc_channel,
        Lnrpc.ChannelGraphRequest.new(),
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call({:open_channel, %OpenChannelRequest{} = request}, _from, state) do
    request_map = Map.from_struct(request)

    result =
      Lnrpc.Lightning.Stub.open_channel(
        state.grpc_channel,
        Lnrpc.OpenChannelRequest.new(request_map),
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call({:add_invoice, %Invoice{} = invoice}, _from, state) do
    result =
      Lnrpc.Lightning.Stub.add_invoice(
        state.grpc_channel,
        invoice,
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call({:send_payment_sync, %SendRequest{} = send_request}, _from, state) do
    result =
      Lnrpc.Lightning.Stub.send_payment_sync(
        state.grpc_channel,
        send_request,
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call({:list_invoices, %ListInvoiceRequest{} = request}, _from, state) do
    request_map = Map.from_struct(request)

    result =
      Lnrpc.Lightning.Stub.list_invoices(
        state.grpc_channel,
        Lnrpc.ListInvoiceRequest.new(request_map),
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call({:list_payments, %ListPaymentsRequest{} = request}, _from, state) do
    request_map = Map.from_struct(request)

    result =
      Lnrpc.Lightning.Stub.list_payments(
        state.grpc_channel,
        Lnrpc.ListPaymentsRequest.new(request_map),
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call(
        {:close_channel,
         %{
           txid: txid,
           output_index: output_index,
           force: force,
           target_conf: target_conf,
           sat_per_vbyte: sat_per_vbyte
         }},
        _from,
        state
      ) do
    channel_point = %{
      funding_txid: {
        :funding_txid_str,
        txid
      },
      output_index: output_index
    }

    params = %{
      channel_point: channel_point,
      force: force,
      target_conf: target_conf,
      sat_per_vbyte: sat_per_vbyte
    }

    result =
      Lnrpc.Lightning.Stub.close_channel(
        state.grpc_channel,
        Lnrpc.CloseChannelRequest.new(params),
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call(:get_node_balance, _from, state) do
    result =
      Lnrpc.Lightning.Stub.channel_balance(
        state.grpc_channel,
        Lnrpc.ChannelBalanceRequest.new(),
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call(:get_info, _from, state) do
    result =
      Lnrpc.Lightning.Stub.get_info(
        state.grpc_channel,
        Lnrpc.GetInfoRequest.new(),
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call({:decode_payment_request, payment_request}, _from, state) do
    result =
      Lnrpc.Lightning.Stub.decode_pay_req(
        state.grpc_channel,
        Lnrpc.PayReqString.new(pay_req: payment_request),
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call({:subscribe_htlc_events = subscription_type, %{pid: pid}}, _from, state) do
    {:reply, nil,
     state
     |> subscribe_to_node_event(pid, subscription_type)
     |> record_node_event_subscription(subscription_type, pid)}
  end

  def handle_call({:subscribe_channel_graph = subscription_type, %{pid: pid}}, _from, state) do
    {:reply, nil,
     state
     |> subscribe_to_node_event(pid, subscription_type)
     |> record_node_event_subscription(subscription_type, pid)}
  end

  def handle_call({:subscribe_channel_event = subscription_type, %{pid: pid}}, _from, state) do
    {:reply, nil,
     state
     |> subscribe_to_node_event(pid, subscription_type)
     |> record_node_event_subscription(subscription_type, pid)}
  end

  def handle_call({:subscribe_invoices = subscription_type, %{pid: pid}}, _from, state) do
    {:reply, nil,
     state
     |> subscribe_to_node_event(pid, subscription_type)
     |> record_node_event_subscription(subscription_type, pid)}
  end

  def handle_call(
        {:get_node_info, %{pubkey: pubkey, include_channels: include_channels}},
        _from,
        state
      ) do
    result =
      Lnrpc.Lightning.Stub.get_node_info(
        state.grpc_channel,
        Lnrpc.NodeInfoRequest.new(pub_key: pubkey, include_channels: include_channels),
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call({:get_channels, %{active_only: active_only}}, _from, state) do
    result =
      Lnrpc.Lightning.Stub.list_channels(
        state.grpc_channel,
        Lnrpc.ListChannelsRequest.new(active_only: active_only),
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call({:get_closed_channels, %{}}, _from, state) do
    result =
      Lnrpc.Lightning.Stub.closed_channels(
        state.grpc_channel,
        Lnrpc.ClosedChannelsRequest.new(),
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call({:get_channel, %{id: id}}, _from, state) do
    result =
      Lnrpc.Lightning.Stub.get_chan_info(
        state.grpc_channel,
        Lnrpc.ChanInfoRequest.new(chan_id: id),
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_call({:get_forwarding_history, params}, _from, state) do
    {:reply, GetForwardingHistory.handle(params, state.grpc_channel, state.macaroon), state}
  end

  def handle_call(
        {:update_channel_policy,
         %{
           txid: txid,
           output_index: output_index,
           base_fee_msat: base_fee_msat,
           fee_rate: fee_rate,
           time_lock_delta: time_lock_delta,
           max_htlc_msat: max_htlc_msat
         }},
        _from,
        state
      ) do
    channel_point = %{
      funding_txid: {
        :funding_txid_str,
        txid
      },
      output_index: output_index
    }

    request =
      Lnrpc.PolicyUpdateRequest.new(%{
        scope: {:chan_point, channel_point},
        base_fee_msat: base_fee_msat,
        fee_rate: fee_rate,
        time_lock_delta: time_lock_delta,
        max_htlc_msat: max_htlc_msat,
        min_htlc_msat: 1,
        min_htlc_msat_specified: false
      })

    result =
      Lnrpc.Lightning.Stub.update_channel_policy(
        state.grpc_channel,
        request,
        metadata: %{macaroon: state.macaroon}
      )

    {:reply, result, state}
  end

  def handle_info({:gun_down, _pid, _protocol, _state, _}, state) do
    Logger.warning("LND node is down")

    if state |> Map.has_key?(:uptime_subscription) do
      send(state.uptime_subscription, :down)
    end

    {:noreply, state}
  end

  def handle_info({:gun_up, _pid, _protocol}, state) do
    Logger.warning("LND node is back online, reinitializing LndClient")

    if state |> Map.has_key?(:uptime_subscription) do
      send(state.uptime_subscription, :up)
    end

    # this delay proved necessary because the node was apparently
    # not ready at that point to handle new grpc_channels
    :timer.sleep(2000)

    {:noreply,
     state
     |> reconnect_subscriptions}
  end

  def handle_info(whatever, state) do
    IO.puts("---- got gun trailers ----")
    IO.inspect(whatever)
    IO.puts("---- end gun trailers ----")

    {:noreply, state}
  end

  def record_node_event_subscription(state, subscription, pid) do
    subscriptions =
      state.subscriptions
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
  end

  def subscribe_to_node_event(state, pid, :subscribe_htlc_events) do
    state
    |> LndClient.Managers.HtlcEventManager.start_link()

    pid
    |> LndClient.Managers.HtlcEventManager.monitor()

    state
  end

  def subscribe_to_node_event(state, pid, :subscribe_channel_event) do
    state
    |> LndClient.Managers.ChannelEventManager.start_link()

    pid
    |> LndClient.Managers.ChannelEventManager.monitor()

    state
  end

  def subscribe_to_node_event(state, pid, :subscribe_channel_graph) do
    state
    |> LndClient.Managers.ChannelGraphManager.start_link()

    pid
    |> LndClient.Managers.ChannelGraphManager.monitor()

    state
  end

  def subscribe_to_node_event(state, pid, :subscribe_invoices) do
    state
    |> LndClient.Managers.InvoiceEventManager.start_link()

    pid
    |> LndClient.Managers.InvoiceEventManager.monitor()

    state
  end

  def terminate(_reason, nil) do
    # no grpc_channel to close
  end

  def terminate(_reason, %{grpc_channel: nil}) do
    # no grpc_channel to close
  end

  # perform cleanup
  def terminate(_reason, %{grpc_channel: grpc_channel}) do
    Connectivity.disconnect(grpc_channel)
  end

  defp connect_to_lnd(state) do
    conn_config = Map.get(state, :conn_config)

    case Connectivity.connect(conn_config) do
      {:ok, %{grpc_channel: grpc_channel, macaroon: macaroon}} ->
        new_state =
          state
          |> Map.put(:grpc_channel, grpc_channel)
          |> Map.put(:macaroon, macaroon)

        {:ok, new_state}

      {:error, error} ->
        {:error, "unable to connect to LND: #{error}"}
    end
  end
end
