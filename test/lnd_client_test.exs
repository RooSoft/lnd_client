defmodule LndClientTest do
  use ExUnit.Case

  test "child_spec is defined make it cleaner starting from a Supervisor" do
    expected_result = %{
      id: LndClient,
      start: {LndClient, :start_link, ["1"]}
    }

    assert LndClient.child_spec("1") == expected_result
  end
end
