defmodule Lnrpc.OutputScriptType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :SCRIPT_TYPE_PUBKEY_HASH, 0
  field :SCRIPT_TYPE_SCRIPT_HASH, 1
  field :SCRIPT_TYPE_WITNESS_V0_PUBKEY_HASH, 2
  field :SCRIPT_TYPE_WITNESS_V0_SCRIPT_HASH, 3
  field :SCRIPT_TYPE_PUBKEY, 4
  field :SCRIPT_TYPE_MULTISIG, 5
  field :SCRIPT_TYPE_NULLDATA, 6
  field :SCRIPT_TYPE_NON_STANDARD, 7
  field :SCRIPT_TYPE_WITNESS_UNKNOWN, 8
  field :SCRIPT_TYPE_WITNESS_V1_TAPROOT, 9
end

defmodule Lnrpc.AddressType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :WITNESS_PUBKEY_HASH, 0
  field :NESTED_PUBKEY_HASH, 1
  field :UNUSED_WITNESS_PUBKEY_HASH, 2
  field :UNUSED_NESTED_PUBKEY_HASH, 3
  field :TAPROOT_PUBKEY, 4
  field :UNUSED_TAPROOT_PUBKEY, 5
end

defmodule Lnrpc.CommitmentType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :UNKNOWN_COMMITMENT_TYPE, 0
  field :LEGACY, 1
  field :STATIC_REMOTE_KEY, 2
  field :ANCHORS, 3
  field :SCRIPT_ENFORCED_LEASE, 4
end

defmodule Lnrpc.Initiator do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :INITIATOR_UNKNOWN, 0
  field :INITIATOR_LOCAL, 1
  field :INITIATOR_REMOTE, 2
  field :INITIATOR_BOTH, 3
end

defmodule Lnrpc.ResolutionType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :TYPE_UNKNOWN, 0
  field :ANCHOR, 1
  field :INCOMING_HTLC, 2
  field :OUTGOING_HTLC, 3
  field :COMMIT, 4
end

defmodule Lnrpc.ResolutionOutcome do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :OUTCOME_UNKNOWN, 0
  field :CLAIMED, 1
  field :UNCLAIMED, 2
  field :ABANDONED, 3
  field :FIRST_STAGE, 4
  field :TIMEOUT, 5
end

defmodule Lnrpc.NodeMetricType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :UNKNOWN, 0
  field :BETWEENNESS_CENTRALITY, 1
end

defmodule Lnrpc.InvoiceHTLCState do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :ACCEPTED, 0
  field :SETTLED, 1
  field :CANCELED, 2
end

defmodule Lnrpc.PaymentFailureReason do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :FAILURE_REASON_NONE, 0
  field :FAILURE_REASON_TIMEOUT, 1
  field :FAILURE_REASON_NO_ROUTE, 2
  field :FAILURE_REASON_ERROR, 3
  field :FAILURE_REASON_INCORRECT_PAYMENT_DETAILS, 4
  field :FAILURE_REASON_INSUFFICIENT_BALANCE, 5
end

defmodule Lnrpc.FeatureBit do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :DATALOSS_PROTECT_REQ, 0
  field :DATALOSS_PROTECT_OPT, 1
  field :INITIAL_ROUING_SYNC, 3
  field :UPFRONT_SHUTDOWN_SCRIPT_REQ, 4
  field :UPFRONT_SHUTDOWN_SCRIPT_OPT, 5
  field :GOSSIP_QUERIES_REQ, 6
  field :GOSSIP_QUERIES_OPT, 7
  field :TLV_ONION_REQ, 8
  field :TLV_ONION_OPT, 9
  field :EXT_GOSSIP_QUERIES_REQ, 10
  field :EXT_GOSSIP_QUERIES_OPT, 11
  field :STATIC_REMOTE_KEY_REQ, 12
  field :STATIC_REMOTE_KEY_OPT, 13
  field :PAYMENT_ADDR_REQ, 14
  field :PAYMENT_ADDR_OPT, 15
  field :MPP_REQ, 16
  field :MPP_OPT, 17
  field :WUMBO_CHANNELS_REQ, 18
  field :WUMBO_CHANNELS_OPT, 19
  field :ANCHORS_REQ, 20
  field :ANCHORS_OPT, 21
  field :ANCHORS_ZERO_FEE_HTLC_REQ, 22
  field :ANCHORS_ZERO_FEE_HTLC_OPT, 23
  field :AMP_REQ, 30
  field :AMP_OPT, 31
end

defmodule Lnrpc.UpdateFailure do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :UPDATE_FAILURE_UNKNOWN, 0
  field :UPDATE_FAILURE_PENDING, 1
  field :UPDATE_FAILURE_NOT_FOUND, 2
  field :UPDATE_FAILURE_INTERNAL_ERR, 3
  field :UPDATE_FAILURE_INVALID_PARAMETER, 4
end

defmodule Lnrpc.ChannelCloseSummary.ClosureType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :COOPERATIVE_CLOSE, 0
  field :LOCAL_FORCE_CLOSE, 1
  field :REMOTE_FORCE_CLOSE, 2
  field :BREACH_CLOSE, 3
  field :FUNDING_CANCELED, 4
  field :ABANDONED, 5
end

defmodule Lnrpc.Peer.SyncType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :UNKNOWN_SYNC, 0
  field :ACTIVE_SYNC, 1
  field :PASSIVE_SYNC, 2
  field :PINNED_SYNC, 3
end

defmodule Lnrpc.PeerEvent.EventType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :PEER_ONLINE, 0
  field :PEER_OFFLINE, 1
end

defmodule Lnrpc.PendingChannelsResponse.ForceClosedChannel.AnchorState do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :LIMBO, 0
  field :RECOVERED, 1
  field :LOST, 2
end

defmodule Lnrpc.ChannelEventUpdate.UpdateType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :OPEN_CHANNEL, 0
  field :CLOSED_CHANNEL, 1
  field :ACTIVE_CHANNEL, 2
  field :INACTIVE_CHANNEL, 3
  field :PENDING_OPEN_CHANNEL, 4
  field :FULLY_RESOLVED_CHANNEL, 5
end

defmodule Lnrpc.Invoice.InvoiceState do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :OPEN, 0
  field :SETTLED, 1
  field :CANCELED, 2
  field :ACCEPTED, 3
end

defmodule Lnrpc.Payment.PaymentStatus do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :UNKNOWN, 0
  field :IN_FLIGHT, 1
  field :SUCCEEDED, 2
  field :FAILED, 3
end

defmodule Lnrpc.HTLCAttempt.HTLCStatus do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :IN_FLIGHT, 0
  field :SUCCEEDED, 1
  field :FAILED, 2
end

defmodule Lnrpc.Failure.FailureCode do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :RESERVED, 0
  field :INCORRECT_OR_UNKNOWN_PAYMENT_DETAILS, 1
  field :INCORRECT_PAYMENT_AMOUNT, 2
  field :FINAL_INCORRECT_CLTV_EXPIRY, 3
  field :FINAL_INCORRECT_HTLC_AMOUNT, 4
  field :FINAL_EXPIRY_TOO_SOON, 5
  field :INVALID_REALM, 6
  field :EXPIRY_TOO_SOON, 7
  field :INVALID_ONION_VERSION, 8
  field :INVALID_ONION_HMAC, 9
  field :INVALID_ONION_KEY, 10
  field :AMOUNT_BELOW_MINIMUM, 11
  field :FEE_INSUFFICIENT, 12
  field :INCORRECT_CLTV_EXPIRY, 13
  field :CHANNEL_DISABLED, 14
  field :TEMPORARY_CHANNEL_FAILURE, 15
  field :REQUIRED_NODE_FEATURE_MISSING, 16
  field :REQUIRED_CHANNEL_FEATURE_MISSING, 17
  field :UNKNOWN_NEXT_PEER, 18
  field :TEMPORARY_NODE_FAILURE, 19
  field :PERMANENT_NODE_FAILURE, 20
  field :PERMANENT_CHANNEL_FAILURE, 21
  field :EXPIRY_TOO_FAR, 22
  field :MPP_TIMEOUT, 23
  field :INVALID_ONION_PAYLOAD, 24
  field :INTERNAL_FAILURE, 997
  field :UNKNOWN_FAILURE, 998
  field :UNREADABLE_FAILURE, 999
end

defmodule Lnrpc.SubscribeCustomMessagesRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.CustomMessage do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :peer, 1, type: :bytes
  field :type, 2, type: :uint32
  field :data, 3, type: :bytes
end

defmodule Lnrpc.SendCustomMessageRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :peer, 1, type: :bytes
  field :type, 2, type: :uint32
  field :data, 3, type: :bytes
end

defmodule Lnrpc.SendCustomMessageResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.Utxo do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :address_type, 1, type: Lnrpc.AddressType, json_name: "addressType", enum: true
  field :address, 2, type: :string
  field :amount_sat, 3, type: :int64, json_name: "amountSat"
  field :pk_script, 4, type: :string, json_name: "pkScript"
  field :outpoint, 5, type: Lnrpc.OutPoint
  field :confirmations, 6, type: :int64
end

defmodule Lnrpc.OutputDetail do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :output_type, 1, type: Lnrpc.OutputScriptType, json_name: "outputType", enum: true
  field :address, 2, type: :string
  field :pk_script, 3, type: :string, json_name: "pkScript"
  field :output_index, 4, type: :int64, json_name: "outputIndex"
  field :amount, 5, type: :int64
  field :is_our_address, 6, type: :bool, json_name: "isOurAddress"
end

defmodule Lnrpc.Transaction do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :tx_hash, 1, type: :string, json_name: "txHash"
  field :amount, 2, type: :int64
  field :num_confirmations, 3, type: :int32, json_name: "numConfirmations"
  field :block_hash, 4, type: :string, json_name: "blockHash"
  field :block_height, 5, type: :int32, json_name: "blockHeight"
  field :time_stamp, 6, type: :int64, json_name: "timeStamp"
  field :total_fees, 7, type: :int64, json_name: "totalFees"

  field :dest_addresses, 8,
    repeated: true,
    type: :string,
    json_name: "destAddresses",
    deprecated: true

  field :output_details, 11, repeated: true, type: Lnrpc.OutputDetail, json_name: "outputDetails"
  field :raw_tx_hex, 9, type: :string, json_name: "rawTxHex"
  field :label, 10, type: :string

  field :previous_outpoints, 12,
    repeated: true,
    type: Lnrpc.PreviousOutPoint,
    json_name: "previousOutpoints"
end

defmodule Lnrpc.GetTransactionsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :start_height, 1, type: :int32, json_name: "startHeight"
  field :end_height, 2, type: :int32, json_name: "endHeight"
  field :account, 3, type: :string
end

defmodule Lnrpc.TransactionDetails do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :transactions, 1, repeated: true, type: Lnrpc.Transaction
end

defmodule Lnrpc.FeeLimit do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :limit, 0

  field :fixed, 1, type: :int64, oneof: 0
  field :fixed_msat, 3, type: :int64, json_name: "fixedMsat", oneof: 0
  field :percent, 2, type: :int64, oneof: 0
end

defmodule Lnrpc.SendRequest.DestCustomRecordsEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :uint64
  field :value, 2, type: :bytes
