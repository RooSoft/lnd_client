defmodule LndClient.Calls.GetForwardingHistory do
  def handle(%{
    start_time: start_time,
    end_time: end_time,
    max_events: max_events,
    offset: offset
  }, connection, macaroon) do
    params = %{
      start_time: datetime_to_unix(start_time),
      end_time: datetime_to_unix(end_time),
      num_max_events: max_events,
      index_offset: offset
    }

    Lnrpc.Lightning.Stub.forwarding_history(
      connection,
      Lnrpc.ForwardingHistoryRequest.new(params),
      metadata: %{macaroon: macaroon}
    )
    |> convert_dates
  end

  defp convert_dates { :ok, forwarding_history } do
    forwarding_events = forwarding_history.forwarding_events
    |> Enum.map(fn forward ->
      forward
      |> Map.from_struct()
      |> Map.put(:time, unix_to_datetime(forward.timestamp))
      |> Map.drop([:amt_in, :amt_out, :fee, :timestamp, :timestamp_ns])
    end)

    {
      :ok,
      forwarding_history
      |> Map.put(:forwarding_events, forwarding_events)
      |> Map.from_struct()
    }
  end

  defp convert_dates {:error, _ } = result do
    result
  end

  defp datetime_to_unix nil do
    nil
  end

  defp datetime_to_unix %NaiveDateTime{} = naivedatetime do
    datetime_to_unix(naivedatetime |> DateTime.from_naive!("Etc/UTC"))
  end

  defp datetime_to_unix %DateTime{} = datetime do
    (datetime |> DateTime.to_unix)
  end

  defp unix_to_datetime nil do
    nil
  end

  defp unix_to_datetime timestamp do
    timestamp
    |> DateTime.from_unix!()
    |> DateTime.to_naive()
  end
end
