defmodule LndClient.Models.OpenChannelRequest do
  defstruct [
    :node_pubkey,
    :local_funding_amount,
    sat_per_vbyte: 5,
    push_sat: nil,
    target_conf: nil,
    private: false,
    csv_delay: 40,
    min_confs: 2,
    min_htlc_msat: nil,
    spend_unconfirmed: false,
    close_address: nil,
    funding_shim: nil
  ]
end