end

defmodule Lnrpc.SendRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :dest, 1, type: :bytes
  field :dest_string, 2, type: :string, json_name: "destString", deprecated: true
  field :amt, 3, type: :int64
  field :amt_msat, 12, type: :int64, json_name: "amtMsat"
  field :payment_hash, 4, type: :bytes, json_name: "paymentHash"
  field :payment_hash_string, 5, type: :string, json_name: "paymentHashString", deprecated: true
  field :payment_request, 6, type: :string, json_name: "paymentRequest"
  field :final_cltv_delta, 7, type: :int32, json_name: "finalCltvDelta"
  field :fee_limit, 8, type: Lnrpc.FeeLimit, json_name: "feeLimit"
  field :outgoing_chan_id, 9, type: :uint64, json_name: "outgoingChanId", deprecated: false
  field :last_hop_pubkey, 13, type: :bytes, json_name: "lastHopPubkey"
  field :cltv_limit, 10, type: :uint32, json_name: "cltvLimit"

  field :dest_custom_records, 11,
    repeated: true,
    type: Lnrpc.SendRequest.DestCustomRecordsEntry,
    json_name: "destCustomRecords",
    map: true

  field :allow_self_payment, 14, type: :bool, json_name: "allowSelfPayment"

  field :dest_features, 15,
    repeated: true,
    type: Lnrpc.FeatureBit,
    json_name: "destFeatures",
    enum: true

  field :payment_addr, 16, type: :bytes, json_name: "paymentAddr"
end

defmodule Lnrpc.SendResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :payment_error, 1, type: :string, json_name: "paymentError"
  field :payment_preimage, 2, type: :bytes, json_name: "paymentPreimage"
  field :payment_route, 3, type: Lnrpc.Route, json_name: "paymentRoute"
  field :payment_hash, 4, type: :bytes, json_name: "paymentHash"
end

defmodule Lnrpc.SendToRouteRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :payment_hash, 1, type: :bytes, json_name: "paymentHash"
  field :payment_hash_string, 2, type: :string, json_name: "paymentHashString", deprecated: true
  field :route, 4, type: Lnrpc.Route
end

defmodule Lnrpc.ChannelAcceptRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :node_pubkey, 1, type: :bytes, json_name: "nodePubkey"
  field :chain_hash, 2, type: :bytes, json_name: "chainHash"
  field :pending_chan_id, 3, type: :bytes, json_name: "pendingChanId"
  field :funding_amt, 4, type: :uint64, json_name: "fundingAmt"
  field :push_amt, 5, type: :uint64, json_name: "pushAmt"
  field :dust_limit, 6, type: :uint64, json_name: "dustLimit"
  field :max_value_in_flight, 7, type: :uint64, json_name: "maxValueInFlight"
  field :channel_reserve, 8, type: :uint64, json_name: "channelReserve"
  field :min_htlc, 9, type: :uint64, json_name: "minHtlc"
  field :fee_per_kw, 10, type: :uint64, json_name: "feePerKw"
  field :csv_delay, 11, type: :uint32, json_name: "csvDelay"
  field :max_accepted_htlcs, 12, type: :uint32, json_name: "maxAcceptedHtlcs"
  field :channel_flags, 13, type: :uint32, json_name: "channelFlags"
  field :commitment_type, 14, type: Lnrpc.CommitmentType, json_name: "commitmentType", enum: true
  field :wants_zero_conf, 15, type: :bool, json_name: "wantsZeroConf"
  field :wants_scid_alias, 16, type: :bool, json_name: "wantsScidAlias"
end

defmodule Lnrpc.ChannelAcceptResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :accept, 1, type: :bool
  field :pending_chan_id, 2, type: :bytes, json_name: "pendingChanId"
  field :error, 3, type: :string
  field :upfront_shutdown, 4, type: :string, json_name: "upfrontShutdown"
  field :csv_delay, 5, type: :uint32, json_name: "csvDelay"
  field :reserve_sat, 6, type: :uint64, json_name: "reserveSat"
  field :in_flight_max_msat, 7, type: :uint64, json_name: "inFlightMaxMsat"
  field :max_htlc_count, 8, type: :uint32, json_name: "maxHtlcCount"
  field :min_htlc_in, 9, type: :uint64, json_name: "minHtlcIn"
  field :min_accept_depth, 10, type: :uint32, json_name: "minAcceptDepth"
  field :zero_conf, 11, type: :bool, json_name: "zeroConf"
end

defmodule Lnrpc.ChannelPoint do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :funding_txid, 0

  field :funding_txid_bytes, 1, type: :bytes, json_name: "fundingTxidBytes", oneof: 0
  field :funding_txid_str, 2, type: :string, json_name: "fundingTxidStr", oneof: 0
  field :output_index, 3, type: :uint32, json_name: "outputIndex"
end

defmodule Lnrpc.OutPoint do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :txid_bytes, 1, type: :bytes, json_name: "txidBytes"
  field :txid_str, 2, type: :string, json_name: "txidStr"
  field :output_index, 3, type: :uint32, json_name: "outputIndex"
end

defmodule Lnrpc.PreviousOutPoint do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :outpoint, 1, type: :string
  field :is_our_output, 2, type: :bool, json_name: "isOurOutput"
end

defmodule Lnrpc.LightningAddress do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :pubkey, 1, type: :string
  field :host, 2, type: :string
end

defmodule Lnrpc.EstimateFeeRequest.AddrToAmountEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Lnrpc.EstimateFeeRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :AddrToAmount, 1,
    repeated: true,
    type: Lnrpc.EstimateFeeRequest.AddrToAmountEntry,
    map: true

  field :target_conf, 2, type: :int32, json_name: "targetConf"
  field :min_confs, 3, type: :int32, json_name: "minConfs"
  field :spend_unconfirmed, 4, type: :bool, json_name: "spendUnconfirmed"
end

defmodule Lnrpc.EstimateFeeResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :fee_sat, 1, type: :int64, json_name: "feeSat"
  field :feerate_sat_per_byte, 2, type: :int64, json_name: "feerateSatPerByte", deprecated: true
  field :sat_per_vbyte, 3, type: :uint64, json_name: "satPerVbyte"
end

defmodule Lnrpc.SendManyRequest.AddrToAmountEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Lnrpc.SendManyRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :AddrToAmount, 1, repeated: true, type: Lnrpc.SendManyRequest.AddrToAmountEntry, map: true
  field :target_conf, 3, type: :int32, json_name: "targetConf"
  field :sat_per_vbyte, 4, type: :uint64, json_name: "satPerVbyte"
  field :sat_per_byte, 5, type: :int64, json_name: "satPerByte", deprecated: true
  field :label, 6, type: :string
  field :min_confs, 7, type: :int32, json_name: "minConfs"
  field :spend_unconfirmed, 8, type: :bool, json_name: "spendUnconfirmed"
end

defmodule Lnrpc.SendManyResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :txid, 1, type: :string
end

defmodule Lnrpc.SendCoinsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :addr, 1, type: :string
  field :amount, 2, type: :int64
  field :target_conf, 3, type: :int32, json_name: "targetConf"
  field :sat_per_vbyte, 4, type: :uint64, json_name: "satPerVbyte"
  field :sat_per_byte, 5, type: :int64, json_name: "satPerByte", deprecated: true
  field :send_all, 6, type: :bool, json_name: "sendAll"
  field :label, 7, type: :string
  field :min_confs, 8, type: :int32, json_name: "minConfs"
  field :spend_unconfirmed, 9, type: :bool, json_name: "spendUnconfirmed"
end

defmodule Lnrpc.SendCoinsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :txid, 1, type: :string
end

defmodule Lnrpc.ListUnspentRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :min_confs, 1, type: :int32, json_name: "minConfs"
  field :max_confs, 2, type: :int32, json_name: "maxConfs"
  field :account, 3, type: :string
end

defmodule Lnrpc.ListUnspentResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :utxos, 1, repeated: true, type: Lnrpc.Utxo
end

defmodule Lnrpc.NewAddressRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :type, 1, type: Lnrpc.AddressType, enum: true
  field :account, 2, type: :string
end

defmodule Lnrpc.NewAddressResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :address, 1, type: :string
end

defmodule Lnrpc.SignMessageRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :msg, 1, type: :bytes
  field :single_hash, 2, type: :bool, json_name: "singleHash"
end

defmodule Lnrpc.SignMessageResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :signature, 1, type: :string
end

defmodule Lnrpc.VerifyMessageRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :msg, 1, type: :bytes
  field :signature, 2, type: :string
end

defmodule Lnrpc.VerifyMessageResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :valid, 1, type: :bool
  field :pubkey, 2, type: :string
end

defmodule Lnrpc.ConnectPeerRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :addr, 1, type: Lnrpc.LightningAddress
  field :perm, 2, type: :bool
  field :timeout, 3, type: :uint64
end

defmodule Lnrpc.ConnectPeerResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.DisconnectPeerRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :pub_key, 1, type: :string, json_name: "pubKey"
end

defmodule Lnrpc.DisconnectPeerResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.HTLC do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :incoming, 1, type: :bool
  field :amount, 2, type: :int64
  field :hash_lock, 3, type: :bytes, json_name: "hashLock"
  field :expiration_height, 4, type: :uint32, json_name: "expirationHeight"
  field :htlc_index, 5, type: :uint64, json_name: "htlcIndex"
  field :forwarding_channel, 6, type: :uint64, json_name: "forwardingChannel"
  field :forwarding_htlc_index, 7, type: :uint64, json_name: "forwardingHtlcIndex"
end

defmodule Lnrpc.ChannelConstraints do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :csv_delay, 1, type: :uint32, json_name: "csvDelay"
  field :chan_reserve_sat, 2, type: :uint64, json_name: "chanReserveSat"
  field :dust_limit_sat, 3, type: :uint64, json_name: "dustLimitSat"
  field :max_pending_amt_msat, 4, type: :uint64, json_name: "maxPendingAmtMsat"
  field :min_htlc_msat, 5, type: :uint64, json_name: "minHtlcMsat"
  field :max_accepted_htlcs, 6, type: :uint32, json_name: "maxAcceptedHtlcs"
end

