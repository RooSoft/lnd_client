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
    # TODO testme
    |> ListUtils.append(single_invoice_subscription_registry_child_spec(config))
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

  defp single_invoice_subscription_registry_child_spec(%Config{
         name: name,
         single_invoice_subscriber: single_invoice_subscriber
       }) do
    case single_invoice_subscriber do
      nil ->
        nil

      _ ->
        {
          Registry,
          keys: :unique, name: single_invoice_subscriber_registry_name(name)
        }
    end
  end

  def single_invoice_subscriber_registry_name(lnd_client_name) do
    "LndClient.SingleInvoiceSubscriptionRegistry.#{lnd_client_name}"
    |> String.to_atom()
  end
end
