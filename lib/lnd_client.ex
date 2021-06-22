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

  @forwarding_history_defaults %{ max_events: 100, offset: 0, start_time: nil, end_time: nil }
  def get_forwarding_history(parameters \\ %{}) do
    parameters = Map.merge(@forwarding_history_defaults, parameters)

    GenServer.call(__MODULE__, { :get_forwarding_history, parameters })
  end

  def init(_) do
    server = System.get_env("SERVER") || "localhost:10009"
    cert_path = "~/.lnd/umbrel.cert"
    macaroon_path = "~/.lnd/readonly.macaroon"

    state = Connectivity.connect(server, cert_path, macaroon_path)

    { :ok, state }
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
