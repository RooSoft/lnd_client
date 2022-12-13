defmodule LndClient.InvoiceUpdatesSubscriber do
  @moduledoc """
  A behaviour module for implementing a server to listen to invoice updates.

  All you need to do is define your own module and `handle_subscription_update/1`:

      defmodule MyApp.InvoiceUpdates do
        use LndClient.InvoiceUpdatesSubscriber

        @impl LndClient.InvoiceUpdatesSubscriber
        def handle_subscription_update(invoice) do
          IO.puts("Hello from Tools")
          IO.inspect(invoice)
        end
      end

  Then, you can start this in your application by adding `MyApp.InvoiceUpdates`
  to your Supervisor's children. See `LndClient.child_specs` for an easy way to do this.
  """

  defmacro __using__(_opts) do
    quote do
      require Logger
      @behaviour LndClient.InvoiceUpdatesSubscriber

      @server LndClient.InvoiceUpdatesSubscriber.Server

      def start_link(opts \\ %{}) do
        lnd_server_name = opts[:lnd_server_name] || LndClient.Server
        state = %{lnd_server_name: lnd_server_name, caller: __MODULE__}

        GenServer.start_link(@server, state, name: get_server_name())
      end

      def start(opts \\ %{}) do
        lnd_server_name = opts[:lnd_server_name] || LndClient.Server
        state = %{lnd_server_name: lnd_server_name, caller: __MODULE__}

        GenServer.start(@server, state, name: get_server_name())
      end

      def stop(reason \\ :normal, timeout \\ :infinity) do
        GenServer.stop(get_server_name(), reason, timeout)
      end

      def handle_subscription_update(invoice) do
        Logger.info("Got an update for invoice with payment_request: #{invoice.payment_request}")
      end

      def get_add_index do
        nil
      end

      defoverridable handle_subscription_update: 1, get_add_index: 0

      defp get_server_name do
        "#{inspect(__MODULE__)}.Server" |> String.to_atom()
      end
    end
  end

  @callback handle_subscription_update(Lnrpc.Invoice.t()) :: any()
end
