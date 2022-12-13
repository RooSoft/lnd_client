defmodule LndClient.InvoiceUpdatesSubscriber.Server do
  use GenServer

  alias LndClient.InvoiceUpdatesSubscriber.Impl

  require Logger

  def init(%{lnd_server_name: lnd_server_name} = state) do
    GenServer.cast(self(), :set_lnd_client_state)
    GenServer.cast(self(), :start_subscription)

    {:ok, state}
  end

  def handle_cast(:set_lnd_client_state, %{lnd_server_name: lnd_server_name} = state) do
    {:noreply, Impl.set_lnd_connection_details(state)}
  end

  def handle_cast(:start_subscription, state) do
    Logger.info("#{inspect(__MODULE__)}: monitoring for invoices...")

    Impl.stream_invoices(state)

    {:noreply, state}
  end
end
