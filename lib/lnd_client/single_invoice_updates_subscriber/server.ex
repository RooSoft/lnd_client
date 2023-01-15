defmodule LndClient.SingleInvoiceUpdatesSubscriber.Server do
  use GenServer

  alias LndClient.Config
  alias LndClient.SingleInvoiceUpdatesSubscriber.{Impl, State}

  require Logger

  def init(%State{} = state) do
    GenServer.cast(self(), :register)
    GenServer.cast(self(), :start_subscription)

    {:ok, state}
  end

  def handle_cast(:register, %State{lnd_server_name: lnd_server_name} = state) do
    registry_name = Config.single_invoice_subscriber_registry_name(lnd_server_name)
    {:noreply, state}
  end

  def handle_cast(:start_subscription, state) do
    Logger.info("#{inspect(__MODULE__)}: monitoring #{inspect(state.request)}...")

    Impl.stream_invoices(state)

    {:noreply, state}
  end
end
