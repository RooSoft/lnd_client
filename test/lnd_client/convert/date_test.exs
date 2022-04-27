defmodule LndClient.Convert.DateTest do
  use ExUnit.Case

  describe "datetime_to_unix/1" do
    setup do
      %{
        datetime: ~U[2019-10-31 19:59:03Z],
        unix_value: 1_572_551_943
      }
    end

    test "success: converts a datetime to unix timestamp", %{
      datetime: datetime,
      unix_value: unix_value
    } do
      returned_timestamp = LndClient.Convert.Date.datetime_to_unix(datetime)

      assert returned_timestamp == unix_value
    end

    test "success: converts a unix timestamp to a datetime", %{
      datetime: datetime,
      unix_value: unix_value
    } do
      returned_datetime = LndClient.Convert.Date.unix_to_datetime(unix_value)

      assert returned_datetime == datetime
    end
  end
end
