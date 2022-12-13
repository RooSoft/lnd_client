defmodule LndClient.Tools.InvoiceUpdates do
  use LndClient.InvoiceUpdatesSubscriber

  @impl LndClient.InvoiceUpdatesSubscriber
  def handle_subscription_update(invoice) do
    IO.puts("Hello from Tools, starting from add index #{get_add_index()}")
    IO.inspect(invoice)
  end

  def get_add_index do
    31
  end
end
