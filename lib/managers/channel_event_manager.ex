defmodule LndClient.Managers.ChannelEventManager do
  use GenServer

  def start_link(state) do
    IO.puts "start link"
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def stop(reason \\ :normal, timeout \\ :infinity) do
    GenServer.stop(__MODULE__, reason, timeout)
  end

  def init(state) do
    IO.puts "init"
    { :ok, state }
  end

  def monitor(pid) do
    IO.puts "monitor"

    GenServer.cast(__MODULE__, { :monitor, %{ pid: pid } })
  end

  def handle_cast({:monitor, %{pid: pid}}, state) do
    IO.puts "Will send channel events to #{inspect pid}"

    response = Lnrpc.Lightning.Stub.subscribe_channel_events(
      state.connection,
      Lnrpc.ChannelEventSubscription.new(),
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
