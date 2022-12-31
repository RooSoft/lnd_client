defmodule LndClient.InvoiceUpdatesSubscriber.Impl do
  require Logger

  alias LndClient.Handlers
  alias Invoicesrpc.SubscribeSingleInvoiceRequest
  alias LndClient.SingleInvoiceUpdatesSubscriber.State

  def stream_invoices(
        %State{lnd_server_name: lnd_server_name, request: request, callback_func: callback_func} =
          state
      ) do
    lnd_client_state = LndClient.get_state(lnd_server_name)

    Handlers.lightning_service_handler().subscribe_invoices(
      request,
      lnd_client_state.grpc_channel,
      lnd_client_state.macaroon
    )
    |> handle_response(callback_func)
  end

  defp handle_response(response, callback_func) do
    case response do
      {:ok, stream} ->
        stream |> decode_stream(to: callback_func)

      {:error, %GRPC.RPCError{status: 2}} ->
        Logger.warn("Disconnected from invoice events")

      {:error, error} ->
        Logger.error("Unknown invoice GRPC error")
        IO.inspect(error)
    end
  end

  defp decode_stream(stream, opts \\ []) do
    {:ok, callback_func} = Keyword.fetch(opts, :to)

    stream
    |> Enum.each(fn
      {:ok, invoice} ->
        callback_func.(invoice)

      {:error, _details} ->
        IO.puts("Error while decoding stream")
    end)
  end
end
