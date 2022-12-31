defmodule LndClient.Config do
  alias LndClient.{Config, ConnConfig}

  @default_lnd_server LndClient.Server
  @subscriber_keys [:invoice_subscriber, :single_invoice_subscriber]
  @single_invoice_dynamic_supervisor LndClient.SingleInvoiceSubscription.DynamicSupervisor

  defstruct(
    conn_config: %ConnConfig{},
    name: @default_lnd_server,
    invoice_subscriber: nil,
    single_invoice_subscriber: nil
  )

  def subscriber_child_specs(%Config{} = config) do
    Enum.into(
      @subscriber_keys,
      [],
      fn subscriber_key ->
        config |> subscriber_child_spec(subscriber_key)
      end
    )
    |> Enum.reject(&is_nil/1)
  end

  def subscriber_child_spec(
        %Config{invoice_subscriber: invoice_subscriber, name: name},
        :invoice_subscriber
      ) do
    case invoice_subscriber do
      nil ->
        nil

      _ ->
        %{
          id: invoice_subscriber,
          start: {invoice_subscriber, :start_link, [%{lnd_server_name: name}]}
        }
    end
  end

  def subscriber_child_spec(
        %Config{single_invoice_subscriber: invoice_subscriber, name: name},
        :single_invoice_subscriber
      ) do
    case invoice_subscriber do
      nil -> nil
      _ -> @single_invoice_dynamic_supervisor.child_spec(name)
    end
  end
end
