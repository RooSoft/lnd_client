defmodule LndClient.Convert.Date do
  def datetime_to_unix(nil) do
    nil
  end

  def datetime_to_unix(%DateTime{} = datetime) do
    datetime |> DateTime.to_unix()
  end

  def unix_to_datetime(nil) do
    nil
  end

  def unix_to_datetime(timestamp) do
    timestamp
    |> DateTime.from_unix!()
  end
end
