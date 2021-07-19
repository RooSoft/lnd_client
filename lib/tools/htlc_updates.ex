defmodule LndClient.Tools.HtlcUpdates do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def stop(reason \\ :normal, timeout \\ :infinity) do
    GenServer.stop(__MODULE__, reason, timeout)
  end

  def init(_) do
    LndClient.subscribe_htlc_events(%{pid: self()})

    { :ok, nil }
  end

  def handle_info(%Routerrpc.HtlcEvent{} = htlc, state) do
    now = DateTime.utc_now |> DateTime.to_string

    IO.puts "---#{now}---"
    IO.inspect htlc

    {:noreply, state}
  end

  def handle_info(event, state) do
    IO.puts "--------- got an unknown event"
    IO.inspect event

    {:noreply, state}
  end
end
