defmodule LndClient.Tools.InvoiceUpdates do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def stop(reason \\ :normal, timeout \\ :infinity) do
    GenServer.stop(__MODULE__, reason, timeout)
  end

  def init(_) do
    LndClient.subscribe_invoices(%{pid: self()})

    {:ok, nil}
  end

  def handle_info(%Lnrpc.Invoice{} = invoice_subscription, state) do
    now = DateTime.utc_now() |> DateTime.to_string()

    IO.puts("---#{now}---")
    IO.inspect(invoice_subscription)

    {:noreply, state}
  end

  def handle_info(event, state) do
    IO.puts("--------- got an unknown event")
    IO.inspect(event)

    {:noreply, state}
  end
end
