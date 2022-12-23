defmodule LndClient.ConfigTest do
  use ExUnit.Case
  alias LndClient.Config

  test "subscriber_child_specs/1 returns child specs of subscriber modules when given" do
    config = %Config{invoice_subscriber: TestInvoiceSubscriber, name: :bob}

    resulting_child_specs = config |> Config.subscriber_child_specs()

    expected_child_specs = [Config.subscriber_child_spec(config, :invoice_subscriber)]

    assert resulting_child_specs == expected_child_specs
  end

  test "subscriber_child_specs/1 ignores nil subscribers" do
    config = %Config{}

    resulting_child_specs = config |> Config.subscriber_child_specs()

    assert resulting_child_specs == []
  end

  test "subscriber_child_spec(:invoice_subscriber) given a module returns a valid child_spec" do
    config = %Config{invoice_subscriber: TestInvoiceSubscriber, name: :alice}

    expected_child_spec = %{
      id: TestInvoiceSubscriber,
      start: {TestInvoiceSubscriber, :start_link, [%{lnd_server_name: :alice}]}
    }

    resulting_child_spec =
      config
      |> Config.subscriber_child_spec(:invoice_subscriber)

    assert resulting_child_spec == expected_child_spec
  end

  test "subscriber_child_spec(:invoice_subscriber) not given a module returns nil" do
    config = %Config{}

    resulting_config = config |> Config.subscriber_child_spec(:invoice_subscriber)

    assert resulting_config == nil
  end
end