defmodule Lnrpc.Channel do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :active, 1, type: :bool
  field :remote_pubkey, 2, type: :string, json_name: "remotePubkey"
  field :channel_point, 3, type: :string, json_name: "channelPoint"
  field :chan_id, 4, type: :uint64, json_name: "chanId", deprecated: false
  field :capacity, 5, type: :int64
  field :local_balance, 6, type: :int64, json_name: "localBalance"
  field :remote_balance, 7, type: :int64, json_name: "remoteBalance"
  field :commit_fee, 8, type: :int64, json_name: "commitFee"
  field :commit_weight, 9, type: :int64, json_name: "commitWeight"
  field :fee_per_kw, 10, type: :int64, json_name: "feePerKw"
  field :unsettled_balance, 11, type: :int64, json_name: "unsettledBalance"
  field :total_satoshis_sent, 12, type: :int64, json_name: "totalSatoshisSent"
  field :total_satoshis_received, 13, type: :int64, json_name: "totalSatoshisReceived"
  field :num_updates, 14, type: :uint64, json_name: "numUpdates"
  field :pending_htlcs, 15, repeated: true, type: Lnrpc.HTLC, json_name: "pendingHtlcs"
  field :csv_delay, 16, type: :uint32, json_name: "csvDelay", deprecated: true
  field :private, 17, type: :bool
  field :initiator, 18, type: :bool
  field :chan_status_flags, 19, type: :string, json_name: "chanStatusFlags"

  field :local_chan_reserve_sat, 20,
    type: :int64,
    json_name: "localChanReserveSat",
    deprecated: true

  field :remote_chan_reserve_sat, 21,
    type: :int64,
    json_name: "remoteChanReserveSat",
    deprecated: true

  field :static_remote_key, 22, type: :bool, json_name: "staticRemoteKey", deprecated: true
  field :commitment_type, 26, type: Lnrpc.CommitmentType, json_name: "commitmentType", enum: true
  field :lifetime, 23, type: :int64
  field :uptime, 24, type: :int64
  field :close_address, 25, type: :string, json_name: "closeAddress"
  field :push_amount_sat, 27, type: :uint64, json_name: "pushAmountSat"
  field :thaw_height, 28, type: :uint32, json_name: "thawHeight"
  field :local_constraints, 29, type: Lnrpc.ChannelConstraints, json_name: "localConstraints"
  field :remote_constraints, 30, type: Lnrpc.ChannelConstraints, json_name: "remoteConstraints"
  field :alias_scids, 31, repeated: true, type: :uint64, json_name: "aliasScids"
  field :zero_conf, 32, type: :bool, json_name: "zeroConf"
  field :zero_conf_confirmed_scid, 33, type: :uint64, json_name: "zeroConfConfirmedScid"
end

defmodule Lnrpc.ListChannelsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :active_only, 1, type: :bool, json_name: "activeOnly"
  field :inactive_only, 2, type: :bool, json_name: "inactiveOnly"
  field :public_only, 3, type: :bool, json_name: "publicOnly"
  field :private_only, 4, type: :bool, json_name: "privateOnly"
  field :peer, 5, type: :bytes
end

defmodule Lnrpc.ListChannelsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :channels, 11, repeated: true, type: Lnrpc.Channel
end

defmodule Lnrpc.AliasMap do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :base_scid, 1, type: :uint64, json_name: "baseScid"
  field :aliases, 2, repeated: true, type: :uint64
end

defmodule Lnrpc.ListAliasesRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.ListAliasesResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :alias_maps, 1, repeated: true, type: Lnrpc.AliasMap, json_name: "aliasMaps"
end

defmodule Lnrpc.ChannelCloseSummary do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :channel_point, 1, type: :string, json_name: "channelPoint"
  field :chan_id, 2, type: :uint64, json_name: "chanId", deprecated: false
  field :chain_hash, 3, type: :string, json_name: "chainHash"
  field :closing_tx_hash, 4, type: :string, json_name: "closingTxHash"
  field :remote_pubkey, 5, type: :string, json_name: "remotePubkey"
  field :capacity, 6, type: :int64
  field :close_height, 7, type: :uint32, json_name: "closeHeight"
  field :settled_balance, 8, type: :int64, json_name: "settledBalance"
  field :time_locked_balance, 9, type: :int64, json_name: "timeLockedBalance"

  field :close_type, 10,
    type: Lnrpc.ChannelCloseSummary.ClosureType,
    json_name: "closeType",
    enum: true

  field :open_initiator, 11, type: Lnrpc.Initiator, json_name: "openInitiator", enum: true
  field :close_initiator, 12, type: Lnrpc.Initiator, json_name: "closeInitiator", enum: true
  field :resolutions, 13, repeated: true, type: Lnrpc.Resolution
  field :alias_scids, 14, repeated: true, type: :uint64, json_name: "aliasScids"

  field :zero_conf_confirmed_scid, 15,
    type: :uint64,
    json_name: "zeroConfConfirmedScid",
    deprecated: false
end

defmodule Lnrpc.Resolution do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :resolution_type, 1, type: Lnrpc.ResolutionType, json_name: "resolutionType", enum: true
  field :outcome, 2, type: Lnrpc.ResolutionOutcome, enum: true
  field :outpoint, 3, type: Lnrpc.OutPoint
  field :amount_sat, 4, type: :uint64, json_name: "amountSat"
  field :sweep_txid, 5, type: :string, json_name: "sweepTxid"
end

defmodule Lnrpc.ClosedChannelsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :cooperative, 1, type: :bool
  field :local_force, 2, type: :bool, json_name: "localForce"
  field :remote_force, 3, type: :bool, json_name: "remoteForce"
  field :breach, 4, type: :bool
  field :funding_canceled, 5, type: :bool, json_name: "fundingCanceled"
  field :abandoned, 6, type: :bool
end

defmodule Lnrpc.ClosedChannelsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :channels, 1, repeated: true, type: Lnrpc.ChannelCloseSummary
end

defmodule Lnrpc.Peer.FeaturesEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :uint32
  field :value, 2, type: Lnrpc.Feature
end

defmodule Lnrpc.Peer do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :pub_key, 1, type: :string, json_name: "pubKey"
  field :address, 3, type: :string
  field :bytes_sent, 4, type: :uint64, json_name: "bytesSent"
  field :bytes_recv, 5, type: :uint64, json_name: "bytesRecv"
  field :sat_sent, 6, type: :int64, json_name: "satSent"
  field :sat_recv, 7, type: :int64, json_name: "satRecv"
  field :inbound, 8, type: :bool
  field :ping_time, 9, type: :int64, json_name: "pingTime"
  field :sync_type, 10, type: Lnrpc.Peer.SyncType, json_name: "syncType", enum: true
  field :features, 11, repeated: true, type: Lnrpc.Peer.FeaturesEntry, map: true
  field :errors, 12, repeated: true, type: Lnrpc.TimestampedError
  field :flap_count, 13, type: :int32, json_name: "flapCount"
  field :last_flap_ns, 14, type: :int64, json_name: "lastFlapNs"
  field :last_ping_payload, 15, type: :bytes, json_name: "lastPingPayload"
end

defmodule Lnrpc.TimestampedError do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :timestamp, 1, type: :uint64
  field :error, 2, type: :string
end

defmodule Lnrpc.ListPeersRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :latest_error, 1, type: :bool, json_name: "latestError"
end

defmodule Lnrpc.ListPeersResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :peers, 1, repeated: true, type: Lnrpc.Peer
end

defmodule Lnrpc.PeerEventSubscription do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.PeerEvent do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :pub_key, 1, type: :string, json_name: "pubKey"
  field :type, 2, type: Lnrpc.PeerEvent.EventType, enum: true
end

defmodule Lnrpc.GetInfoRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.GetInfoResponse.FeaturesEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :uint32
  field :value, 2, type: Lnrpc.Feature
end

defmodule Lnrpc.GetInfoResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :version, 14, type: :string
  field :commit_hash, 20, type: :string, json_name: "commitHash"
  field :identity_pubkey, 1, type: :string, json_name: "identityPubkey"
  field :alias, 2, type: :string
  field :color, 17, type: :string
  field :num_pending_channels, 3, type: :uint32, json_name: "numPendingChannels"
  field :num_active_channels, 4, type: :uint32, json_name: "numActiveChannels"
  field :num_inactive_channels, 15, type: :uint32, json_name: "numInactiveChannels"
  field :num_peers, 5, type: :uint32, json_name: "numPeers"
  field :block_height, 6, type: :uint32, json_name: "blockHeight"
  field :block_hash, 8, type: :string, json_name: "blockHash"
  field :best_header_timestamp, 13, type: :int64, json_name: "bestHeaderTimestamp"
  field :synced_to_chain, 9, type: :bool, json_name: "syncedToChain"
  field :synced_to_graph, 18, type: :bool, json_name: "syncedToGraph"
  field :testnet, 10, type: :bool, deprecated: true
  field :chains, 16, repeated: true, type: Lnrpc.Chain
  field :uris, 12, repeated: true, type: :string
  field :features, 19, repeated: true, type: Lnrpc.GetInfoResponse.FeaturesEntry, map: true
  field :require_htlc_interceptor, 21, type: :bool, json_name: "requireHtlcInterceptor"
end

defmodule Lnrpc.GetRecoveryInfoRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.GetRecoveryInfoResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :recovery_mode, 1, type: :bool, json_name: "recoveryMode"
  field :recovery_finished, 2, type: :bool, json_name: "recoveryFinished"
  field :progress, 3, type: :double
end

defmodule Lnrpc.Chain do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :chain, 1, type: :string
  field :network, 2, type: :string
end

defmodule Lnrpc.ConfirmationUpdate do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :block_sha, 1, type: :bytes, json_name: "blockSha"
  field :block_height, 2, type: :int32, json_name: "blockHeight"
  field :num_confs_left, 3, type: :uint32, json_name: "numConfsLeft"
end

defmodule Lnrpc.ChannelOpenUpdate do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :channel_point, 1, type: Lnrpc.ChannelPoint, json_name: "channelPoint"
end

defmodule Lnrpc.ChannelCloseUpdate do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :closing_txid, 1, type: :bytes, json_name: "closingTxid"
  field :success, 2, type: :bool
end

defmodule Lnrpc.CloseChannelRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :channel_point, 1, type: Lnrpc.ChannelPoint, json_name: "channelPoint"
  field :force, 2, type: :bool
  field :target_conf, 3, type: :int32, json_name: "targetConf"
  field :sat_per_byte, 4, type: :int64, json_name: "satPerByte", deprecated: true
  field :delivery_address, 5, type: :string, json_name: "deliveryAddress"
  field :sat_per_vbyte, 6, type: :uint64, json_name: "satPerVbyte"
  field :max_fee_per_vbyte, 7, type: :uint64, json_name: "maxFeePerVbyte"
end

defmodule Lnrpc.CloseStatusUpdate do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :update, 0

  field :close_pending, 1, type: Lnrpc.PendingUpdate, json_name: "closePending", oneof: 0
  field :chan_close, 3, type: Lnrpc.ChannelCloseUpdate, json_name: "chanClose", oneof: 0
end

defmodule Lnrpc.PendingUpdate do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :txid, 1, type: :bytes
  field :output_index, 2, type: :uint32, json_name: "outputIndex"
end

defmodule Lnrpc.ReadyForPsbtFunding do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :funding_address, 1, type: :string, json_name: "fundingAddress"
  field :funding_amount, 2, type: :int64, json_name: "fundingAmount"
  field :psbt, 3, type: :bytes
end

defmodule Lnrpc.BatchOpenChannelRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :channels, 1, repeated: true, type: Lnrpc.BatchOpenChannel
  field :target_conf, 2, type: :int32, json_name: "targetConf"
  field :sat_per_vbyte, 3, type: :int64, json_name: "satPerVbyte"
  field :min_confs, 4, type: :int32, json_name: "minConfs"
  field :spend_unconfirmed, 5, type: :bool, json_name: "spendUnconfirmed"
  field :label, 6, type: :string
end

