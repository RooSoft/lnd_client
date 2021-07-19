defmodule LndClient.Tools.ChannelUpdates do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def stop(reason \\ :normal, timeout \\ :infinity) do
    GenServer.stop(__MODULE__, reason, timeout)
  end

  def init(_) do
    LndClient.subscribe_channel_event(%{pid: self()})

    { :ok, nil }
  end

  def handle_info(%Lnrpc.ChannelEventUpdate{} = channel_event_update, state) do
    now = DateTime.utc_now |> DateTime.to_string

    IO.puts "---#{now}---"
    IO.inspect channel_event_update

    {:noreply, state}
  end

  def handle_info(event, state) do
    IO.puts "--------- got an unknown event"
    IO.inspect event

    {:noreply, state}
  end
end
