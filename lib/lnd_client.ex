defmodule LndClient do
  use GenServer
  alias LndClient.Connectivity, as: Connectivity

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def stop(reason \\ :normal, timeout \\ :infinity) do
    GenServer.stop(__MODULE__, reason, timeout)
  end

  def get_info() do
    GenServer.call(__MODULE__, :get_info)
  end

  def get_fee_report() do
    GenServer.call(__MODULE__, :get_fee_report)
  end

  def get_forwarding_history() do
    GenServer.call(__MODULE__, :get_forwarding_history)
  end

  def get_network_info() do
    GenServer.call(__MODULE__, :get_network_info)
  end

  def subscribe_htlc_events(pid) do
    GenServer.call(__MODULE__, { :subscribe_htlc_events, %{ pid: pid } })
  end

  def subscribe_channel_graph(pid) do
    GenServer.call(__MODULE__, { :subscribe_channel_graph, %{ pid: pid } })
  end

  def get_node_info(pubkey, include_channels \\ false) do
    GenServer.call(__MODULE__, { :get_node_info, %{ pubkey: pubkey, include_channels: include_channels } })
  end

  def get_channels(active_only \\ false) do
    GenServer.call(__MODULE__, { :get_channels, %{ active_only: active_only } })
  end

  def get_channel(id) do
    GenServer.call(__MODULE__, { :get_channel, %{ id: id } })
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
  def get_forwarding_history(parameters \\ %{}) do
    parameters = Map.merge(@forwarding_history_defaults, parameters)

    GenServer.call(__MODULE__, { :get_forwarding_history, parameters })
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

  def init(_) do
    server = System.get_env("SERVER") || "localhost:10009"
    cert_path = System.get_env("CERT") || "~/.lnd/umbrel.cert"
    macaroon_path = System.get_env("MACAROON") || "~/.lnd/readonly.macaroon"

    state = Connectivity.connect(server, cert_path, macaroon_path)

    { :ok, state }
  end

  def handle_call(:get_wallet_balance, _from, state) do
    { :ok, wallet_info } = Lnrpc.Lightning.Stub.wallet_balance(
      state.connection,
      Lnrpc.WalletBalanceRequest.new(),
      metadata: %{macaroon: state.macaroon}
    )
    { :reply, wallet_info, state}
  end

  def handle_call(:get_fee_report, _from, state) do
    { :ok, report } = Lnrpc.Lightning.Stub.fee_report(
      state.connection,
      Lnrpc.FeeReportRequest.new(),
      metadata: %{macaroon: state.macaroon}
    )
    { :reply, report, state}
  end

  def handle_call(:get_forwarding_history, _from, state) do
    { :ok, history } = Lnrpc.Lightning.Stub.forwarding_history(
      state.connection,
      Lnrpc.ForwardingHistoryRequest.new(),
      metadata: %{macaroon: state.macaroon}
    )
    { :reply, history, state}
  end

  def handle_call(:get_network_info, _from, state) do
    { :ok, network_info } = Lnrpc.Lightning.Stub.get_network_info(
      state.connection,
      Lnrpc.NetworkInfoRequest.new(),
      metadata: %{macaroon: state.macaroon}
    )
    { :reply, network_info, state}
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

    output = Lnrpc.Lightning.Stub.close_channel(
      state.connection,
      Lnrpc.CloseChannelRequest.new(params),
      metadata: %{macaroon: state.macaroon}
    )

    case output do
      { :ok, channel } -> { :reply, IO.inspect(channel), state}
      { :error, error } -> IO.inspect error
    end
  end

  def handle_call(:get_node_balance, _from, state) do
    { :ok, balance_info } = Lnrpc.Lightning.Stub.channel_balance(
      state.connection,
      Lnrpc.ChannelBalanceRequest.new(),
      metadata: %{macaroon: state.macaroon}
    )
    { :reply, balance_info, state}
  end

  def handle_call(:get_info, _from, state) do
    { :ok, info } = Lnrpc.Lightning.Stub.get_info(
      state.connection,
      Lnrpc.GetInfoRequest.new(),
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, info, state}
  end

  def handle_call({ :subscribe_htlc_events, %{ pid: pid } }, _from, state) do
    state
    |> LndClient.Managers.HtlcEventManager.start_link()

    pid
    |> LndClient.Managers.HtlcEventManager.monitor()

    { :reply, nil, state}
  end

  def handle_call({ :subscribe_channel_graph, %{ pid: pid } }, _from, state) do
    state
    |> LndClient.Managers.ChannelGraphManager.start_link()

    pid
    |> LndClient.Managers.ChannelGraphManager.monitor()

    { :reply, nil, state}
  end

  def handle_call({ :get_node_info, %{ pubkey: pubkey, include_channels: include_channels } }, _from, state) do
    { :ok, node_info } = Lnrpc.Lightning.Stub.get_node_info(
      state.connection,
      Lnrpc.NodeInfoRequest.new(pub_key: pubkey, include_channels: include_channels),
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, node_info, state}
  end

  def handle_call({ :get_channels, %{ active_only: active_only } }, _from, state) do
    { :ok, channels } = Lnrpc.Lightning.Stub.list_channels(
      state.connection,
      Lnrpc.ListChannelsRequest.new(active_only: active_only),
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, channels, state}
  end

  def handle_call({ :get_channel, %{ id: id } }, _from, state) do
    { :ok, channel } = Lnrpc.Lightning.Stub.get_chan_info(
      state.connection,
      Lnrpc.ChanInfoRequest.new(chan_id: id),
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, channel, state}
  end

  def handle_call({ :get_forwarding_history, %{
      start_time: start_time,
      end_time: end_time,
      max_events: max_events,
      offset: offset
    } }, _from, state) do
    params = %{
      start_time: datetime_to_unix(start_time),
      end_time: datetime_to_unix(end_time),
      num_max_events: max_events,
      index_offset: offset
    }

    { :ok, forwards } = Lnrpc.Lightning.Stub.forwarding_history(
      state.connection,
      Lnrpc.ForwardingHistoryRequest.new(params),
      metadata: %{macaroon: state.macaroon}
    )

    { :reply, forwards, state}
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

    output = Lnrpc.Lightning.Stub.update_channel_policy(
      state.connection,
      request,
      metadata: %{macaroon: state.macaroon}
    )

    case output do
      { :ok, channel } -> { :reply, IO.inspect(channel), state}
      { :error, error } -> IO.inspect error
    end
  end

  def datetime_to_unix nil do
    nil
  end

  def datetime_to_unix %NaiveDateTime{} = naivedatetime do
    datetime_to_unix(naivedatetime |> DateTime.from_naive!("Etc/UTC"))
  end

  def datetime_to_unix %DateTime{} = datetime do
    (datetime |> DateTime.to_unix)
  end

  def terminate(_reason, state) do # perform cleanup
  Connectivity.disconnect(state.connection)
  end
end