defmodule Lnrpc.BatchOpenChannel do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :node_pubkey, 1, type: :bytes, json_name: "nodePubkey"
  field :local_funding_amount, 2, type: :int64, json_name: "localFundingAmount"
  field :push_sat, 3, type: :int64, json_name: "pushSat"
  field :private, 4, type: :bool
  field :min_htlc_msat, 5, type: :int64, json_name: "minHtlcMsat"
  field :remote_csv_delay, 6, type: :uint32, json_name: "remoteCsvDelay"
  field :close_address, 7, type: :string, json_name: "closeAddress"
  field :pending_chan_id, 8, type: :bytes, json_name: "pendingChanId"
  field :commitment_type, 9, type: Lnrpc.CommitmentType, json_name: "commitmentType", enum: true
end

defmodule Lnrpc.BatchOpenChannelResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :pending_channels, 1,
    repeated: true,
    type: Lnrpc.PendingUpdate,
    json_name: "pendingChannels"
end

defmodule Lnrpc.OpenChannelRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :sat_per_vbyte, 1, type: :uint64, json_name: "satPerVbyte"
  field :node_pubkey, 2, type: :bytes, json_name: "nodePubkey"
  field :node_pubkey_string, 3, type: :string, json_name: "nodePubkeyString", deprecated: true
  field :local_funding_amount, 4, type: :int64, json_name: "localFundingAmount"
  field :push_sat, 5, type: :int64, json_name: "pushSat"
  field :target_conf, 6, type: :int32, json_name: "targetConf"
  field :sat_per_byte, 7, type: :int64, json_name: "satPerByte", deprecated: true
  field :private, 8, type: :bool
  field :min_htlc_msat, 9, type: :int64, json_name: "minHtlcMsat"
  field :remote_csv_delay, 10, type: :uint32, json_name: "remoteCsvDelay"
  field :min_confs, 11, type: :int32, json_name: "minConfs"
  field :spend_unconfirmed, 12, type: :bool, json_name: "spendUnconfirmed"
  field :close_address, 13, type: :string, json_name: "closeAddress"
  field :funding_shim, 14, type: Lnrpc.FundingShim, json_name: "fundingShim"

  field :remote_max_value_in_flight_msat, 15,
    type: :uint64,
    json_name: "remoteMaxValueInFlightMsat"

  field :remote_max_htlcs, 16, type: :uint32, json_name: "remoteMaxHtlcs"
  field :max_local_csv, 17, type: :uint32, json_name: "maxLocalCsv"
  field :commitment_type, 18, type: Lnrpc.CommitmentType, json_name: "commitmentType", enum: true
  field :zero_conf, 19, type: :bool, json_name: "zeroConf"
  field :scid_alias, 20, type: :bool, json_name: "scidAlias"
  field :base_fee, 21, type: :uint64, json_name: "baseFee"
  field :fee_rate, 22, type: :uint64, json_name: "feeRate"
  field :use_base_fee, 23, type: :bool, json_name: "useBaseFee"
  field :use_fee_rate, 24, type: :bool, json_name: "useFeeRate"
end

defmodule Lnrpc.OpenStatusUpdate do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :update, 0

  field :chan_pending, 1, type: Lnrpc.PendingUpdate, json_name: "chanPending", oneof: 0
  field :chan_open, 3, type: Lnrpc.ChannelOpenUpdate, json_name: "chanOpen", oneof: 0
  field :psbt_fund, 5, type: Lnrpc.ReadyForPsbtFunding, json_name: "psbtFund", oneof: 0
  field :pending_chan_id, 4, type: :bytes, json_name: "pendingChanId"
end

defmodule Lnrpc.KeyLocator do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key_family, 1, type: :int32, json_name: "keyFamily"
  field :key_index, 2, type: :int32, json_name: "keyIndex"
end

defmodule Lnrpc.KeyDescriptor do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :raw_key_bytes, 1, type: :bytes, json_name: "rawKeyBytes"
  field :key_loc, 2, type: Lnrpc.KeyLocator, json_name: "keyLoc"
end

defmodule Lnrpc.ChanPointShim do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :amt, 1, type: :int64
  field :chan_point, 2, type: Lnrpc.ChannelPoint, json_name: "chanPoint"
  field :local_key, 3, type: Lnrpc.KeyDescriptor, json_name: "localKey"
  field :remote_key, 4, type: :bytes, json_name: "remoteKey"
  field :pending_chan_id, 5, type: :bytes, json_name: "pendingChanId"
  field :thaw_height, 6, type: :uint32, json_name: "thawHeight"
end

defmodule Lnrpc.PsbtShim do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :pending_chan_id, 1, type: :bytes, json_name: "pendingChanId"
  field :base_psbt, 2, type: :bytes, json_name: "basePsbt"
  field :no_publish, 3, type: :bool, json_name: "noPublish"
end

defmodule Lnrpc.FundingShim do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :shim, 0

  field :chan_point_shim, 1, type: Lnrpc.ChanPointShim, json_name: "chanPointShim", oneof: 0
  field :psbt_shim, 2, type: Lnrpc.PsbtShim, json_name: "psbtShim", oneof: 0
end

defmodule Lnrpc.FundingShimCancel do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :pending_chan_id, 1, type: :bytes, json_name: "pendingChanId"
end

defmodule Lnrpc.FundingPsbtVerify do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :funded_psbt, 1, type: :bytes, json_name: "fundedPsbt"
  field :pending_chan_id, 2, type: :bytes, json_name: "pendingChanId"
  field :skip_finalize, 3, type: :bool, json_name: "skipFinalize"
end

defmodule Lnrpc.FundingPsbtFinalize do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :signed_psbt, 1, type: :bytes, json_name: "signedPsbt"
  field :pending_chan_id, 2, type: :bytes, json_name: "pendingChanId"
  field :final_raw_tx, 3, type: :bytes, json_name: "finalRawTx"
end

defmodule Lnrpc.FundingTransitionMsg do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :trigger, 0

  field :shim_register, 1, type: Lnrpc.FundingShim, json_name: "shimRegister", oneof: 0
  field :shim_cancel, 2, type: Lnrpc.FundingShimCancel, json_name: "shimCancel", oneof: 0
  field :psbt_verify, 3, type: Lnrpc.FundingPsbtVerify, json_name: "psbtVerify", oneof: 0
  field :psbt_finalize, 4, type: Lnrpc.FundingPsbtFinalize, json_name: "psbtFinalize", oneof: 0
end

defmodule Lnrpc.FundingStateStepResp do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.PendingHTLC do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :incoming, 1, type: :bool
  field :amount, 2, type: :int64
  field :outpoint, 3, type: :string
  field :maturity_height, 4, type: :uint32, json_name: "maturityHeight"
  field :blocks_til_maturity, 5, type: :int32, json_name: "blocksTilMaturity"
  field :stage, 6, type: :uint32
end

defmodule Lnrpc.PendingChannelsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.PendingChannelsResponse.PendingChannel do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :remote_node_pub, 1, type: :string, json_name: "remoteNodePub"
  field :channel_point, 2, type: :string, json_name: "channelPoint"
  field :capacity, 3, type: :int64
  field :local_balance, 4, type: :int64, json_name: "localBalance"
  field :remote_balance, 5, type: :int64, json_name: "remoteBalance"
  field :local_chan_reserve_sat, 6, type: :int64, json_name: "localChanReserveSat"
  field :remote_chan_reserve_sat, 7, type: :int64, json_name: "remoteChanReserveSat"
  field :initiator, 8, type: Lnrpc.Initiator, enum: true
  field :commitment_type, 9, type: Lnrpc.CommitmentType, json_name: "commitmentType", enum: true
  field :num_forwarding_packages, 10, type: :int64, json_name: "numForwardingPackages"
  field :chan_status_flags, 11, type: :string, json_name: "chanStatusFlags"
  field :private, 12, type: :bool
end

defmodule Lnrpc.PendingChannelsResponse.PendingOpenChannel do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :channel, 1, type: Lnrpc.PendingChannelsResponse.PendingChannel
  field :commit_fee, 4, type: :int64, json_name: "commitFee"
  field :commit_weight, 5, type: :int64, json_name: "commitWeight"
  field :fee_per_kw, 6, type: :int64, json_name: "feePerKw"
end

defmodule Lnrpc.PendingChannelsResponse.WaitingCloseChannel do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :channel, 1, type: Lnrpc.PendingChannelsResponse.PendingChannel
  field :limbo_balance, 2, type: :int64, json_name: "limboBalance"
  field :commitments, 3, type: Lnrpc.PendingChannelsResponse.Commitments
  field :closing_txid, 4, type: :string, json_name: "closingTxid"
end

defmodule Lnrpc.PendingChannelsResponse.Commitments do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :local_txid, 1, type: :string, json_name: "localTxid"
  field :remote_txid, 2, type: :string, json_name: "remoteTxid"
  field :remote_pending_txid, 3, type: :string, json_name: "remotePendingTxid"
  field :local_commit_fee_sat, 4, type: :uint64, json_name: "localCommitFeeSat"
  field :remote_commit_fee_sat, 5, type: :uint64, json_name: "remoteCommitFeeSat"
  field :remote_pending_commit_fee_sat, 6, type: :uint64, json_name: "remotePendingCommitFeeSat"
end

defmodule Lnrpc.PendingChannelsResponse.ClosedChannel do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :channel, 1, type: Lnrpc.PendingChannelsResponse.PendingChannel
  field :closing_txid, 2, type: :string, json_name: "closingTxid"
end

defmodule Lnrpc.PendingChannelsResponse.ForceClosedChannel do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :channel, 1, type: Lnrpc.PendingChannelsResponse.PendingChannel
  field :closing_txid, 2, type: :string, json_name: "closingTxid"
  field :limbo_balance, 3, type: :int64, json_name: "limboBalance"
  field :maturity_height, 4, type: :uint32, json_name: "maturityHeight"
  field :blocks_til_maturity, 5, type: :int32, json_name: "blocksTilMaturity"
  field :recovered_balance, 6, type: :int64, json_name: "recoveredBalance"
  field :pending_htlcs, 8, repeated: true, type: Lnrpc.PendingHTLC, json_name: "pendingHtlcs"
  field :anchor, 9, type: Lnrpc.PendingChannelsResponse.ForceClosedChannel.AnchorState, enum: true
end

defmodule Lnrpc.PendingChannelsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :total_limbo_balance, 1, type: :int64, json_name: "totalLimboBalance"

  field :pending_open_channels, 2,
    repeated: true,
    type: Lnrpc.PendingChannelsResponse.PendingOpenChannel,
    json_name: "pendingOpenChannels"

  field :pending_closing_channels, 3,
    repeated: true,
    type: Lnrpc.PendingChannelsResponse.ClosedChannel,
    json_name: "pendingClosingChannels",
    deprecated: true

  field :pending_force_closing_channels, 4,
    repeated: true,
    type: Lnrpc.PendingChannelsResponse.ForceClosedChannel,
    json_name: "pendingForceClosingChannels"

  field :waiting_close_channels, 5,
    repeated: true,
    type: Lnrpc.PendingChannelsResponse.WaitingCloseChannel,
    json_name: "waitingCloseChannels"
end

