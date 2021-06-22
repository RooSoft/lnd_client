defmodule LndClient.Managers.HtlcEventManager do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def stop(reason \\ :normal, timeout \\ :infinity) do
    GenServer.stop(__MODULE__, reason, timeout)
  end

  def init(state) do
    { :ok, state }
  end

  def monitor(pid) do
    GenServer.cast(__MODULE__, { :monitor, %{ pid: pid } })
  end

  def handle_cast({:monitor, %{pid: pid}}, state) do
    IO.puts "Will send htlc events to #{inspect pid}"

    response = Routerrpc.Router.Stub.subscribe_htlc_events(
      state.connection,
      Routerrpc.SubscribeHtlcEventsRequest.new(),
      metadata: %{macaroon: state.macaroon}
    )

    case response do
      { :ok, stream } ->
        stream
        |> decode_stream(pid)

      { :error, error } ->
        IO.puts "Error receiving stream"
        IO.inspect error
    end

    {:noreply, state}
  end

  def decode_stream stream, pid do
    stream
    |> Enum.each(fn
      {:ok, event} ->
        send(pid, event)

      {:error, _details} ->
        IO.puts "Error while decoding stream"
    end)
  end
end
