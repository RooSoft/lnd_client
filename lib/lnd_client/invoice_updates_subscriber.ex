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
  to your Supervisor's children.
  """

  defmacro __using__(_opts) do
    quote do
      require Logger
      use GenServer
      @behaviour LndClient.InvoiceUpdatesSubscriber.Behaviour

      def start_link(_opts \\ []) do
        GenServer.start_link(__MODULE__, nil, name: __MODULE__)
      end

      def start(opts \\ %{}) do
        lnd_server_name = opts[:lnd_server_name] || LndClient.Server
        state = %{lnd_server_name: lnd_server_name, caller: __MODULE__}

        GenServer.start(@server, state, name: get_server_name())
      end

      def stop(reason \\ :normal, timeout \\ :infinity) do
        GenServer.stop(__MODULE__, reason, timeout)
      end

      def init(_) do
        LndClient.subscribe_invoices(%{pid: self()})

        {:ok, nil}
      end

      def handle_info(%Lnrpc.Invoice{} = invoice, state) do
        now = DateTime.utc_now() |> DateTime.to_string()

        IO.puts("---#{now}---")
        IO.inspect(invoice)

        handle_subscription_update(invoice)

        {:noreply, state}
      end

      def handle_info(event, state) do
        IO.puts("--------- got an unknown event")
        IO.inspect(event)

        {:noreply, state}
      end

      def handle_subscription_update(invoice) do
        Logger.info("Got an update for invoice with payment_request: #{invoice.payment_request}")
      end

      defoverridable handle_subscription_update: 1
    end
  end

  @callback handle_subscription_update(Lnrpc.Invoice.t()) :: any()
end