defmodule Lnrpc.ChannelEventSubscription do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.ChannelEventUpdate do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :channel, 0

  field :open_channel, 1, type: Lnrpc.Channel, json_name: "openChannel", oneof: 0
  field :closed_channel, 2, type: Lnrpc.ChannelCloseSummary, json_name: "closedChannel", oneof: 0
  field :active_channel, 3, type: Lnrpc.ChannelPoint, json_name: "activeChannel", oneof: 0
  field :inactive_channel, 4, type: Lnrpc.ChannelPoint, json_name: "inactiveChannel", oneof: 0

  field :pending_open_channel, 6,
    type: Lnrpc.PendingUpdate,
    json_name: "pendingOpenChannel",
    oneof: 0

  field :fully_resolved_channel, 7,
    type: Lnrpc.ChannelPoint,
    json_name: "fullyResolvedChannel",
    oneof: 0

  field :type, 5, type: Lnrpc.ChannelEventUpdate.UpdateType, enum: true
end

defmodule Lnrpc.WalletAccountBalance do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :confirmed_balance, 1, type: :int64, json_name: "confirmedBalance"
  field :unconfirmed_balance, 2, type: :int64, json_name: "unconfirmedBalance"
end

defmodule Lnrpc.WalletBalanceRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.WalletBalanceResponse.AccountBalanceEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Lnrpc.WalletAccountBalance
end

defmodule Lnrpc.WalletBalanceResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :total_balance, 1, type: :int64, json_name: "totalBalance"
  field :confirmed_balance, 2, type: :int64, json_name: "confirmedBalance"
  field :unconfirmed_balance, 3, type: :int64, json_name: "unconfirmedBalance"
  field :locked_balance, 5, type: :int64, json_name: "lockedBalance"
  field :reserved_balance_anchor_chan, 6, type: :int64, json_name: "reservedBalanceAnchorChan"

  field :account_balance, 4,
    repeated: true,
    type: Lnrpc.WalletBalanceResponse.AccountBalanceEntry,
    json_name: "accountBalance",
    map: true
end

defmodule Lnrpc.Amount do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :sat, 1, type: :uint64
  field :msat, 2, type: :uint64
end

defmodule Lnrpc.ChannelBalanceRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.ChannelBalanceResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :balance, 1, type: :int64, deprecated: true
  field :pending_open_balance, 2, type: :int64, json_name: "pendingOpenBalance", deprecated: true
  field :local_balance, 3, type: Lnrpc.Amount, json_name: "localBalance"
  field :remote_balance, 4, type: Lnrpc.Amount, json_name: "remoteBalance"
  field :unsettled_local_balance, 5, type: Lnrpc.Amount, json_name: "unsettledLocalBalance"
  field :unsettled_remote_balance, 6, type: Lnrpc.Amount, json_name: "unsettledRemoteBalance"
  field :pending_open_local_balance, 7, type: Lnrpc.Amount, json_name: "pendingOpenLocalBalance"
  field :pending_open_remote_balance, 8, type: Lnrpc.Amount, json_name: "pendingOpenRemoteBalance"
end

defmodule Lnrpc.QueryRoutesRequest.DestCustomRecordsEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :uint64
  field :value, 2, type: :bytes
end

defmodule Lnrpc.QueryRoutesRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :pub_key, 1, type: :string, json_name: "pubKey"
  field :amt, 2, type: :int64
  field :amt_msat, 12, type: :int64, json_name: "amtMsat"
  field :final_cltv_delta, 4, type: :int32, json_name: "finalCltvDelta"
  field :fee_limit, 5, type: Lnrpc.FeeLimit, json_name: "feeLimit"
  field :ignored_nodes, 6, repeated: true, type: :bytes, json_name: "ignoredNodes"

  field :ignored_edges, 7,
    repeated: true,
    type: Lnrpc.EdgeLocator,
    json_name: "ignoredEdges",
    deprecated: true

  field :source_pub_key, 8, type: :string, json_name: "sourcePubKey"
  field :use_mission_control, 9, type: :bool, json_name: "useMissionControl"
  field :ignored_pairs, 10, repeated: true, type: Lnrpc.NodePair, json_name: "ignoredPairs"
  field :cltv_limit, 11, type: :uint32, json_name: "cltvLimit"

  field :dest_custom_records, 13,
    repeated: true,
    type: Lnrpc.QueryRoutesRequest.DestCustomRecordsEntry,
    json_name: "destCustomRecords",
    map: true

  field :outgoing_chan_id, 14, type: :uint64, json_name: "outgoingChanId", deprecated: false
  field :last_hop_pubkey, 15, type: :bytes, json_name: "lastHopPubkey"
  field :route_hints, 16, repeated: true, type: Lnrpc.RouteHint, json_name: "routeHints"

  field :dest_features, 17,
    repeated: true,
    type: Lnrpc.FeatureBit,
    json_name: "destFeatures",
    enum: true

  field :time_pref, 18, type: :double, json_name: "timePref"
end

defmodule Lnrpc.NodePair do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :from, 1, type: :bytes
  field :to, 2, type: :bytes
end

defmodule Lnrpc.EdgeLocator do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :channel_id, 1, type: :uint64, json_name: "channelId", deprecated: false
  field :direction_reverse, 2, type: :bool, json_name: "directionReverse"
end

defmodule Lnrpc.QueryRoutesResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :routes, 1, repeated: true, type: Lnrpc.Route
  field :success_prob, 2, type: :double, json_name: "successProb"
end

defmodule Lnrpc.Hop.CustomRecordsEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :uint64
  field :value, 2, type: :bytes
end

defmodule Lnrpc.Hop do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :chan_id, 1, type: :uint64, json_name: "chanId", deprecated: false
  field :chan_capacity, 2, type: :int64, json_name: "chanCapacity", deprecated: true
  field :amt_to_forward, 3, type: :int64, json_name: "amtToForward", deprecated: true
  field :fee, 4, type: :int64, deprecated: true
  field :expiry, 5, type: :uint32
  field :amt_to_forward_msat, 6, type: :int64, json_name: "amtToForwardMsat"
  field :fee_msat, 7, type: :int64, json_name: "feeMsat"
  field :pub_key, 8, type: :string, json_name: "pubKey"
  field :tlv_payload, 9, type: :bool, json_name: "tlvPayload", deprecated: true
  field :mpp_record, 10, type: Lnrpc.MPPRecord, json_name: "mppRecord"
  field :amp_record, 12, type: Lnrpc.AMPRecord, json_name: "ampRecord"

  field :custom_records, 11,
    repeated: true,
    type: Lnrpc.Hop.CustomRecordsEntry,
    json_name: "customRecords",
    map: true

  field :metadata, 13, type: :bytes
end

defmodule Lnrpc.MPPRecord do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :payment_addr, 11, type: :bytes, json_name: "paymentAddr"
  field :total_amt_msat, 10, type: :int64, json_name: "totalAmtMsat"
end

defmodule Lnrpc.AMPRecord do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :root_share, 1, type: :bytes, json_name: "rootShare"
  field :set_id, 2, type: :bytes, json_name: "setId"
  field :child_index, 3, type: :uint32, json_name: "childIndex"
end

defmodule Lnrpc.Route do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :total_time_lock, 1, type: :uint32, json_name: "totalTimeLock"
  field :total_fees, 2, type: :int64, json_name: "totalFees", deprecated: true
  field :total_amt, 3, type: :int64, json_name: "totalAmt", deprecated: true
  field :hops, 4, repeated: true, type: Lnrpc.Hop
  field :total_fees_msat, 5, type: :int64, json_name: "totalFeesMsat"
  field :total_amt_msat, 6, type: :int64, json_name: "totalAmtMsat"
end

defmodule Lnrpc.NodeInfoRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :pub_key, 1, type: :string, json_name: "pubKey"
  field :include_channels, 2, type: :bool, json_name: "includeChannels"
end

defmodule Lnrpc.NodeInfo do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :node, 1, type: Lnrpc.LightningNode
  field :num_channels, 2, type: :uint32, json_name: "numChannels"
  field :total_capacity, 3, type: :int64, json_name: "totalCapacity"
  field :channels, 4, repeated: true, type: Lnrpc.ChannelEdge
end

defmodule Lnrpc.LightningNode.FeaturesEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :uint32
  field :value, 2, type: Lnrpc.Feature
end

defmodule Lnrpc.LightningNode do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :last_update, 1, type: :uint32, json_name: "lastUpdate"
  field :pub_key, 2, type: :string, json_name: "pubKey"
  field :alias, 3, type: :string
  field :addresses, 4, repeated: true, type: Lnrpc.NodeAddress
  field :color, 5, type: :string
  field :features, 6, repeated: true, type: Lnrpc.LightningNode.FeaturesEntry, map: true
end

defmodule Lnrpc.NodeAddress do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :network, 1, type: :string
  field :addr, 2, type: :string
end

defmodule Lnrpc.RoutingPolicy do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :time_lock_delta, 1, type: :uint32, json_name: "timeLockDelta"
  field :min_htlc, 2, type: :int64, json_name: "minHtlc"
  field :fee_base_msat, 3, type: :int64, json_name: "feeBaseMsat"
  field :fee_rate_milli_msat, 4, type: :int64, json_name: "feeRateMilliMsat"
  field :disabled, 5, type: :bool
  field :max_htlc_msat, 6, type: :uint64, json_name: "maxHtlcMsat"
  field :last_update, 7, type: :uint32, json_name: "lastUpdate"
end

defmodule Lnrpc.ChannelEdge do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :channel_id, 1, type: :uint64, json_name: "channelId", deprecated: false
  field :chan_point, 2, type: :string, json_name: "chanPoint"
  field :last_update, 3, type: :uint32, json_name: "lastUpdate", deprecated: true
  field :node1_pub, 4, type: :string, json_name: "node1Pub"
  field :node2_pub, 5, type: :string, json_name: "node2Pub"
  field :capacity, 6, type: :int64
  field :node1_policy, 7, type: Lnrpc.RoutingPolicy, json_name: "node1Policy"
  field :node2_policy, 8, type: Lnrpc.RoutingPolicy, json_name: "node2Policy"
end

defmodule Lnrpc.ChannelGraphRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :include_unannounced, 1, type: :bool, json_name: "includeUnannounced"
end

defmodule Lnrpc.ChannelGraph do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :nodes, 1, repeated: true, type: Lnrpc.LightningNode
  field :edges, 2, repeated: true, type: Lnrpc.ChannelEdge
end

defmodule Lnrpc.NodeMetricsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :types, 1, repeated: true, type: Lnrpc.NodeMetricType, enum: true
end

defmodule Lnrpc.NodeMetricsResponse.BetweennessCentralityEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Lnrpc.FloatMetric
end

defmodule Lnrpc.NodeMetricsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :betweenness_centrality, 1,
    repeated: true,
    type: Lnrpc.NodeMetricsResponse.BetweennessCentralityEntry,
    json_name: "betweennessCentrality",
    map: true
end

defmodule Lnrpc.FloatMetric do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :value, 1, type: :double
  field :normalized_value, 2, type: :double, json_name: "normalizedValue"
end

defmodule Lnrpc.ChanInfoRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :chan_id, 1, type: :uint64, json_name: "chanId", deprecated: false
end

