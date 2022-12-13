defmodule LndClient.Tools.InvoiceUpdates do
  use LndClient.InvoiceUpdatesSubscriber

  @impl LndClient.InvoiceUpdatesSubscriber
  def handle_subscription_update(invoice) do
    IO.puts("Hello from Tools")
    IO.inspect(invoice)
  end
end
