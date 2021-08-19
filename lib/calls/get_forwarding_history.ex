defmodule LndClient.Calls.GetForwardingHistory do
  alias LndClient.Convert

  def handle(params, connection, macaroon) do
    params
    |> convert_params
    |> call_node(connection, macaroon)
    |> convert_result
  end

  defp convert_params %{
    start_time: start_time,
    end_time: end_time,
    max_events: max_events,
    offset: offset
  } do
    %{
      start_time: Convert.Date.datetime_to_unix(start_time),
      end_time: Convert.Date.datetime_to_unix(end_time),
      num_max_events: max_events,
      index_offset: offset
    }
  end

  defp call_node params, connection, macaroon do
    Lnrpc.Lightning.Stub.forwarding_history(
      connection,
      Lnrpc.ForwardingHistoryRequest.new(params),
      metadata: %{macaroon: macaroon}
    )
  end

  defp convert_result { :ok, forwarding_history } do
    forwarding_events = forwarding_history.forwarding_events
    |> Enum.map(fn forward ->
      forward
      |> Map.from_struct()
      |> Map.put(:time, Convert.Date.unix_to_datetime(forward.timestamp))
      |> Map.drop([:amt_in, :amt_out, :fee, :timestamp, :timestamp_ns])
    end)

    {
      :ok,
      forwarding_history
      |> Map.put(:forwarding_events, forwarding_events)
      |> Map.from_struct()
    }
  end

  defp convert_result {:error, _ } = result do
    result
  end
end