defmodule Lnrpc.NetworkInfoRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.NetworkInfo do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :graph_diameter, 1, type: :uint32, json_name: "graphDiameter"
  field :avg_out_degree, 2, type: :double, json_name: "avgOutDegree"
  field :max_out_degree, 3, type: :uint32, json_name: "maxOutDegree"
  field :num_nodes, 4, type: :uint32, json_name: "numNodes"
  field :num_channels, 5, type: :uint32, json_name: "numChannels"
  field :total_network_capacity, 6, type: :int64, json_name: "totalNetworkCapacity"
  field :avg_channel_size, 7, type: :double, json_name: "avgChannelSize"
  field :min_channel_size, 8, type: :int64, json_name: "minChannelSize"
  field :max_channel_size, 9, type: :int64, json_name: "maxChannelSize"
  field :median_channel_size_sat, 10, type: :int64, json_name: "medianChannelSizeSat"
  field :num_zombie_chans, 11, type: :uint64, json_name: "numZombieChans"
end

defmodule Lnrpc.StopRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.StopResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.GraphTopologySubscription do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.GraphTopologyUpdate do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :node_updates, 1, repeated: true, type: Lnrpc.NodeUpdate, json_name: "nodeUpdates"

  field :channel_updates, 2,
    repeated: true,
    type: Lnrpc.ChannelEdgeUpdate,
    json_name: "channelUpdates"

  field :closed_chans, 3,
    repeated: true,
    type: Lnrpc.ClosedChannelUpdate,
    json_name: "closedChans"
end

defmodule Lnrpc.NodeUpdate.FeaturesEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :uint32
  field :value, 2, type: Lnrpc.Feature
end

defmodule Lnrpc.NodeUpdate do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :addresses, 1, repeated: true, type: :string, deprecated: true
  field :identity_key, 2, type: :string, json_name: "identityKey"
  field :global_features, 3, type: :bytes, json_name: "globalFeatures", deprecated: true
  field :alias, 4, type: :string
  field :color, 5, type: :string
  field :node_addresses, 7, repeated: true, type: Lnrpc.NodeAddress, json_name: "nodeAddresses"
  field :features, 6, repeated: true, type: Lnrpc.NodeUpdate.FeaturesEntry, map: true
end

defmodule Lnrpc.ChannelEdgeUpdate do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :chan_id, 1, type: :uint64, json_name: "chanId", deprecated: false
  field :chan_point, 2, type: Lnrpc.ChannelPoint, json_name: "chanPoint"
  field :capacity, 3, type: :int64
  field :routing_policy, 4, type: Lnrpc.RoutingPolicy, json_name: "routingPolicy"
  field :advertising_node, 5, type: :string, json_name: "advertisingNode"
  field :connecting_node, 6, type: :string, json_name: "connectingNode"
end

defmodule Lnrpc.ClosedChannelUpdate do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :chan_id, 1, type: :uint64, json_name: "chanId", deprecated: false
  field :capacity, 2, type: :int64
  field :closed_height, 3, type: :uint32, json_name: "closedHeight"
  field :chan_point, 4, type: Lnrpc.ChannelPoint, json_name: "chanPoint"
end

defmodule Lnrpc.HopHint do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :node_id, 1, type: :string, json_name: "nodeId"
  field :chan_id, 2, type: :uint64, json_name: "chanId", deprecated: false
  field :fee_base_msat, 3, type: :uint32, json_name: "feeBaseMsat"
  field :fee_proportional_millionths, 4, type: :uint32, json_name: "feeProportionalMillionths"
  field :cltv_expiry_delta, 5, type: :uint32, json_name: "cltvExpiryDelta"
end

defmodule Lnrpc.SetID do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :set_id, 1, type: :bytes, json_name: "setId"
end

defmodule Lnrpc.RouteHint do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :hop_hints, 1, repeated: true, type: Lnrpc.HopHint, json_name: "hopHints"
end

defmodule Lnrpc.AMPInvoiceState do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :state, 1, type: Lnrpc.InvoiceHTLCState, enum: true
  field :settle_index, 2, type: :uint64, json_name: "settleIndex"
  field :settle_time, 3, type: :int64, json_name: "settleTime"
  field :amt_paid_msat, 5, type: :int64, json_name: "amtPaidMsat"
end

defmodule Lnrpc.Invoice.FeaturesEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :uint32
  field :value, 2, type: Lnrpc.Feature
end

defmodule Lnrpc.Invoice.AmpInvoiceStateEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Lnrpc.AMPInvoiceState
end

defmodule Lnrpc.Invoice do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :memo, 1, type: :string
  field :r_preimage, 3, type: :bytes, json_name: "rPreimage"
  field :r_hash, 4, type: :bytes, json_name: "rHash"
  field :value, 5, type: :int64
  field :value_msat, 23, type: :int64, json_name: "valueMsat"
  field :settled, 6, type: :bool, deprecated: true
  field :creation_date, 7, type: :int64, json_name: "creationDate"
  field :settle_date, 8, type: :int64, json_name: "settleDate"
  field :payment_request, 9, type: :string, json_name: "paymentRequest"
  field :description_hash, 10, type: :bytes, json_name: "descriptionHash"
  field :expiry, 11, type: :int64
  field :fallback_addr, 12, type: :string, json_name: "fallbackAddr"
  field :cltv_expiry, 13, type: :uint64, json_name: "cltvExpiry"
  field :route_hints, 14, repeated: true, type: Lnrpc.RouteHint, json_name: "routeHints"
  field :private, 15, type: :bool
  field :add_index, 16, type: :uint64, json_name: "addIndex"
  field :settle_index, 17, type: :uint64, json_name: "settleIndex"
  field :amt_paid, 18, type: :int64, json_name: "amtPaid", deprecated: true
  field :amt_paid_sat, 19, type: :int64, json_name: "amtPaidSat"
  field :amt_paid_msat, 20, type: :int64, json_name: "amtPaidMsat"
  field :state, 21, type: Lnrpc.Invoice.InvoiceState, enum: true
  field :htlcs, 22, repeated: true, type: Lnrpc.InvoiceHTLC
  field :features, 24, repeated: true, type: Lnrpc.Invoice.FeaturesEntry, map: true
  field :is_keysend, 25, type: :bool, json_name: "isKeysend"
  field :payment_addr, 26, type: :bytes, json_name: "paymentAddr"
  field :is_amp, 27, type: :bool, json_name: "isAmp"

  field :amp_invoice_state, 28,
    repeated: true,
    type: Lnrpc.Invoice.AmpInvoiceStateEntry,
    json_name: "ampInvoiceState",
    map: true
end

defmodule Lnrpc.InvoiceHTLC.CustomRecordsEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :uint64
  field :value, 2, type: :bytes
end

defmodule Lnrpc.InvoiceHTLC do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :chan_id, 1, type: :uint64, json_name: "chanId", deprecated: false
  field :htlc_index, 2, type: :uint64, json_name: "htlcIndex"
  field :amt_msat, 3, type: :uint64, json_name: "amtMsat"
  field :accept_height, 4, type: :int32, json_name: "acceptHeight"
  field :accept_time, 5, type: :int64, json_name: "acceptTime"
  field :resolve_time, 6, type: :int64, json_name: "resolveTime"
  field :expiry_height, 7, type: :int32, json_name: "expiryHeight"
  field :state, 8, type: Lnrpc.InvoiceHTLCState, enum: true

  field :custom_records, 9,
    repeated: true,
    type: Lnrpc.InvoiceHTLC.CustomRecordsEntry,
    json_name: "customRecords",
    map: true

  field :mpp_total_amt_msat, 10, type: :uint64, json_name: "mppTotalAmtMsat"
  field :amp, 11, type: Lnrpc.AMP
end

defmodule Lnrpc.AMP do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :root_share, 1, type: :bytes, json_name: "rootShare"
  field :set_id, 2, type: :bytes, json_name: "setId"
  field :child_index, 3, type: :uint32, json_name: "childIndex"
  field :hash, 4, type: :bytes
  field :preimage, 5, type: :bytes
end

defmodule Lnrpc.AddInvoiceResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :r_hash, 1, type: :bytes, json_name: "rHash"
  field :payment_request, 2, type: :string, json_name: "paymentRequest"
  field :add_index, 16, type: :uint64, json_name: "addIndex"
  field :payment_addr, 17, type: :bytes, json_name: "paymentAddr"
end

defmodule Lnrpc.PaymentHash do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :r_hash_str, 1, type: :string, json_name: "rHashStr", deprecated: true
  field :r_hash, 2, type: :bytes, json_name: "rHash"
end

defmodule Lnrpc.ListInvoiceRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :pending_only, 1, type: :bool, json_name: "pendingOnly"
  field :index_offset, 4, type: :uint64, json_name: "indexOffset"
  field :num_max_invoices, 5, type: :uint64, json_name: "numMaxInvoices"
  field :reversed, 6, type: :bool
end

defmodule Lnrpc.ListInvoiceResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :invoices, 1, repeated: true, type: Lnrpc.Invoice
  field :last_index_offset, 2, type: :uint64, json_name: "lastIndexOffset"
  field :first_index_offset, 3, type: :uint64, json_name: "firstIndexOffset"
end

defmodule Lnrpc.InvoiceSubscription do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :add_index, 1, type: :uint64, json_name: "addIndex"
  field :settle_index, 2, type: :uint64, json_name: "settleIndex"
end

defmodule Lnrpc.Payment do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :payment_hash, 1, type: :string, json_name: "paymentHash"
  field :value, 2, type: :int64, deprecated: true
  field :creation_date, 3, type: :int64, json_name: "creationDate", deprecated: true
  field :fee, 5, type: :int64, deprecated: true
  field :payment_preimage, 6, type: :string, json_name: "paymentPreimage"
  field :value_sat, 7, type: :int64, json_name: "valueSat"
  field :value_msat, 8, type: :int64, json_name: "valueMsat"
  field :payment_request, 9, type: :string, json_name: "paymentRequest"
  field :status, 10, type: Lnrpc.Payment.PaymentStatus, enum: true
  field :fee_sat, 11, type: :int64, json_name: "feeSat"
  field :fee_msat, 12, type: :int64, json_name: "feeMsat"
  field :creation_time_ns, 13, type: :int64, json_name: "creationTimeNs"
  field :htlcs, 14, repeated: true, type: Lnrpc.HTLCAttempt
  field :payment_index, 15, type: :uint64, json_name: "paymentIndex"

  field :failure_reason, 16,
    type: Lnrpc.PaymentFailureReason,
    json_name: "failureReason",
    enum: true
end

defmodule Lnrpc.HTLCAttempt do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :attempt_id, 7, type: :uint64, json_name: "attemptId"
  field :status, 1, type: Lnrpc.HTLCAttempt.HTLCStatus, enum: true
  field :route, 2, type: Lnrpc.Route
  field :attempt_time_ns, 3, type: :int64, json_name: "attemptTimeNs"
  field :resolve_time_ns, 4, type: :int64, json_name: "resolveTimeNs"
  field :failure, 5, type: Lnrpc.Failure
  field :preimage, 6, type: :bytes
end

defmodule Lnrpc.ListPaymentsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :include_incomplete, 1, type: :bool, json_name: "includeIncomplete"
  field :index_offset, 2, type: :uint64, json_name: "indexOffset"
  field :max_payments, 3, type: :uint64, json_name: "maxPayments"
  field :reversed, 4, type: :bool
  field :count_total_payments, 5, type: :bool, json_name: "countTotalPayments"
