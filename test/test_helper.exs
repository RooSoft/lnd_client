ExUnit.start()

Mox.defmock(LndClient.MockConnectivity, for: LndClient.Connectivity)

Application.put_env(
  :lnd_client,
  :connectivity,
  LndClient.MockConnectivity
)

Mox.defmock(LndClient.MockLightningServiceHandler, for: LndClient.LightningServiceHandler)

Application.put_env(
  :lnd_client,
  :lightning_service_handler,
  LndClient.MockLightningServiceHandler
)
