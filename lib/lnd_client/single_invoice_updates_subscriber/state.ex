defmodule LndClient.SingleInvoiceUpdatesSubscriber.State do
  defstruct [:lnd_server_name, :request, :callback_func]
end
