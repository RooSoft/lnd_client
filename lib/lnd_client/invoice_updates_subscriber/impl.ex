defmodule LndClient.InvoiceUpdatesSubscriber.Impl do
  require Logger

  alias LndClient.Handlers
  alias Lnrpc.InvoiceSubscription

  def set_lnd_connection_details(%{lnd_server_name: lnd_server_name} = state) do
    lnd_client_state = LndClient.get_state(lnd_server_name)

    state
    |> Map.put(:grpc_channel, lnd_client_state.grpc_channel)
    |> Map.put(:macaroon, lnd_client_state.macaroon)
  end

  def stream_invoices(%{caller: caller, grpc_channel: grpc_channel, macaroon: macaroon}) do
    Handlers.lightning_service_handler().subscribe_invoices(
      get_invoice_subscription(caller),
      grpc_channel,
      macaroon
    )
    |> handle_response(caller)
  end

  defp handle_response(response, caller) do
    case response do
      {:ok, stream} ->
        stream |> decode_stream(to: caller)

      {:error, %GRPC.RPCError{status: 2}} ->
        Logger.warn("Disconnected from invoice events")

      {:error, error} ->
        Logger.error("Unknown invoice GRPC error")
        IO.inspect(error)
    end
  end

  defp decode_stream(stream, opts \\ []) do
    {:ok, caller} = Keyword.fetch(opts, :to)

    stream
    |> Enum.each(fn
      {:ok, invoice} ->
        caller.handle_subscription_update(invoice)

      {:error, _details} ->
        IO.puts("Error while decoding stream")
    end)
  end

  defp get_invoice_subscription(caller) do
    InvoiceSubscription.new(add_index: caller.get_add_index())
  end
end
