defmodule LndClient.SingleInvoiceUpdatesSubscriber.Server do
  use GenServer

  alias LndClient.SingleInvoiceUpdatesSubscriber.{Impl, State}

  require Logger

  def init(
        %{
          lnd_server_name: lnd_server_name,
          subscribe_single_invoice_request: subscribe_single_invoice_request
        } = state
      ) do
    GenServer.cast(self(), :start_subscription)

    {:ok, state}
  end

  def handle_cast(:start_subscription, state) do
    Logger.info("#{inspect(__MODULE__)}: monitoring for invoices...")

    Impl.stream_invoices(state)

    {:noreply, state}
  end
end
