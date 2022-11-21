defmodule LndClient.Calls.GetForwardingHistory do
  alias LndClient.Convert

  def handle(params, connection, macaroon) do
    params
    |> convert_params
    |> call_node(connection, macaroon)
    |> convert_result
  end

  defp convert_params(%{
         start_time: start_time,
         end_time: end_time,
         max_events: max_events,
         offset: offset
       }) do
    %{
      start_time: Convert.Date.datetime_to_unix(start_time),
      end_time: Convert.Date.datetime_to_unix(end_time),
      num_max_events: max_events,
      index_offset: offset
    }
  end

  defp call_node(params, connection, macaroon) do
    Lnrpc.Lightning.Stub.forwarding_history(
      connection,
      Lnrpc.ForwardingHistoryRequest.new(params),
      metadata: %{macaroon: macaroon}
    )
  end

  defp convert_result({:ok, forwarding_history}) do
    forwarding_history.forwarding_events
    |> convert_forwarding_events
    |> create_return_value(forwarding_history)
  end

  defp convert_result({:error, _} = result) do
    result
  end

  defp convert_forwarding_events(forwarding_events) do
    forwarding_events
    |> Enum.map(&convert_forwarding_event/1)
  end

  defp create_return_value(forwarding_events, forwarding_history) do
    {
      :ok,
      forwarding_history
      |> Map.from_struct()
      |> Map.put(:forwarding_events, forwarding_events)
    }
  end

  defp convert_forwarding_event(forwarding_event) do
    forwarding_event
    |> Map.from_struct()
    |> Map.put(:time, Convert.Date.unix_to_datetime(forwarding_event.timestamp))
    |> Map.drop([:amt_in, :amt_out, :fee, :timestamp])
  end
end
