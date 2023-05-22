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
      @me __MODULE__

      def start_link(%State{} = state) do
        GenServer.start_link(@server, state, name: )
      end

      def start(%State{} = state) do
        GenServer.start(@server, state)
      end

      def child_spec(%State{} = state) do
        %{id: @me, start: {@me, :start_link, [state]}}
      end

      def handle_subscription_update(invoice) do
        Logger.info("Got an update for invoice with payment_request: #{inspect(invoice)}")
      end

      defoverridable handle_subscription_update: 1

      defp via_tuple(r_hash, lnd_client_name) do
        {:via, Registry, {registry_name(lnd_client_name), r_hash}}
      end

      defp registry_name(lnd_client_name) do
        lnd_client_name
        |> LndClient.Config.single_invoice_subscriber_registry_name()
      end
    end
  end

  @callback handle_subscription_update(Lnrpc.Invoice.t()) :: any()
end