end

defmodule Lnrpc.ListPaymentsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :payments, 1, repeated: true, type: Lnrpc.Payment
  field :first_index_offset, 2, type: :uint64, json_name: "firstIndexOffset"
  field :last_index_offset, 3, type: :uint64, json_name: "lastIndexOffset"
  field :total_num_payments, 4, type: :uint64, json_name: "totalNumPayments"
end

defmodule Lnrpc.DeletePaymentRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :payment_hash, 1, type: :bytes, json_name: "paymentHash"
  field :failed_htlcs_only, 2, type: :bool, json_name: "failedHtlcsOnly"
end

defmodule Lnrpc.DeleteAllPaymentsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :failed_payments_only, 1, type: :bool, json_name: "failedPaymentsOnly"
  field :failed_htlcs_only, 2, type: :bool, json_name: "failedHtlcsOnly"
end

defmodule Lnrpc.DeletePaymentResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.DeleteAllPaymentsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.AbandonChannelRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :channel_point, 1, type: Lnrpc.ChannelPoint, json_name: "channelPoint"
  field :pending_funding_shim_only, 2, type: :bool, json_name: "pendingFundingShimOnly"
  field :i_know_what_i_am_doing, 3, type: :bool, json_name: "iKnowWhatIAmDoing"
end

defmodule Lnrpc.AbandonChannelResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.DebugLevelRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :show, 1, type: :bool
  field :level_spec, 2, type: :string, json_name: "levelSpec"
end

defmodule Lnrpc.DebugLevelResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :sub_systems, 1, type: :string, json_name: "subSystems"
end

defmodule Lnrpc.PayReqString do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :pay_req, 1, type: :string, json_name: "payReq"
end

defmodule Lnrpc.PayReq.FeaturesEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :uint32
  field :value, 2, type: Lnrpc.Feature
end

defmodule Lnrpc.PayReq do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :destination, 1, type: :string
  field :payment_hash, 2, type: :string, json_name: "paymentHash"
  field :num_satoshis, 3, type: :int64, json_name: "numSatoshis"
  field :timestamp, 4, type: :int64
  field :expiry, 5, type: :int64
  field :description, 6, type: :string
  field :description_hash, 7, type: :string, json_name: "descriptionHash"
  field :fallback_addr, 8, type: :string, json_name: "fallbackAddr"
  field :cltv_expiry, 9, type: :int64, json_name: "cltvExpiry"
  field :route_hints, 10, repeated: true, type: Lnrpc.RouteHint, json_name: "routeHints"
  field :payment_addr, 11, type: :bytes, json_name: "paymentAddr"
  field :num_msat, 12, type: :int64, json_name: "numMsat"
  field :features, 13, repeated: true, type: Lnrpc.PayReq.FeaturesEntry, map: true
end

defmodule Lnrpc.Feature do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :name, 2, type: :string
  field :is_required, 3, type: :bool, json_name: "isRequired"
  field :is_known, 4, type: :bool, json_name: "isKnown"
end

defmodule Lnrpc.FeeReportRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.ChannelFeeReport do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :chan_id, 5, type: :uint64, json_name: "chanId", deprecated: false
  field :channel_point, 1, type: :string, json_name: "channelPoint"
  field :base_fee_msat, 2, type: :int64, json_name: "baseFeeMsat"
  field :fee_per_mil, 3, type: :int64, json_name: "feePerMil"
  field :fee_rate, 4, type: :double, json_name: "feeRate"
end

defmodule Lnrpc.FeeReportResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :channel_fees, 1, repeated: true, type: Lnrpc.ChannelFeeReport, json_name: "channelFees"
  field :day_fee_sum, 2, type: :uint64, json_name: "dayFeeSum"
  field :week_fee_sum, 3, type: :uint64, json_name: "weekFeeSum"
  field :month_fee_sum, 4, type: :uint64, json_name: "monthFeeSum"
end

defmodule Lnrpc.PolicyUpdateRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :scope, 0

  field :global, 1, type: :bool, oneof: 0
  field :chan_point, 2, type: Lnrpc.ChannelPoint, json_name: "chanPoint", oneof: 0
  field :base_fee_msat, 3, type: :int64, json_name: "baseFeeMsat"
  field :fee_rate, 4, type: :double, json_name: "feeRate"
  field :fee_rate_ppm, 9, type: :uint32, json_name: "feeRatePpm"
  field :time_lock_delta, 5, type: :uint32, json_name: "timeLockDelta"
  field :max_htlc_msat, 6, type: :uint64, json_name: "maxHtlcMsat"
  field :min_htlc_msat, 7, type: :uint64, json_name: "minHtlcMsat"
  field :min_htlc_msat_specified, 8, type: :bool, json_name: "minHtlcMsatSpecified"
end

defmodule Lnrpc.FailedUpdate do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :outpoint, 1, type: Lnrpc.OutPoint
  field :reason, 2, type: Lnrpc.UpdateFailure, enum: true
  field :update_error, 3, type: :string, json_name: "updateError"
end

defmodule Lnrpc.PolicyUpdateResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :failed_updates, 1, repeated: true, type: Lnrpc.FailedUpdate, json_name: "failedUpdates"
end

defmodule Lnrpc.ForwardingHistoryRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :start_time, 1, type: :uint64, json_name: "startTime"
  field :end_time, 2, type: :uint64, json_name: "endTime"
  field :index_offset, 3, type: :uint32, json_name: "indexOffset"
  field :num_max_events, 4, type: :uint32, json_name: "numMaxEvents"
end

defmodule Lnrpc.ForwardingEvent do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :timestamp, 1, type: :uint64, deprecated: true
  field :chan_id_in, 2, type: :uint64, json_name: "chanIdIn", deprecated: false
  field :chan_id_out, 4, type: :uint64, json_name: "chanIdOut", deprecated: false
  field :amt_in, 5, type: :uint64, json_name: "amtIn"
  field :amt_out, 6, type: :uint64, json_name: "amtOut"
  field :fee, 7, type: :uint64
  field :fee_msat, 8, type: :uint64, json_name: "feeMsat"
  field :amt_in_msat, 9, type: :uint64, json_name: "amtInMsat"
  field :amt_out_msat, 10, type: :uint64, json_name: "amtOutMsat"
  field :timestamp_ns, 11, type: :uint64, json_name: "timestampNs"
end

defmodule Lnrpc.ForwardingHistoryResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :forwarding_events, 1,
    repeated: true,
    type: Lnrpc.ForwardingEvent,
    json_name: "forwardingEvents"

  field :last_offset_index, 2, type: :uint32, json_name: "lastOffsetIndex"
end

defmodule Lnrpc.ExportChannelBackupRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :chan_point, 1, type: Lnrpc.ChannelPoint, json_name: "chanPoint"
end

defmodule Lnrpc.ChannelBackup do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :chan_point, 1, type: Lnrpc.ChannelPoint, json_name: "chanPoint"
  field :chan_backup, 2, type: :bytes, json_name: "chanBackup"
end

defmodule Lnrpc.MultiChanBackup do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :chan_points, 1, repeated: true, type: Lnrpc.ChannelPoint, json_name: "chanPoints"
  field :multi_chan_backup, 2, type: :bytes, json_name: "multiChanBackup"
end

defmodule Lnrpc.ChanBackupExportRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.ChanBackupSnapshot do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :single_chan_backups, 1, type: Lnrpc.ChannelBackups, json_name: "singleChanBackups"
  field :multi_chan_backup, 2, type: Lnrpc.MultiChanBackup, json_name: "multiChanBackup"
end

defmodule Lnrpc.ChannelBackups do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :chan_backups, 1, repeated: true, type: Lnrpc.ChannelBackup, json_name: "chanBackups"
end

defmodule Lnrpc.RestoreChanBackupRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :backup, 0

  field :chan_backups, 1, type: Lnrpc.ChannelBackups, json_name: "chanBackups", oneof: 0
  field :multi_chan_backup, 2, type: :bytes, json_name: "multiChanBackup", oneof: 0
end

defmodule Lnrpc.RestoreBackupResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.ChannelBackupSubscription do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.VerifyChanBackupResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.MacaroonPermission do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :entity, 1, type: :string
  field :action, 2, type: :string
end

defmodule Lnrpc.BakeMacaroonRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :permissions, 1, repeated: true, type: Lnrpc.MacaroonPermission
  field :root_key_id, 2, type: :uint64, json_name: "rootKeyId"
  field :allow_external_permissions, 3, type: :bool, json_name: "allowExternalPermissions"
end

defmodule Lnrpc.BakeMacaroonResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :macaroon, 1, type: :string
end

defmodule Lnrpc.ListMacaroonIDsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.ListMacaroonIDsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :root_key_ids, 1, repeated: true, type: :uint64, json_name: "rootKeyIds"
end

defmodule Lnrpc.DeleteMacaroonIDRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :root_key_id, 1, type: :uint64, json_name: "rootKeyId"
end

defmodule Lnrpc.DeleteMacaroonIDResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :deleted, 1, type: :bool
end

defmodule Lnrpc.MacaroonPermissionList do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :permissions, 1, repeated: true, type: Lnrpc.MacaroonPermission
end

defmodule Lnrpc.ListPermissionsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Lnrpc.ListPermissionsResponse.MethodPermissionsEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Lnrpc.MacaroonPermissionList
end

defmodule Lnrpc.ListPermissionsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :method_permissions, 1,
    repeated: true,
    type: Lnrpc.ListPermissionsResponse.MethodPermissionsEntry,
    json_name: "methodPermissions",
    map: true
end

defmodule Lnrpc.Failure do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :code, 1, type: Lnrpc.Failure.FailureCode, enum: true
  field :channel_update, 3, type: Lnrpc.ChannelUpdate, json_name: "channelUpdate"
  field :htlc_msat, 4, type: :uint64, json_name: "htlcMsat"
  field :onion_sha_256, 5, type: :bytes, json_name: "onionSha256"
  field :cltv_expiry, 6, type: :uint32, json_name: "cltvExpiry"
  field :flags, 7, type: :uint32
  field :failure_source_index, 8, type: :uint32, json_name: "failureSourceIndex"
  field :height, 9, type: :uint32
end

defmodule Lnrpc.ChannelUpdate do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :signature, 1, type: :bytes
  field :chain_hash, 2, type: :bytes, json_name: "chainHash"
  field :chan_id, 3, type: :uint64, json_name: "chanId", deprecated: false
  field :timestamp, 4, type: :uint32
  field :message_flags, 10, type: :uint32, json_name: "messageFlags"
  field :channel_flags, 5, type: :uint32, json_name: "channelFlags"
  field :time_lock_delta, 6, type: :uint32, json_name: "timeLockDelta"
  field :htlc_minimum_msat, 7, type: :uint64, json_name: "htlcMinimumMsat"
  field :base_fee, 8, type: :uint32, json_name: "baseFee"
  field :fee_rate, 9, type: :uint32, json_name: "feeRate"
  field :htlc_maximum_msat, 11, type: :uint64, json_name: "htlcMaximumMsat"
  field :extra_opaque_data, 12, type: :bytes, json_name: "extraOpaqueData"
