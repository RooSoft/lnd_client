defmodule LndClient.Handlers do
  def lightning_service_handler do
    Application.get_env(
      :lnd_client,
      :lightning_service_handler,
      LndClient.LightningServiceHandler
    )
  end

  def invoice_service_handler do
    Application.get_env(
      :lnd_client,
      :invoice_service_handler,
      LndClient.InvoiceServiceHandler
    )
  end
end
