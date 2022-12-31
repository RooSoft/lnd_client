defmodule LndClient.SingleInvoiceUpdatesSubscriber do
  @moduledoc """
  A behaviour module for implementing a server to listen to invoice updates.

  All you need to do is define your own module and `handle_subscription_update/1`:

      defmodule MyApp.SingleInvoiceUpdates do
        use LndClient.SingleInvoiceUpdatesSubscriber

        @impl LndClient.SingleInvoiceUpdatesSubscriber
        def handle_subscription_update(invoice) do
          IO.puts("Hello from Tools")
          IO.inspect(invoice)
        end
      end

  Then, you can start this in your application by adding `MyApp.SingleInvoiceUpdates`
  to your Supervisor's children. See `LndClient.child_specs` for an easy way to do this.
  """

  defmacro __using__(_opts) do
    quote do
      alias LndClient.SingleInvoiceUpdatesSubscriber.State

      require Logger

      @behaviour LndClient.SingleInvoiceUpdatesSubscriber
      @server LndClient.SingleInvoiceUpdatesSubscriber.Server

      def start_link(%State{} = state) do
        GenServer.start_link(@server, state)
      end

      def start(%State{} = state) do
        GenServer.start(@server, state)
      end

      def handle_subscription_update(invoice) do
        Logger.info("Got an update for invoice with payment_request: #{inspect(invoice)}")
      end

      defoverridable handle_subscription_update: 1
    end
  end

  @callback handle_subscription_update(Lnrpc.Invoice.t()) :: any()
end
