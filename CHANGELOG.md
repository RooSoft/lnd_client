# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `LndClient.InvoiceUpdatesSubscriber` behaviour module for easy subscription to invoices
- `decode_payment_request` to decode a payment request
- named LndClient GenServers to connect to multiple LNDs
- the following methods accept the GenServer name, which defaults to `LndClient.Server` if not supplied:
  - `start_link`
  - `get_info`
  - `get_fee_report`
  - `get_network_info`
  - `describe_graph`
  - `subscribe_htlc_events`
  - `subscribe_channel_graph`
  - `subscribe_channel_event`
  - `subscribe_invoices`
  - `get_node_info`
  - `get_channels`
  - `get_closed_channels`
  - `get_channel`
  - `open_channel`
  - `get_invoices`
  - `get_payments`
  - `add_invoice`
  - `send_payment_sync`
  - `close_channel`
  - `get_node_balance`
  - `get_wallet_balance`
  - `get_forwarding_history`
  - `decode_payment_request`
  - `update_channel_policy`
- `.add_hold_invoice`

### Changed
- `LndClient.child_spec` accepts a keyword list. see "How to use it with a Supervisor" in the [README](/README.md#how-to-use-it-with-a-supervisor).
- `LndClient.get_node_info` accepts `Lnrpc.NodeInfoRequest` as the first argument.
- `LndClient.start_link` and `LndClient.start` accept `LndClient.ConnConfig` struct
- Remove `LndClient.connect` (`LndClient` connects automatically to LND when it starts up)