end

defmodule Lnrpc.MacaroonId do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :nonce, 1, type: :bytes
  field :storageId, 2, type: :bytes
  field :ops, 3, repeated: true, type: Lnrpc.Op
end

defmodule Lnrpc.Op do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :entity, 1, type: :string
  field :actions, 2, repeated: true, type: :string
end

defmodule Lnrpc.CheckMacPermRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :macaroon, 1, type: :bytes
  field :permissions, 2, repeated: true, type: Lnrpc.MacaroonPermission
  field :fullMethod, 3, type: :string
end

defmodule Lnrpc.CheckMacPermResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :valid, 1, type: :bool
end

defmodule Lnrpc.RPCMiddlewareRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :intercept_type, 0

  field :request_id, 1, type: :uint64, json_name: "requestId"
  field :raw_macaroon, 2, type: :bytes, json_name: "rawMacaroon"
  field :custom_caveat_condition, 3, type: :string, json_name: "customCaveatCondition"
  field :stream_auth, 4, type: Lnrpc.StreamAuth, json_name: "streamAuth", oneof: 0
  field :request, 5, type: Lnrpc.RPCMessage, oneof: 0
  field :response, 6, type: Lnrpc.RPCMessage, oneof: 0
  field :reg_complete, 8, type: :bool, json_name: "regComplete", oneof: 0
  field :msg_id, 7, type: :uint64, json_name: "msgId"
end

defmodule Lnrpc.StreamAuth do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :method_full_uri, 1, type: :string, json_name: "methodFullUri"
end

defmodule Lnrpc.RPCMessage do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :method_full_uri, 1, type: :string, json_name: "methodFullUri"
  field :stream_rpc, 2, type: :bool, json_name: "streamRpc"
  field :type_name, 3, type: :string, json_name: "typeName"
  field :serialized, 4, type: :bytes
  field :is_error, 5, type: :bool, json_name: "isError"
end

defmodule Lnrpc.RPCMiddlewareResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :middleware_message, 0

  field :ref_msg_id, 1, type: :uint64, json_name: "refMsgId"
  field :register, 2, type: Lnrpc.MiddlewareRegistration, oneof: 0
  field :feedback, 3, type: Lnrpc.InterceptFeedback, oneof: 0
end

defmodule Lnrpc.MiddlewareRegistration do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :middleware_name, 1, type: :string, json_name: "middlewareName"
  field :custom_macaroon_caveat_name, 2, type: :string, json_name: "customMacaroonCaveatName"
  field :read_only_mode, 3, type: :bool, json_name: "readOnlyMode"
end

defmodule Lnrpc.InterceptFeedback do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :error, 1, type: :string
  field :replace_response, 2, type: :bool, json_name: "replaceResponse"
  field :replacement_serialized, 3, type: :bytes, json_name: "replacementSerialized"
end

defmodule Lnrpc.Lightning.Service do
  @moduledoc false
  use GRPC.Service, name: "lnrpc.Lightning", protoc_gen_elixir_version: "0.11.0"

  rpc :WalletBalance, Lnrpc.WalletBalanceRequest, Lnrpc.WalletBalanceResponse

  rpc :ChannelBalance, Lnrpc.ChannelBalanceRequest, Lnrpc.ChannelBalanceResponse

  rpc :GetTransactions, Lnrpc.GetTransactionsRequest, Lnrpc.TransactionDetails

  rpc :EstimateFee, Lnrpc.EstimateFeeRequest, Lnrpc.EstimateFeeResponse

  rpc :SendCoins, Lnrpc.SendCoinsRequest, Lnrpc.SendCoinsResponse

  rpc :ListUnspent, Lnrpc.ListUnspentRequest, Lnrpc.ListUnspentResponse

  rpc :SubscribeTransactions, Lnrpc.GetTransactionsRequest, stream(Lnrpc.Transaction)

  rpc :SendMany, Lnrpc.SendManyRequest, Lnrpc.SendManyResponse

  rpc :NewAddress, Lnrpc.NewAddressRequest, Lnrpc.NewAddressResponse

  rpc :SignMessage, Lnrpc.SignMessageRequest, Lnrpc.SignMessageResponse

  rpc :VerifyMessage, Lnrpc.VerifyMessageRequest, Lnrpc.VerifyMessageResponse

  rpc :ConnectPeer, Lnrpc.ConnectPeerRequest, Lnrpc.ConnectPeerResponse

  rpc :DisconnectPeer, Lnrpc.DisconnectPeerRequest, Lnrpc.DisconnectPeerResponse

  rpc :ListPeers, Lnrpc.ListPeersRequest, Lnrpc.ListPeersResponse

  rpc :SubscribePeerEvents, Lnrpc.PeerEventSubscription, stream(Lnrpc.PeerEvent)

  rpc :GetInfo, Lnrpc.GetInfoRequest, Lnrpc.GetInfoResponse

  rpc :GetRecoveryInfo, Lnrpc.GetRecoveryInfoRequest, Lnrpc.GetRecoveryInfoResponse

  rpc :PendingChannels, Lnrpc.PendingChannelsRequest, Lnrpc.PendingChannelsResponse

  rpc :ListChannels, Lnrpc.ListChannelsRequest, Lnrpc.ListChannelsResponse

  rpc :SubscribeChannelEvents, Lnrpc.ChannelEventSubscription, stream(Lnrpc.ChannelEventUpdate)

  rpc :ClosedChannels, Lnrpc.ClosedChannelsRequest, Lnrpc.ClosedChannelsResponse

  rpc :OpenChannelSync, Lnrpc.OpenChannelRequest, Lnrpc.ChannelPoint

  rpc :OpenChannel, Lnrpc.OpenChannelRequest, stream(Lnrpc.OpenStatusUpdate)

  rpc :BatchOpenChannel, Lnrpc.BatchOpenChannelRequest, Lnrpc.BatchOpenChannelResponse

  rpc :FundingStateStep, Lnrpc.FundingTransitionMsg, Lnrpc.FundingStateStepResp

  rpc :ChannelAcceptor, stream(Lnrpc.ChannelAcceptResponse), stream(Lnrpc.ChannelAcceptRequest)

  rpc :CloseChannel, Lnrpc.CloseChannelRequest, stream(Lnrpc.CloseStatusUpdate)

  rpc :AbandonChannel, Lnrpc.AbandonChannelRequest, Lnrpc.AbandonChannelResponse

  rpc :SendPayment, stream(Lnrpc.SendRequest), stream(Lnrpc.SendResponse)

  rpc :SendPaymentSync, Lnrpc.SendRequest, Lnrpc.SendResponse

  rpc :SendToRoute, stream(Lnrpc.SendToRouteRequest), stream(Lnrpc.SendResponse)

  rpc :SendToRouteSync, Lnrpc.SendToRouteRequest, Lnrpc.SendResponse

  rpc :AddInvoice, Lnrpc.Invoice, Lnrpc.AddInvoiceResponse

  rpc :ListInvoices, Lnrpc.ListInvoiceRequest, Lnrpc.ListInvoiceResponse

  rpc :LookupInvoice, Lnrpc.PaymentHash, Lnrpc.Invoice

  rpc :SubscribeInvoices, Lnrpc.InvoiceSubscription, stream(Lnrpc.Invoice)

  rpc :DecodePayReq, Lnrpc.PayReqString, Lnrpc.PayReq

  rpc :ListPayments, Lnrpc.ListPaymentsRequest, Lnrpc.ListPaymentsResponse

  rpc :DeletePayment, Lnrpc.DeletePaymentRequest, Lnrpc.DeletePaymentResponse

  rpc :DeleteAllPayments, Lnrpc.DeleteAllPaymentsRequest, Lnrpc.DeleteAllPaymentsResponse

  rpc :DescribeGraph, Lnrpc.ChannelGraphRequest, Lnrpc.ChannelGraph

  rpc :GetNodeMetrics, Lnrpc.NodeMetricsRequest, Lnrpc.NodeMetricsResponse

  rpc :GetChanInfo, Lnrpc.ChanInfoRequest, Lnrpc.ChannelEdge

  rpc :GetNodeInfo, Lnrpc.NodeInfoRequest, Lnrpc.NodeInfo

  rpc :QueryRoutes, Lnrpc.QueryRoutesRequest, Lnrpc.QueryRoutesResponse

  rpc :GetNetworkInfo, Lnrpc.NetworkInfoRequest, Lnrpc.NetworkInfo

  rpc :StopDaemon, Lnrpc.StopRequest, Lnrpc.StopResponse

  rpc :SubscribeChannelGraph, Lnrpc.GraphTopologySubscription, stream(Lnrpc.GraphTopologyUpdate)

  rpc :DebugLevel, Lnrpc.DebugLevelRequest, Lnrpc.DebugLevelResponse

  rpc :FeeReport, Lnrpc.FeeReportRequest, Lnrpc.FeeReportResponse

  rpc :UpdateChannelPolicy, Lnrpc.PolicyUpdateRequest, Lnrpc.PolicyUpdateResponse

  rpc :ForwardingHistory, Lnrpc.ForwardingHistoryRequest, Lnrpc.ForwardingHistoryResponse

  rpc :ExportChannelBackup, Lnrpc.ExportChannelBackupRequest, Lnrpc.ChannelBackup

  rpc :ExportAllChannelBackups, Lnrpc.ChanBackupExportRequest, Lnrpc.ChanBackupSnapshot

  rpc :VerifyChanBackup, Lnrpc.ChanBackupSnapshot, Lnrpc.VerifyChanBackupResponse

  rpc :RestoreChannelBackups, Lnrpc.RestoreChanBackupRequest, Lnrpc.RestoreBackupResponse

  rpc :SubscribeChannelBackups, Lnrpc.ChannelBackupSubscription, stream(Lnrpc.ChanBackupSnapshot)

  rpc :BakeMacaroon, Lnrpc.BakeMacaroonRequest, Lnrpc.BakeMacaroonResponse

  rpc :ListMacaroonIDs, Lnrpc.ListMacaroonIDsRequest, Lnrpc.ListMacaroonIDsResponse

  rpc :DeleteMacaroonID, Lnrpc.DeleteMacaroonIDRequest, Lnrpc.DeleteMacaroonIDResponse

  rpc :ListPermissions, Lnrpc.ListPermissionsRequest, Lnrpc.ListPermissionsResponse

  rpc :CheckMacaroonPermissions, Lnrpc.CheckMacPermRequest, Lnrpc.CheckMacPermResponse

  rpc :RegisterRPCMiddleware,
      stream(Lnrpc.RPCMiddlewareResponse),
      stream(Lnrpc.RPCMiddlewareRequest)

  rpc :SendCustomMessage, Lnrpc.SendCustomMessageRequest, Lnrpc.SendCustomMessageResponse

  rpc :SubscribeCustomMessages, Lnrpc.SubscribeCustomMessagesRequest, stream(Lnrpc.CustomMessage)

  rpc :ListAliases, Lnrpc.ListAliasesRequest, Lnrpc.ListAliasesResponse
end

defmodule Lnrpc.Lightning.Stub do
  @moduledoc false
  use GRPC.Stub, service: Lnrpc.Lightning.Service
end