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

    result = Lnrpc.Lightning.Stub.forwarding_history(
      connection,
      Lnrpc.ForwardingHistoryRequest.new(params),
      metadata: %{macaroon: macaroon}
    )
  end


  def datetime_to_unix nil do
    nil
  end

  def datetime_to_unix %NaiveDateTime{} = naivedatetime do
    datetime_to_unix(naivedatetime |> DateTime.from_naive!("Etc/UTC"))
  end

  def datetime_to_unix %DateTime{} = datetime do
    (datetime |> DateTime.to_unix)
  end
end
