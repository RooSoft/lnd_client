defmodule LndClientTest do
  use ExUnit.Case
  doctest LndClient

  test "greets the world" do
    assert LndClient.hello() == :world
  end
end
