defmodule LndClient.SingleInvoiceSubscription.DynamicSupervisor do
  use DynamicSupervisor
  @me __MODULE__

  alias Invoicesrpc.SubscribeSingleInvoiceRequest

  def start_link(%{name: name} = args) do
    IO.puts("Args in DynamicSupervisor:")
    IO.inspect(args)
    DynamicSupervisor.start_link(__MODULE__, :no_args, name: name)
  end

  def init(:no_args) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  # TODO testme
  def add_subscriber(
        lnd_server_name,
        subscriber_module,
        %SubscribeSingleInvoiceRequest{} = request
      ) do
    state = %LndClient.SingleInvoiceUpdatesSubscriber.State{
      lnd_server_name: lnd_server_name,
      request: request,
      callback_func: &subscriber_module.handle_subscription_update/1
    }

    {:ok, _pid} =
      DynamicSupervisor.start_child(
        custom_server_name(lnd_server_name),
        {subscriber_module, state}
        # %{
        #   id: subscriber_module,
        #   start: {
        #     subscriber_module,
        #     :start_link,
        #     [
        #       %LndClient.SingleInvoiceUpdatesSubscriber.State{
        #         lnd_server_name: lnd_server_name,
        #         request: request,
        #         callback_func: &subscriber_module.handle_subscription_update/1
        #       }
        #     ]
        #   }
        # }
      )
  end

  # TODO testme
  def child_spec(lnd_server_name) do
    dynamic_supervisor_name = custom_server_name(lnd_server_name)

    %{
      id: dynamic_supervisor_name,
      start: {
        @me,
        :start_link,
        [
          %{
            name: dynamic_supervisor_name,
            extra_arguments: %{lnd_server_name: lnd_server_name}
          }
        ]
      }
    }
  end

  defp custom_server_name(lnd_server_name) do
    "#{inspect(__MODULE__)}.#{lnd_server_name}" |> String.to_atom()
  end
end
