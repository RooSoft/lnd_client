defmodule LndClient.Tools.GraphUpdates do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def stop(reason \\ :normal, timeout \\ :infinity) do
    GenServer.stop(__MODULE__, reason, timeout)
  end

  def init(_) do
    LndClient.subscribe_channel_graph(%{pid: self()})

    {:ok, nil}
  end

  def handle_info(%Lnrpc.GraphTopologyUpdate{} = graph_topology_update, state) do
    now = DateTime.utc_now() |> DateTime.to_string()

    IO.puts("--graph-topology-update----#{now}---")
    IO.inspect(graph_topology_update)

    {:noreply, state}
  end

  def handle_info(event, state) do
    IO.puts("--------- got an unknown event")
    IO.inspect(event)

    {:noreply, state}
  end
end
