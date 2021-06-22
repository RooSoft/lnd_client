defmodule Lnrpc.AddressType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :WITNESS_PUBKEY_HASH
          | :NESTED_PUBKEY_HASH
          | :UNUSED_WITNESS_PUBKEY_HASH
          | :UNUSED_NESTED_PUBKEY_HASH

  field :WITNESS_PUBKEY_HASH, 0
  field :NESTED_PUBKEY_HASH, 1
  field :UNUSED_WITNESS_PUBKEY_HASH, 2
  field :UNUSED_NESTED_PUBKEY_HASH, 3
end

defmodule Lnrpc.CommitmentType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :LEGACY | :STATIC_REMOTE_KEY | :ANCHORS | :UNKNOWN_COMMITMENT_TYPE

  field :LEGACY, 0
  field :STATIC_REMOTE_KEY, 1
  field :ANCHORS, 2
  field :UNKNOWN_COMMITMENT_TYPE, 999
end

defmodule Lnrpc.Initiator do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :INITIATOR_UNKNOWN | :INITIATOR_LOCAL | :INITIATOR_REMOTE | :INITIATOR_BOTH

  field :INITIATOR_UNKNOWN, 0
  field :INITIATOR_LOCAL, 1
  field :INITIATOR_REMOTE, 2
  field :INITIATOR_BOTH, 3
end

defmodule Lnrpc.ResolutionType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :TYPE_UNKNOWN | :ANCHOR | :INCOMING_HTLC | :OUTGOING_HTLC | :COMMIT

  field :TYPE_UNKNOWN, 0
  field :ANCHOR, 1
  field :INCOMING_HTLC, 2
  field :OUTGOING_HTLC, 3
  field :COMMIT, 4
end

defmodule Lnrpc.ResolutionOutcome do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :OUTCOME_UNKNOWN
          | :CLAIMED
          | :UNCLAIMED
          | :ABANDONED
          | :FIRST_STAGE
          | :TIMEOUT

  field :OUTCOME_UNKNOWN, 0
  field :CLAIMED, 1
  field :UNCLAIMED, 2
  field :ABANDONED, 3
  field :FIRST_STAGE, 4
  field :TIMEOUT, 5
end

defmodule Lnrpc.NodeMetricType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :UNKNOWN | :BETWEENNESS_CENTRALITY

  field :UNKNOWN, 0
  field :BETWEENNESS_CENTRALITY, 1
end

defmodule Lnrpc.InvoiceHTLCState do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :ACCEPTED | :SETTLED | :CANCELED

  field :ACCEPTED, 0
  field :SETTLED, 1
  field :CANCELED, 2
end

defmodule Lnrpc.PaymentFailureReason do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :FAILURE_REASON_NONE
          | :FAILURE_REASON_TIMEOUT
          | :FAILURE_REASON_NO_ROUTE
          | :FAILURE_REASON_ERROR
          | :FAILURE_REASON_INCORRECT_PAYMENT_DETAILS
          | :FAILURE_REASON_INSUFFICIENT_BALANCE

  field :FAILURE_REASON_NONE, 0
  field :FAILURE_REASON_TIMEOUT, 1
  field :FAILURE_REASON_NO_ROUTE, 2
  field :FAILURE_REASON_ERROR, 3
  field :FAILURE_REASON_INCORRECT_PAYMENT_DETAILS, 4
  field :FAILURE_REASON_INSUFFICIENT_BALANCE, 5
end

defmodule Lnrpc.FeatureBit do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :DATALOSS_PROTECT_REQ
          | :DATALOSS_PROTECT_OPT
          | :INITIAL_ROUING_SYNC
          | :UPFRONT_SHUTDOWN_SCRIPT_REQ
          | :UPFRONT_SHUTDOWN_SCRIPT_OPT
          | :GOSSIP_QUERIES_REQ
          | :GOSSIP_QUERIES_OPT
          | :TLV_ONION_REQ
          | :TLV_ONION_OPT
          | :EXT_GOSSIP_QUERIES_REQ
          | :EXT_GOSSIP_QUERIES_OPT
          | :STATIC_REMOTE_KEY_REQ
          | :STATIC_REMOTE_KEY_OPT
          | :PAYMENT_ADDR_REQ
          | :PAYMENT_ADDR_OPT
          | :MPP_REQ
          | :MPP_OPT
          | :WUMBO_CHANNELS_REQ
          | :WUMBO_CHANNELS_OPT
          | :ANCHORS_REQ
          | :ANCHORS_OPT
          | :ANCHORS_ZERO_FEE_HTLC_REQ
          | :ANCHORS_ZERO_FEE_HTLC_OPT

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
end

defmodule Lnrpc.ChannelCloseSummary.ClosureType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :COOPERATIVE_CLOSE
          | :LOCAL_FORCE_CLOSE
          | :REMOTE_FORCE_CLOSE
          | :BREACH_CLOSE
          | :FUNDING_CANCELED
          | :ABANDONED

  field :COOPERATIVE_CLOSE, 0
  field :LOCAL_FORCE_CLOSE, 1
  field :REMOTE_FORCE_CLOSE, 2
  field :BREACH_CLOSE, 3
  field :FUNDING_CANCELED, 4
  field :ABANDONED, 5
end

defmodule Lnrpc.Peer.SyncType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :UNKNOWN_SYNC | :ACTIVE_SYNC | :PASSIVE_SYNC | :PINNED_SYNC

  field :UNKNOWN_SYNC, 0
  field :ACTIVE_SYNC, 1
  field :PASSIVE_SYNC, 2
  field :PINNED_SYNC, 3
end

defmodule Lnrpc.PeerEvent.EventType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :PEER_ONLINE | :PEER_OFFLINE

  field :PEER_ONLINE, 0
  field :PEER_OFFLINE, 1
end

defmodule Lnrpc.PendingChannelsResponse.ForceClosedChannel.AnchorState do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :LIMBO | :RECOVERED | :LOST

  field :LIMBO, 0
  field :RECOVERED, 1
  field :LOST, 2
end

defmodule Lnrpc.ChannelEventUpdate.UpdateType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :OPEN_CHANNEL
          | :CLOSED_CHANNEL
          | :ACTIVE_CHANNEL
          | :INACTIVE_CHANNEL
          | :PENDING_OPEN_CHANNEL

  field :OPEN_CHANNEL, 0
  field :CLOSED_CHANNEL, 1
  field :ACTIVE_CHANNEL, 2
  field :INACTIVE_CHANNEL, 3
  field :PENDING_OPEN_CHANNEL, 4
end

defmodule Lnrpc.Invoice.InvoiceState do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :OPEN | :SETTLED | :CANCELED | :ACCEPTED

  field :OPEN, 0
  field :SETTLED, 1
  field :CANCELED, 2
  field :ACCEPTED, 3
end

defmodule Lnrpc.Payment.PaymentStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :UNKNOWN | :IN_FLIGHT | :SUCCEEDED | :FAILED

  field :UNKNOWN, 0
  field :IN_FLIGHT, 1
  field :SUCCEEDED, 2
  field :FAILED, 3
end

defmodule Lnrpc.HTLCAttempt.HTLCStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :IN_FLIGHT | :SUCCEEDED | :FAILED

  field :IN_FLIGHT, 0
  field :SUCCEEDED, 1
  field :FAILED, 2
end

defmodule Lnrpc.Failure.FailureCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :RESERVED
          | :INCORRECT_OR_UNKNOWN_PAYMENT_DETAILS
          | :INCORRECT_PAYMENT_AMOUNT
          | :FINAL_INCORRECT_CLTV_EXPIRY
          | :FINAL_INCORRECT_HTLC_AMOUNT
          | :FINAL_EXPIRY_TOO_SOON
          | :INVALID_REALM
          | :EXPIRY_TOO_SOON
          | :INVALID_ONION_VERSION
          | :INVALID_ONION_HMAC
          | :INVALID_ONION_KEY
          | :AMOUNT_BELOW_MINIMUM
          | :FEE_INSUFFICIENT
          | :INCORRECT_CLTV_EXPIRY
          | :CHANNEL_DISABLED
          | :TEMPORARY_CHANNEL_FAILURE
          | :REQUIRED_NODE_FEATURE_MISSING
          | :REQUIRED_CHANNEL_FEATURE_MISSING
          | :UNKNOWN_NEXT_PEER
          | :TEMPORARY_NODE_FAILURE
          | :PERMANENT_NODE_FAILURE
          | :PERMANENT_CHANNEL_FAILURE
          | :EXPIRY_TOO_FAR
          | :MPP_TIMEOUT
          | :INVALID_ONION_PAYLOAD
          | :INTERNAL_FAILURE
          | :UNKNOWN_FAILURE
          | :UNREADABLE_FAILURE

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

defmodule Lnrpc.Utxo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address_type: Lnrpc.AddressType.t(),
          address: String.t(),
          amount_sat: integer,
          pk_script: String.t(),
          outpoint: Lnrpc.OutPoint.t() | nil,
          confirmations: integer
        }
  defstruct [:address_type, :address, :amount_sat, :pk_script, :outpoint, :confirmations]

  field :address_type, 1, type: Lnrpc.AddressType, enum: true
  field :address, 2, type: :string
  field :amount_sat, 3, type: :int64
  field :pk_script, 4, type: :string
  field :outpoint, 5, type: Lnrpc.OutPoint
  field :confirmations, 6, type: :int64
end

defmodule Lnrpc.Transaction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          tx_hash: String.t(),
          amount: integer,
          num_confirmations: integer,
          block_hash: String.t(),
          block_height: integer,
          time_stamp: integer,
          total_fees: integer,
          dest_addresses: [String.t()],
          raw_tx_hex: String.t(),
          label: String.t()
        }
  defstruct [
    :tx_hash,
    :amount,
    :num_confirmations,
    :block_hash,
    :block_height,
    :time_stamp,
    :total_fees,
    :dest_addresses,
    :raw_tx_hex,
    :label
  ]

  field :tx_hash, 1, type: :string
  field :amount, 2, type: :int64
  field :num_confirmations, 3, type: :int32
  field :block_hash, 4, type: :string
  field :block_height, 5, type: :int32
  field :time_stamp, 6, type: :int64
  field :total_fees, 7, type: :int64
  field :dest_addresses, 8, repeated: true, type: :string
  field :raw_tx_hex, 9, type: :string
  field :label, 10, type: :string
end

defmodule Lnrpc.GetTransactionsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          start_height: integer,
          end_height: integer,
          account: String.t()
        }
  defstruct [:start_height, :end_height, :account]

  field :start_height, 1, type: :int32
  field :end_height, 2, type: :int32
  field :account, 3, type: :string
end

defmodule Lnrpc.TransactionDetails do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transactions: [Lnrpc.Transaction.t()]
        }
  defstruct [:transactions]

  field :transactions, 1, repeated: true, type: Lnrpc.Transaction
end

defmodule Lnrpc.FeeLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          limit: {atom, any}
        }
  defstruct [:limit]

  oneof :limit, 0
  field :fixed, 1, type: :int64, oneof: 0
  field :fixed_msat, 3, type: :int64, oneof: 0
  field :percent, 2, type: :int64, oneof: 0
end

defmodule Lnrpc.SendRequest.DestCustomRecordsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: binary
        }
  defstruct [:key, :value]

  field :key, 1, type: :uint64
  field :value, 2, type: :bytes
end

defmodule Lnrpc.SendRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dest: binary,
          dest_string: String.t(),
          amt: integer,
          amt_msat: integer,
          payment_hash: binary,
          payment_hash_string: String.t(),
          payment_request: String.t(),
          final_cltv_delta: integer,
          fee_limit: Lnrpc.FeeLimit.t() | nil,
          outgoing_chan_id: non_neg_integer,
          last_hop_pubkey: binary,
          cltv_limit: non_neg_integer,
          dest_custom_records: %{non_neg_integer => binary},
          allow_self_payment: boolean,
          dest_features: [[Lnrpc.FeatureBit.t()]],
          payment_addr: binary
        }
  defstruct [
    :dest,
    :dest_string,
    :amt,
    :amt_msat,
    :payment_hash,
    :payment_hash_string,
    :payment_request,
    :final_cltv_delta,
    :fee_limit,
    :outgoing_chan_id,
    :last_hop_pubkey,
    :cltv_limit,
    :dest_custom_records,
    :allow_self_payment,
    :dest_features,
    :payment_addr
  ]

  field :dest, 1, type: :bytes
  field :dest_string, 2, type: :string, deprecated: true
  field :amt, 3, type: :int64
  field :amt_msat, 12, type: :int64
  field :payment_hash, 4, type: :bytes
  field :payment_hash_string, 5, type: :string, deprecated: true
  field :payment_request, 6, type: :string
  field :final_cltv_delta, 7, type: :int32
  field :fee_limit, 8, type: Lnrpc.FeeLimit
  field :outgoing_chan_id, 9, type: :uint64
  field :last_hop_pubkey, 13, type: :bytes
  field :cltv_limit, 10, type: :uint32

  field :dest_custom_records, 11,
    repeated: true,
    type: Lnrpc.SendRequest.DestCustomRecordsEntry,
    map: true

  field :allow_self_payment, 14, type: :bool
  field :dest_features, 15, repeated: true, type: Lnrpc.FeatureBit, enum: true
  field :payment_addr, 16, type: :bytes
end

defmodule Lnrpc.SendResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          payment_error: String.t(),
          payment_preimage: binary,
          payment_route: Lnrpc.Route.t() | nil,
          payment_hash: binary
        }
  defstruct [:payment_error, :payment_preimage, :payment_route, :payment_hash]

  field :payment_error, 1, type: :string
  field :payment_preimage, 2, type: :bytes
  field :payment_route, 3, type: Lnrpc.Route
  field :payment_hash, 4, type: :bytes
end

defmodule Lnrpc.SendToRouteRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          payment_hash: binary,
          payment_hash_string: String.t(),
          route: Lnrpc.Route.t() | nil
        }
  defstruct [:payment_hash, :payment_hash_string, :route]

  field :payment_hash, 1, type: :bytes
  field :payment_hash_string, 2, type: :string, deprecated: true
  field :route, 4, type: Lnrpc.Route
end

defmodule Lnrpc.ChannelAcceptRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node_pubkey: binary,
          chain_hash: binary,
          pending_chan_id: binary,
          funding_amt: non_neg_integer,
          push_amt: non_neg_integer,
          dust_limit: non_neg_integer,
          max_value_in_flight: non_neg_integer,
          channel_reserve: non_neg_integer,
          min_htlc: non_neg_integer,
          fee_per_kw: non_neg_integer,
          csv_delay: non_neg_integer,
          max_accepted_htlcs: non_neg_integer,
          channel_flags: non_neg_integer
        }
  defstruct [
    :node_pubkey,
    :chain_hash,
    :pending_chan_id,
    :funding_amt,
    :push_amt,
    :dust_limit,
    :max_value_in_flight,
    :channel_reserve,
    :min_htlc,
    :fee_per_kw,
    :csv_delay,
    :max_accepted_htlcs,
    :channel_flags
  ]

  field :node_pubkey, 1, type: :bytes
  field :chain_hash, 2, type: :bytes
  field :pending_chan_id, 3, type: :bytes
  field :funding_amt, 4, type: :uint64
  field :push_amt, 5, type: :uint64
  field :dust_limit, 6, type: :uint64
  field :max_value_in_flight, 7, type: :uint64
  field :channel_reserve, 8, type: :uint64
  field :min_htlc, 9, type: :uint64
  field :fee_per_kw, 10, type: :uint64
  field :csv_delay, 11, type: :uint32
  field :max_accepted_htlcs, 12, type: :uint32
  field :channel_flags, 13, type: :uint32
end

defmodule Lnrpc.ChannelAcceptResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          accept: boolean,
          pending_chan_id: binary,
          error: String.t(),
          upfront_shutdown: String.t(),
          csv_delay: non_neg_integer,
          reserve_sat: non_neg_integer,
          in_flight_max_msat: non_neg_integer,
          max_htlc_count: non_neg_integer,
          min_htlc_in: non_neg_integer,
          min_accept_depth: non_neg_integer
        }
  defstruct [
    :accept,
    :pending_chan_id,
    :error,
    :upfront_shutdown,
    :csv_delay,
    :reserve_sat,
    :in_flight_max_msat,
    :max_htlc_count,
    :min_htlc_in,
    :min_accept_depth
  ]

  field :accept, 1, type: :bool
  field :pending_chan_id, 2, type: :bytes
  field :error, 3, type: :string
  field :upfront_shutdown, 4, type: :string
  field :csv_delay, 5, type: :uint32
  field :reserve_sat, 6, type: :uint64
  field :in_flight_max_msat, 7, type: :uint64
  field :max_htlc_count, 8, type: :uint32
  field :min_htlc_in, 9, type: :uint64
  field :min_accept_depth, 10, type: :uint32
end

defmodule Lnrpc.ChannelPoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          funding_txid: {atom, any},
          output_index: non_neg_integer
        }
  defstruct [:funding_txid, :output_index]

  oneof :funding_txid, 0
  field :funding_txid_bytes, 1, type: :bytes, oneof: 0
  field :funding_txid_str, 2, type: :string, oneof: 0
  field :output_index, 3, type: :uint32
end

defmodule Lnrpc.OutPoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          txid_bytes: binary,
          txid_str: String.t(),
          output_index: non_neg_integer
        }
  defstruct [:txid_bytes, :txid_str, :output_index]

  field :txid_bytes, 1, type: :bytes
  field :txid_str, 2, type: :string
  field :output_index, 3, type: :uint32
end

defmodule Lnrpc.LightningAddress do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pubkey: String.t(),
          host: String.t()
        }
  defstruct [:pubkey, :host]

  field :pubkey, 1, type: :string
  field :host, 2, type: :string
end

defmodule Lnrpc.EstimateFeeRequest.AddrToAmountEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }
  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Lnrpc.EstimateFeeRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          AddrToAmount: %{String.t() => integer},
          target_conf: integer
        }
  defstruct [:AddrToAmount, :target_conf]

  field :AddrToAmount, 1,
    repeated: true,
    type: Lnrpc.EstimateFeeRequest.AddrToAmountEntry,
    map: true

  field :target_conf, 2, type: :int32
end

defmodule Lnrpc.EstimateFeeResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          fee_sat: integer,
          feerate_sat_per_byte: integer,
          sat_per_vbyte: non_neg_integer
        }
  defstruct [:fee_sat, :feerate_sat_per_byte, :sat_per_vbyte]

  field :fee_sat, 1, type: :int64
  field :feerate_sat_per_byte, 2, type: :int64, deprecated: true
  field :sat_per_vbyte, 3, type: :uint64
end

defmodule Lnrpc.SendManyRequest.AddrToAmountEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }
  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Lnrpc.SendManyRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          AddrToAmount: %{String.t() => integer},
          target_conf: integer,
          sat_per_vbyte: non_neg_integer,
          sat_per_byte: integer,
          label: String.t(),
          min_confs: integer,
          spend_unconfirmed: boolean
        }
  defstruct [
    :AddrToAmount,
    :target_conf,
    :sat_per_vbyte,
    :sat_per_byte,
    :label,
    :min_confs,
    :spend_unconfirmed
  ]

  field :AddrToAmount, 1, repeated: true, type: Lnrpc.SendManyRequest.AddrToAmountEntry, map: true
  field :target_conf, 3, type: :int32
  field :sat_per_vbyte, 4, type: :uint64
  field :sat_per_byte, 5, type: :int64, deprecated: true
  field :label, 6, type: :string
  field :min_confs, 7, type: :int32
  field :spend_unconfirmed, 8, type: :bool
end

defmodule Lnrpc.SendManyResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          txid: String.t()
        }
  defstruct [:txid]

  field :txid, 1, type: :string
end

defmodule Lnrpc.SendCoinsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          addr: String.t(),
          amount: integer,
          target_conf: integer,
          sat_per_vbyte: non_neg_integer,
          sat_per_byte: integer,
          send_all: boolean,
          label: String.t(),
          min_confs: integer,
          spend_unconfirmed: boolean
        }
  defstruct [
    :addr,
    :amount,
    :target_conf,
    :sat_per_vbyte,
    :sat_per_byte,
    :send_all,
    :label,
    :min_confs,
    :spend_unconfirmed
  ]

  field :addr, 1, type: :string
  field :amount, 2, type: :int64
  field :target_conf, 3, type: :int32
  field :sat_per_vbyte, 4, type: :uint64
  field :sat_per_byte, 5, type: :int64, deprecated: true
  field :send_all, 6, type: :bool
  field :label, 7, type: :string
  field :min_confs, 8, type: :int32
  field :spend_unconfirmed, 9, type: :bool
end

defmodule Lnrpc.SendCoinsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          txid: String.t()
        }
  defstruct [:txid]

  field :txid, 1, type: :string
end

defmodule Lnrpc.ListUnspentRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          min_confs: integer,
          max_confs: integer,
          account: String.t()
        }
  defstruct [:min_confs, :max_confs, :account]

  field :min_confs, 1, type: :int32
  field :max_confs, 2, type: :int32
  field :account, 3, type: :string
end

defmodule Lnrpc.ListUnspentResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          utxos: [Lnrpc.Utxo.t()]
        }
  defstruct [:utxos]

  field :utxos, 1, repeated: true, type: Lnrpc.Utxo
end

defmodule Lnrpc.NewAddressRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: Lnrpc.AddressType.t(),
          account: String.t()
        }
  defstruct [:type, :account]

  field :type, 1, type: Lnrpc.AddressType, enum: true
  field :account, 2, type: :string
end

defmodule Lnrpc.NewAddressResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: String.t()
        }
  defstruct [:address]

  field :address, 1, type: :string
end

defmodule Lnrpc.SignMessageRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          msg: binary
        }
  defstruct [:msg]

  field :msg, 1, type: :bytes
end

defmodule Lnrpc.SignMessageResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          signature: String.t()
        }
  defstruct [:signature]

  field :signature, 1, type: :string
end

defmodule Lnrpc.VerifyMessageRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          msg: binary,
          signature: String.t()
        }
  defstruct [:msg, :signature]

  field :msg, 1, type: :bytes
  field :signature, 2, type: :string
end

defmodule Lnrpc.VerifyMessageResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          valid: boolean,
          pubkey: String.t()
        }
  defstruct [:valid, :pubkey]

  field :valid, 1, type: :bool
  field :pubkey, 2, type: :string
end

defmodule Lnrpc.ConnectPeerRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          addr: Lnrpc.LightningAddress.t() | nil,
          perm: boolean,
          timeout: non_neg_integer
        }
  defstruct [:addr, :perm, :timeout]

  field :addr, 1, type: Lnrpc.LightningAddress
  field :perm, 2, type: :bool
  field :timeout, 3, type: :uint64
end

defmodule Lnrpc.ConnectPeerResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.DisconnectPeerRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pub_key: String.t()
        }
  defstruct [:pub_key]

  field :pub_key, 1, type: :string
end

defmodule Lnrpc.DisconnectPeerResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.HTLC do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          incoming: boolean,
          amount: integer,
          hash_lock: binary,
          expiration_height: non_neg_integer,
          htlc_index: non_neg_integer,
          forwarding_channel: non_neg_integer,
          forwarding_htlc_index: non_neg_integer
        }
  defstruct [
    :incoming,
    :amount,
    :hash_lock,
    :expiration_height,
    :htlc_index,
    :forwarding_channel,
    :forwarding_htlc_index
  ]

  field :incoming, 1, type: :bool
  field :amount, 2, type: :int64
  field :hash_lock, 3, type: :bytes
  field :expiration_height, 4, type: :uint32
  field :htlc_index, 5, type: :uint64
  field :forwarding_channel, 6, type: :uint64
  field :forwarding_htlc_index, 7, type: :uint64
end

defmodule Lnrpc.ChannelConstraints do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          csv_delay: non_neg_integer,
          chan_reserve_sat: non_neg_integer,
          dust_limit_sat: non_neg_integer,
          max_pending_amt_msat: non_neg_integer,
          min_htlc_msat: non_neg_integer,
          max_accepted_htlcs: non_neg_integer
        }
  defstruct [
    :csv_delay,
    :chan_reserve_sat,
    :dust_limit_sat,
    :max_pending_amt_msat,
    :min_htlc_msat,
    :max_accepted_htlcs
  ]

  field :csv_delay, 1, type: :uint32
  field :chan_reserve_sat, 2, type: :uint64
  field :dust_limit_sat, 3, type: :uint64
  field :max_pending_amt_msat, 4, type: :uint64
  field :min_htlc_msat, 5, type: :uint64
  field :max_accepted_htlcs, 6, type: :uint32
end

defmodule Lnrpc.Channel do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          active: boolean,
          remote_pubkey: String.t(),
          channel_point: String.t(),
          chan_id: non_neg_integer,
          capacity: integer,
          local_balance: integer,
          remote_balance: integer,
          commit_fee: integer,
          commit_weight: integer,
          fee_per_kw: integer,
          unsettled_balance: integer,
          total_satoshis_sent: integer,
          total_satoshis_received: integer,
          num_updates: non_neg_integer,
          pending_htlcs: [Lnrpc.HTLC.t()],
          csv_delay: non_neg_integer,
          private: boolean,
          initiator: boolean,
          chan_status_flags: String.t(),
          local_chan_reserve_sat: integer,
          remote_chan_reserve_sat: integer,
          static_remote_key: boolean,
          commitment_type: Lnrpc.CommitmentType.t(),
          lifetime: integer,
          uptime: integer,
          close_address: String.t(),
          push_amount_sat: non_neg_integer,
          thaw_height: non_neg_integer,
          local_constraints: Lnrpc.ChannelConstraints.t() | nil,
          remote_constraints: Lnrpc.ChannelConstraints.t() | nil
        }
  defstruct [
    :active,
    :remote_pubkey,
    :channel_point,
    :chan_id,
    :capacity,
    :local_balance,
    :remote_balance,
    :commit_fee,
    :commit_weight,
    :fee_per_kw,
    :unsettled_balance,
    :total_satoshis_sent,
    :total_satoshis_received,
    :num_updates,
    :pending_htlcs,
    :csv_delay,
    :private,
    :initiator,
    :chan_status_flags,
    :local_chan_reserve_sat,
    :remote_chan_reserve_sat,
    :static_remote_key,
    :commitment_type,
    :lifetime,
    :uptime,
    :close_address,
    :push_amount_sat,
    :thaw_height,
    :local_constraints,
    :remote_constraints
  ]

  field :active, 1, type: :bool
  field :remote_pubkey, 2, type: :string
  field :channel_point, 3, type: :string
  field :chan_id, 4, type: :uint64
  field :capacity, 5, type: :int64
  field :local_balance, 6, type: :int64
  field :remote_balance, 7, type: :int64
  field :commit_fee, 8, type: :int64
  field :commit_weight, 9, type: :int64
  field :fee_per_kw, 10, type: :int64
  field :unsettled_balance, 11, type: :int64
  field :total_satoshis_sent, 12, type: :int64
  field :total_satoshis_received, 13, type: :int64
  field :num_updates, 14, type: :uint64
  field :pending_htlcs, 15, repeated: true, type: Lnrpc.HTLC
  field :csv_delay, 16, type: :uint32, deprecated: true
  field :private, 17, type: :bool
  field :initiator, 18, type: :bool
  field :chan_status_flags, 19, type: :string
  field :local_chan_reserve_sat, 20, type: :int64, deprecated: true
  field :remote_chan_reserve_sat, 21, type: :int64, deprecated: true
  field :static_remote_key, 22, type: :bool, deprecated: true
  field :commitment_type, 26, type: Lnrpc.CommitmentType, enum: true
  field :lifetime, 23, type: :int64
  field :uptime, 24, type: :int64
  field :close_address, 25, type: :string
  field :push_amount_sat, 27, type: :uint64
  field :thaw_height, 28, type: :uint32
  field :local_constraints, 29, type: Lnrpc.ChannelConstraints
  field :remote_constraints, 30, type: Lnrpc.ChannelConstraints
end

defmodule Lnrpc.ListChannelsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          active_only: boolean,
          inactive_only: boolean,
          public_only: boolean,
          private_only: boolean,
          peer: binary
        }
  defstruct [:active_only, :inactive_only, :public_only, :private_only, :peer]

  field :active_only, 1, type: :bool
  field :inactive_only, 2, type: :bool
  field :public_only, 3, type: :bool
  field :private_only, 4, type: :bool
  field :peer, 5, type: :bytes
end

defmodule Lnrpc.ListChannelsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channels: [Lnrpc.Channel.t()]
        }
  defstruct [:channels]

  field :channels, 11, repeated: true, type: Lnrpc.Channel
end

defmodule Lnrpc.ChannelCloseSummary do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channel_point: String.t(),
          chan_id: non_neg_integer,
          chain_hash: String.t(),
          closing_tx_hash: String.t(),
          remote_pubkey: String.t(),
          capacity: integer,
          close_height: non_neg_integer,
          settled_balance: integer,
          time_locked_balance: integer,
          close_type: Lnrpc.ChannelCloseSummary.ClosureType.t(),
          open_initiator: Lnrpc.Initiator.t(),
          close_initiator: Lnrpc.Initiator.t(),
          resolutions: [Lnrpc.Resolution.t()]
        }
  defstruct [
    :channel_point,
    :chan_id,
    :chain_hash,
    :closing_tx_hash,
    :remote_pubkey,
    :capacity,
    :close_height,
    :settled_balance,
    :time_locked_balance,
    :close_type,
    :open_initiator,
    :close_initiator,
    :resolutions
  ]

  field :channel_point, 1, type: :string
  field :chan_id, 2, type: :uint64
  field :chain_hash, 3, type: :string
  field :closing_tx_hash, 4, type: :string
  field :remote_pubkey, 5, type: :string
  field :capacity, 6, type: :int64
  field :close_height, 7, type: :uint32
  field :settled_balance, 8, type: :int64
  field :time_locked_balance, 9, type: :int64
  field :close_type, 10, type: Lnrpc.ChannelCloseSummary.ClosureType, enum: true
  field :open_initiator, 11, type: Lnrpc.Initiator, enum: true
  field :close_initiator, 12, type: Lnrpc.Initiator, enum: true
  field :resolutions, 13, repeated: true, type: Lnrpc.Resolution
end

defmodule Lnrpc.Resolution do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          resolution_type: Lnrpc.ResolutionType.t(),
          outcome: Lnrpc.ResolutionOutcome.t(),
          outpoint: Lnrpc.OutPoint.t() | nil,
          amount_sat: non_neg_integer,
          sweep_txid: String.t()
        }
  defstruct [:resolution_type, :outcome, :outpoint, :amount_sat, :sweep_txid]

  field :resolution_type, 1, type: Lnrpc.ResolutionType, enum: true
  field :outcome, 2, type: Lnrpc.ResolutionOutcome, enum: true
  field :outpoint, 3, type: Lnrpc.OutPoint
  field :amount_sat, 4, type: :uint64
  field :sweep_txid, 5, type: :string
end

defmodule Lnrpc.ClosedChannelsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cooperative: boolean,
          local_force: boolean,
          remote_force: boolean,
          breach: boolean,
          funding_canceled: boolean,
          abandoned: boolean
        }
  defstruct [:cooperative, :local_force, :remote_force, :breach, :funding_canceled, :abandoned]

  field :cooperative, 1, type: :bool
  field :local_force, 2, type: :bool
  field :remote_force, 3, type: :bool
  field :breach, 4, type: :bool
  field :funding_canceled, 5, type: :bool
  field :abandoned, 6, type: :bool
end

defmodule Lnrpc.ClosedChannelsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channels: [Lnrpc.ChannelCloseSummary.t()]
        }
  defstruct [:channels]

  field :channels, 1, repeated: true, type: Lnrpc.ChannelCloseSummary
end

defmodule Lnrpc.Peer.FeaturesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: Lnrpc.Feature.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, type: :uint32
  field :value, 2, type: Lnrpc.Feature
end

defmodule Lnrpc.Peer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pub_key: String.t(),
          address: String.t(),
          bytes_sent: non_neg_integer,
          bytes_recv: non_neg_integer,
          sat_sent: integer,
          sat_recv: integer,
          inbound: boolean,
          ping_time: integer,
          sync_type: Lnrpc.Peer.SyncType.t(),
          features: %{non_neg_integer => Lnrpc.Feature.t() | nil},
          errors: [Lnrpc.TimestampedError.t()],
          flap_count: integer,
          last_flap_ns: integer
        }
  defstruct [
    :pub_key,
    :address,
    :bytes_sent,
    :bytes_recv,
    :sat_sent,
    :sat_recv,
    :inbound,
    :ping_time,
    :sync_type,
    :features,
    :errors,
    :flap_count,
    :last_flap_ns
  ]

  field :pub_key, 1, type: :string
  field :address, 3, type: :string
  field :bytes_sent, 4, type: :uint64
  field :bytes_recv, 5, type: :uint64
  field :sat_sent, 6, type: :int64
  field :sat_recv, 7, type: :int64
  field :inbound, 8, type: :bool
  field :ping_time, 9, type: :int64
  field :sync_type, 10, type: Lnrpc.Peer.SyncType, enum: true
  field :features, 11, repeated: true, type: Lnrpc.Peer.FeaturesEntry, map: true
  field :errors, 12, repeated: true, type: Lnrpc.TimestampedError
  field :flap_count, 13, type: :int32
  field :last_flap_ns, 14, type: :int64
end

defmodule Lnrpc.TimestampedError do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timestamp: non_neg_integer,
          error: String.t()
        }
  defstruct [:timestamp, :error]

  field :timestamp, 1, type: :uint64
  field :error, 2, type: :string
end

defmodule Lnrpc.ListPeersRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          latest_error: boolean
        }
  defstruct [:latest_error]

  field :latest_error, 1, type: :bool
end

defmodule Lnrpc.ListPeersResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          peers: [Lnrpc.Peer.t()]
        }
  defstruct [:peers]

  field :peers, 1, repeated: true, type: Lnrpc.Peer
end

defmodule Lnrpc.PeerEventSubscription do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.PeerEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pub_key: String.t(),
          type: Lnrpc.PeerEvent.EventType.t()
        }
  defstruct [:pub_key, :type]

  field :pub_key, 1, type: :string
  field :type, 2, type: Lnrpc.PeerEvent.EventType, enum: true
end

defmodule Lnrpc.GetInfoRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.GetInfoResponse.FeaturesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: Lnrpc.Feature.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, type: :uint32
  field :value, 2, type: Lnrpc.Feature
end

defmodule Lnrpc.GetInfoResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version: String.t(),
          commit_hash: String.t(),
          identity_pubkey: String.t(),
          alias: String.t(),
          color: String.t(),
          num_pending_channels: non_neg_integer,
          num_active_channels: non_neg_integer,
          num_inactive_channels: non_neg_integer,
          num_peers: non_neg_integer,
          block_height: non_neg_integer,
          block_hash: String.t(),
          best_header_timestamp: integer,
          synced_to_chain: boolean,
          synced_to_graph: boolean,
          testnet: boolean,
          chains: [Lnrpc.Chain.t()],
          uris: [String.t()],
          features: %{non_neg_integer => Lnrpc.Feature.t() | nil}
        }
  defstruct [
    :version,
    :commit_hash,
    :identity_pubkey,
    :alias,
    :color,
    :num_pending_channels,
    :num_active_channels,
    :num_inactive_channels,
    :num_peers,
    :block_height,
    :block_hash,
    :best_header_timestamp,
    :synced_to_chain,
    :synced_to_graph,
    :testnet,
    :chains,
    :uris,
    :features
  ]

  field :version, 14, type: :string
  field :commit_hash, 20, type: :string
  field :identity_pubkey, 1, type: :string
  field :alias, 2, type: :string
  field :color, 17, type: :string
  field :num_pending_channels, 3, type: :uint32
  field :num_active_channels, 4, type: :uint32
  field :num_inactive_channels, 15, type: :uint32
  field :num_peers, 5, type: :uint32
  field :block_height, 6, type: :uint32
  field :block_hash, 8, type: :string
  field :best_header_timestamp, 13, type: :int64
  field :synced_to_chain, 9, type: :bool
  field :synced_to_graph, 18, type: :bool
  field :testnet, 10, type: :bool, deprecated: true
  field :chains, 16, repeated: true, type: Lnrpc.Chain
  field :uris, 12, repeated: true, type: :string
  field :features, 19, repeated: true, type: Lnrpc.GetInfoResponse.FeaturesEntry, map: true
end

defmodule Lnrpc.GetRecoveryInfoRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.GetRecoveryInfoResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          recovery_mode: boolean,
          recovery_finished: boolean,
          progress: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:recovery_mode, :recovery_finished, :progress]

  field :recovery_mode, 1, type: :bool
  field :recovery_finished, 2, type: :bool
  field :progress, 3, type: :double
end

defmodule Lnrpc.Chain do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chain: String.t(),
          network: String.t()
        }
  defstruct [:chain, :network]

  field :chain, 1, type: :string
  field :network, 2, type: :string
end

defmodule Lnrpc.ConfirmationUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          block_sha: binary,
          block_height: integer,
          num_confs_left: non_neg_integer
        }
  defstruct [:block_sha, :block_height, :num_confs_left]

  field :block_sha, 1, type: :bytes
  field :block_height, 2, type: :int32
  field :num_confs_left, 3, type: :uint32
end

defmodule Lnrpc.ChannelOpenUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channel_point: Lnrpc.ChannelPoint.t() | nil
        }
  defstruct [:channel_point]

  field :channel_point, 1, type: Lnrpc.ChannelPoint
end

defmodule Lnrpc.ChannelCloseUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          closing_txid: binary,
          success: boolean
        }
  defstruct [:closing_txid, :success]

  field :closing_txid, 1, type: :bytes
  field :success, 2, type: :bool
end

defmodule Lnrpc.CloseChannelRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channel_point: Lnrpc.ChannelPoint.t() | nil,
          force: boolean,
          target_conf: integer,
          sat_per_byte: integer,
          delivery_address: String.t(),
          sat_per_vbyte: non_neg_integer
        }
  defstruct [
    :channel_point,
    :force,
    :target_conf,
    :sat_per_byte,
    :delivery_address,
    :sat_per_vbyte
  ]

  field :channel_point, 1, type: Lnrpc.ChannelPoint
  field :force, 2, type: :bool
  field :target_conf, 3, type: :int32
  field :sat_per_byte, 4, type: :int64, deprecated: true
  field :delivery_address, 5, type: :string
  field :sat_per_vbyte, 6, type: :uint64
end

defmodule Lnrpc.CloseStatusUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          update: {atom, any}
        }
  defstruct [:update]

  oneof :update, 0
  field :close_pending, 1, type: Lnrpc.PendingUpdate, oneof: 0
  field :chan_close, 3, type: Lnrpc.ChannelCloseUpdate, oneof: 0
end

defmodule Lnrpc.PendingUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          txid: binary,
          output_index: non_neg_integer
        }
  defstruct [:txid, :output_index]

  field :txid, 1, type: :bytes
  field :output_index, 2, type: :uint32
end

defmodule Lnrpc.ReadyForPsbtFunding do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          funding_address: String.t(),
          funding_amount: integer,
          psbt: binary
        }
  defstruct [:funding_address, :funding_amount, :psbt]

  field :funding_address, 1, type: :string
  field :funding_amount, 2, type: :int64
  field :psbt, 3, type: :bytes
end

defmodule Lnrpc.OpenChannelRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sat_per_vbyte: non_neg_integer,
          node_pubkey: binary,
          node_pubkey_string: String.t(),
          local_funding_amount: integer,
          push_sat: integer,
          target_conf: integer,
          sat_per_byte: integer,
          private: boolean,
          min_htlc_msat: integer,
          remote_csv_delay: non_neg_integer,
          min_confs: integer,
          spend_unconfirmed: boolean,
          close_address: String.t(),
          funding_shim: Lnrpc.FundingShim.t() | nil,
          remote_max_value_in_flight_msat: non_neg_integer,
          remote_max_htlcs: non_neg_integer,
          max_local_csv: non_neg_integer
        }
  defstruct [
    :sat_per_vbyte,
    :node_pubkey,
    :node_pubkey_string,
    :local_funding_amount,
    :push_sat,
    :target_conf,
    :sat_per_byte,
    :private,
    :min_htlc_msat,
    :remote_csv_delay,
    :min_confs,
    :spend_unconfirmed,
    :close_address,
    :funding_shim,
    :remote_max_value_in_flight_msat,
    :remote_max_htlcs,
    :max_local_csv
  ]

  field :sat_per_vbyte, 1, type: :uint64
  field :node_pubkey, 2, type: :bytes
  field :node_pubkey_string, 3, type: :string, deprecated: true
  field :local_funding_amount, 4, type: :int64
  field :push_sat, 5, type: :int64
  field :target_conf, 6, type: :int32
  field :sat_per_byte, 7, type: :int64, deprecated: true
  field :private, 8, type: :bool
  field :min_htlc_msat, 9, type: :int64
  field :remote_csv_delay, 10, type: :uint32
  field :min_confs, 11, type: :int32
  field :spend_unconfirmed, 12, type: :bool
  field :close_address, 13, type: :string
  field :funding_shim, 14, type: Lnrpc.FundingShim
  field :remote_max_value_in_flight_msat, 15, type: :uint64
  field :remote_max_htlcs, 16, type: :uint32
  field :max_local_csv, 17, type: :uint32
end

defmodule Lnrpc.OpenStatusUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          update: {atom, any},
          pending_chan_id: binary
        }
  defstruct [:update, :pending_chan_id]

  oneof :update, 0
  field :chan_pending, 1, type: Lnrpc.PendingUpdate, oneof: 0
  field :chan_open, 3, type: Lnrpc.ChannelOpenUpdate, oneof: 0
  field :psbt_fund, 5, type: Lnrpc.ReadyForPsbtFunding, oneof: 0
  field :pending_chan_id, 4, type: :bytes
end

defmodule Lnrpc.KeyLocator do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key_family: integer,
          key_index: integer
        }
  defstruct [:key_family, :key_index]

  field :key_family, 1, type: :int32
  field :key_index, 2, type: :int32
end

defmodule Lnrpc.KeyDescriptor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          raw_key_bytes: binary,
          key_loc: Lnrpc.KeyLocator.t() | nil
        }
  defstruct [:raw_key_bytes, :key_loc]

  field :raw_key_bytes, 1, type: :bytes
  field :key_loc, 2, type: Lnrpc.KeyLocator
end

defmodule Lnrpc.ChanPointShim do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          amt: integer,
          chan_point: Lnrpc.ChannelPoint.t() | nil,
          local_key: Lnrpc.KeyDescriptor.t() | nil,
          remote_key: binary,
          pending_chan_id: binary,
          thaw_height: non_neg_integer
        }
  defstruct [:amt, :chan_point, :local_key, :remote_key, :pending_chan_id, :thaw_height]

  field :amt, 1, type: :int64
  field :chan_point, 2, type: Lnrpc.ChannelPoint
  field :local_key, 3, type: Lnrpc.KeyDescriptor
  field :remote_key, 4, type: :bytes
  field :pending_chan_id, 5, type: :bytes
  field :thaw_height, 6, type: :uint32
end

defmodule Lnrpc.PsbtShim do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pending_chan_id: binary,
          base_psbt: binary,
          no_publish: boolean
        }
  defstruct [:pending_chan_id, :base_psbt, :no_publish]

  field :pending_chan_id, 1, type: :bytes
  field :base_psbt, 2, type: :bytes
  field :no_publish, 3, type: :bool
end

defmodule Lnrpc.FundingShim do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          shim: {atom, any}
        }
  defstruct [:shim]

  oneof :shim, 0
  field :chan_point_shim, 1, type: Lnrpc.ChanPointShim, oneof: 0
  field :psbt_shim, 2, type: Lnrpc.PsbtShim, oneof: 0
end

defmodule Lnrpc.FundingShimCancel do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pending_chan_id: binary
        }
  defstruct [:pending_chan_id]

  field :pending_chan_id, 1, type: :bytes
end

defmodule Lnrpc.FundingPsbtVerify do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          funded_psbt: binary,
          pending_chan_id: binary
        }
  defstruct [:funded_psbt, :pending_chan_id]

  field :funded_psbt, 1, type: :bytes
  field :pending_chan_id, 2, type: :bytes
end

defmodule Lnrpc.FundingPsbtFinalize do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          signed_psbt: binary,
          pending_chan_id: binary,
          final_raw_tx: binary
        }
  defstruct [:signed_psbt, :pending_chan_id, :final_raw_tx]

  field :signed_psbt, 1, type: :bytes
  field :pending_chan_id, 2, type: :bytes
  field :final_raw_tx, 3, type: :bytes
end

defmodule Lnrpc.FundingTransitionMsg do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          trigger: {atom, any}
        }
  defstruct [:trigger]

  oneof :trigger, 0
  field :shim_register, 1, type: Lnrpc.FundingShim, oneof: 0
  field :shim_cancel, 2, type: Lnrpc.FundingShimCancel, oneof: 0
  field :psbt_verify, 3, type: Lnrpc.FundingPsbtVerify, oneof: 0
  field :psbt_finalize, 4, type: Lnrpc.FundingPsbtFinalize, oneof: 0
end

defmodule Lnrpc.FundingStateStepResp do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.PendingHTLC do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          incoming: boolean,
          amount: integer,
          outpoint: String.t(),
          maturity_height: non_neg_integer,
          blocks_til_maturity: integer,
          stage: non_neg_integer
        }
  defstruct [:incoming, :amount, :outpoint, :maturity_height, :blocks_til_maturity, :stage]

  field :incoming, 1, type: :bool
  field :amount, 2, type: :int64
  field :outpoint, 3, type: :string
  field :maturity_height, 4, type: :uint32
  field :blocks_til_maturity, 5, type: :int32
  field :stage, 6, type: :uint32
end

defmodule Lnrpc.PendingChannelsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.PendingChannelsResponse.PendingChannel do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          remote_node_pub: String.t(),
          channel_point: String.t(),
          capacity: integer,
          local_balance: integer,
          remote_balance: integer,
          local_chan_reserve_sat: integer,
          remote_chan_reserve_sat: integer,
          initiator: Lnrpc.Initiator.t(),
          commitment_type: Lnrpc.CommitmentType.t()
        }
  defstruct [
    :remote_node_pub,
    :channel_point,
    :capacity,
    :local_balance,
    :remote_balance,
    :local_chan_reserve_sat,
    :remote_chan_reserve_sat,
    :initiator,
    :commitment_type
  ]

  field :remote_node_pub, 1, type: :string
  field :channel_point, 2, type: :string
  field :capacity, 3, type: :int64
  field :local_balance, 4, type: :int64
  field :remote_balance, 5, type: :int64
  field :local_chan_reserve_sat, 6, type: :int64
  field :remote_chan_reserve_sat, 7, type: :int64
  field :initiator, 8, type: Lnrpc.Initiator, enum: true
  field :commitment_type, 9, type: Lnrpc.CommitmentType, enum: true
end

defmodule Lnrpc.PendingChannelsResponse.PendingOpenChannel do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channel: Lnrpc.PendingChannelsResponse.PendingChannel.t() | nil,
          confirmation_height: non_neg_integer,
          commit_fee: integer,
          commit_weight: integer,
          fee_per_kw: integer
        }
  defstruct [:channel, :confirmation_height, :commit_fee, :commit_weight, :fee_per_kw]

  field :channel, 1, type: Lnrpc.PendingChannelsResponse.PendingChannel
  field :confirmation_height, 2, type: :uint32
  field :commit_fee, 4, type: :int64
  field :commit_weight, 5, type: :int64
  field :fee_per_kw, 6, type: :int64
end

defmodule Lnrpc.PendingChannelsResponse.WaitingCloseChannel do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channel: Lnrpc.PendingChannelsResponse.PendingChannel.t() | nil,
          limbo_balance: integer,
          commitments: Lnrpc.PendingChannelsResponse.Commitments.t() | nil
        }
  defstruct [:channel, :limbo_balance, :commitments]

  field :channel, 1, type: Lnrpc.PendingChannelsResponse.PendingChannel
  field :limbo_balance, 2, type: :int64
  field :commitments, 3, type: Lnrpc.PendingChannelsResponse.Commitments
end

defmodule Lnrpc.PendingChannelsResponse.Commitments do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          local_txid: String.t(),
          remote_txid: String.t(),
          remote_pending_txid: String.t(),
          local_commit_fee_sat: non_neg_integer,
          remote_commit_fee_sat: non_neg_integer,
          remote_pending_commit_fee_sat: non_neg_integer
        }
  defstruct [
    :local_txid,
    :remote_txid,
    :remote_pending_txid,
    :local_commit_fee_sat,
    :remote_commit_fee_sat,
    :remote_pending_commit_fee_sat
  ]

  field :local_txid, 1, type: :string
  field :remote_txid, 2, type: :string
  field :remote_pending_txid, 3, type: :string
  field :local_commit_fee_sat, 4, type: :uint64
  field :remote_commit_fee_sat, 5, type: :uint64
  field :remote_pending_commit_fee_sat, 6, type: :uint64
end

defmodule Lnrpc.PendingChannelsResponse.ClosedChannel do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channel: Lnrpc.PendingChannelsResponse.PendingChannel.t() | nil,
          closing_txid: String.t()
        }
  defstruct [:channel, :closing_txid]

  field :channel, 1, type: Lnrpc.PendingChannelsResponse.PendingChannel
  field :closing_txid, 2, type: :string
end

defmodule Lnrpc.PendingChannelsResponse.ForceClosedChannel do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channel: Lnrpc.PendingChannelsResponse.PendingChannel.t() | nil,
          closing_txid: String.t(),
          limbo_balance: integer,
          maturity_height: non_neg_integer,
          blocks_til_maturity: integer,
          recovered_balance: integer,
          pending_htlcs: [Lnrpc.PendingHTLC.t()],
          anchor: Lnrpc.PendingChannelsResponse.ForceClosedChannel.AnchorState.t()
        }
  defstruct [
    :channel,
    :closing_txid,
    :limbo_balance,
    :maturity_height,
    :blocks_til_maturity,
    :recovered_balance,
    :pending_htlcs,
    :anchor
  ]

  field :channel, 1, type: Lnrpc.PendingChannelsResponse.PendingChannel
  field :closing_txid, 2, type: :string
  field :limbo_balance, 3, type: :int64
  field :maturity_height, 4, type: :uint32
  field :blocks_til_maturity, 5, type: :int32
  field :recovered_balance, 6, type: :int64
  field :pending_htlcs, 8, repeated: true, type: Lnrpc.PendingHTLC
  field :anchor, 9, type: Lnrpc.PendingChannelsResponse.ForceClosedChannel.AnchorState, enum: true
end

defmodule Lnrpc.PendingChannelsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_limbo_balance: integer,
          pending_open_channels: [Lnrpc.PendingChannelsResponse.PendingOpenChannel.t()],
          pending_closing_channels: [Lnrpc.PendingChannelsResponse.ClosedChannel.t()],
          pending_force_closing_channels: [Lnrpc.PendingChannelsResponse.ForceClosedChannel.t()],
          waiting_close_channels: [Lnrpc.PendingChannelsResponse.WaitingCloseChannel.t()]
        }
  defstruct [
    :total_limbo_balance,
    :pending_open_channels,
    :pending_closing_channels,
    :pending_force_closing_channels,
    :waiting_close_channels
  ]

  field :total_limbo_balance, 1, type: :int64

  field :pending_open_channels, 2,
    repeated: true,
    type: Lnrpc.PendingChannelsResponse.PendingOpenChannel

  field :pending_closing_channels, 3,
    repeated: true,
    type: Lnrpc.PendingChannelsResponse.ClosedChannel,
    deprecated: true

  field :pending_force_closing_channels, 4,
    repeated: true,
    type: Lnrpc.PendingChannelsResponse.ForceClosedChannel

  field :waiting_close_channels, 5,
    repeated: true,
    type: Lnrpc.PendingChannelsResponse.WaitingCloseChannel
end

defmodule Lnrpc.ChannelEventSubscription do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.ChannelEventUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channel: {atom, any},
          type: Lnrpc.ChannelEventUpdate.UpdateType.t()
        }
  defstruct [:channel, :type]

  oneof :channel, 0
  field :open_channel, 1, type: Lnrpc.Channel, oneof: 0
  field :closed_channel, 2, type: Lnrpc.ChannelCloseSummary, oneof: 0
  field :active_channel, 3, type: Lnrpc.ChannelPoint, oneof: 0
  field :inactive_channel, 4, type: Lnrpc.ChannelPoint, oneof: 0
  field :pending_open_channel, 6, type: Lnrpc.PendingUpdate, oneof: 0
  field :type, 5, type: Lnrpc.ChannelEventUpdate.UpdateType, enum: true
end

defmodule Lnrpc.WalletAccountBalance do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          confirmed_balance: integer,
          unconfirmed_balance: integer
        }
  defstruct [:confirmed_balance, :unconfirmed_balance]

  field :confirmed_balance, 1, type: :int64
  field :unconfirmed_balance, 2, type: :int64
end

defmodule Lnrpc.WalletBalanceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.WalletBalanceResponse.AccountBalanceEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Lnrpc.WalletAccountBalance.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: Lnrpc.WalletAccountBalance
end

defmodule Lnrpc.WalletBalanceResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_balance: integer,
          confirmed_balance: integer,
          unconfirmed_balance: integer,
          account_balance: %{String.t() => Lnrpc.WalletAccountBalance.t() | nil}
        }
  defstruct [:total_balance, :confirmed_balance, :unconfirmed_balance, :account_balance]

  field :total_balance, 1, type: :int64
  field :confirmed_balance, 2, type: :int64
  field :unconfirmed_balance, 3, type: :int64

  field :account_balance, 4,
    repeated: true,
    type: Lnrpc.WalletBalanceResponse.AccountBalanceEntry,
    map: true
end

defmodule Lnrpc.Amount do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sat: non_neg_integer,
          msat: non_neg_integer
        }
  defstruct [:sat, :msat]

  field :sat, 1, type: :uint64
  field :msat, 2, type: :uint64
end

defmodule Lnrpc.ChannelBalanceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.ChannelBalanceResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          balance: integer,
          pending_open_balance: integer,
          local_balance: Lnrpc.Amount.t() | nil,
          remote_balance: Lnrpc.Amount.t() | nil,
          unsettled_local_balance: Lnrpc.Amount.t() | nil,
          unsettled_remote_balance: Lnrpc.Amount.t() | nil,
          pending_open_local_balance: Lnrpc.Amount.t() | nil,
          pending_open_remote_balance: Lnrpc.Amount.t() | nil
        }
  defstruct [
    :balance,
    :pending_open_balance,
    :local_balance,
    :remote_balance,
    :unsettled_local_balance,
    :unsettled_remote_balance,
    :pending_open_local_balance,
    :pending_open_remote_balance
  ]

  field :balance, 1, type: :int64, deprecated: true
  field :pending_open_balance, 2, type: :int64, deprecated: true
  field :local_balance, 3, type: Lnrpc.Amount
  field :remote_balance, 4, type: Lnrpc.Amount
  field :unsettled_local_balance, 5, type: Lnrpc.Amount
  field :unsettled_remote_balance, 6, type: Lnrpc.Amount
  field :pending_open_local_balance, 7, type: Lnrpc.Amount
  field :pending_open_remote_balance, 8, type: Lnrpc.Amount
end

defmodule Lnrpc.QueryRoutesRequest.DestCustomRecordsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: binary
        }
  defstruct [:key, :value]

  field :key, 1, type: :uint64
  field :value, 2, type: :bytes
end

defmodule Lnrpc.QueryRoutesRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pub_key: String.t(),
          amt: integer,
          amt_msat: integer,
          final_cltv_delta: integer,
          fee_limit: Lnrpc.FeeLimit.t() | nil,
          ignored_nodes: [binary],
          ignored_edges: [Lnrpc.EdgeLocator.t()],
          source_pub_key: String.t(),
          use_mission_control: boolean,
          ignored_pairs: [Lnrpc.NodePair.t()],
          cltv_limit: non_neg_integer,
          dest_custom_records: %{non_neg_integer => binary},
          outgoing_chan_id: non_neg_integer,
          last_hop_pubkey: binary,
          route_hints: [Lnrpc.RouteHint.t()],
          dest_features: [[Lnrpc.FeatureBit.t()]]
        }
  defstruct [
    :pub_key,
    :amt,
    :amt_msat,
    :final_cltv_delta,
    :fee_limit,
    :ignored_nodes,
    :ignored_edges,
    :source_pub_key,
    :use_mission_control,
    :ignored_pairs,
    :cltv_limit,
    :dest_custom_records,
    :outgoing_chan_id,
    :last_hop_pubkey,
    :route_hints,
    :dest_features
  ]

  field :pub_key, 1, type: :string
  field :amt, 2, type: :int64
  field :amt_msat, 12, type: :int64
  field :final_cltv_delta, 4, type: :int32
  field :fee_limit, 5, type: Lnrpc.FeeLimit
  field :ignored_nodes, 6, repeated: true, type: :bytes
  field :ignored_edges, 7, repeated: true, type: Lnrpc.EdgeLocator, deprecated: true
  field :source_pub_key, 8, type: :string
  field :use_mission_control, 9, type: :bool
  field :ignored_pairs, 10, repeated: true, type: Lnrpc.NodePair
  field :cltv_limit, 11, type: :uint32

  field :dest_custom_records, 13,
    repeated: true,
    type: Lnrpc.QueryRoutesRequest.DestCustomRecordsEntry,
    map: true

  field :outgoing_chan_id, 14, type: :uint64
  field :last_hop_pubkey, 15, type: :bytes
  field :route_hints, 16, repeated: true, type: Lnrpc.RouteHint
  field :dest_features, 17, repeated: true, type: Lnrpc.FeatureBit, enum: true
end

defmodule Lnrpc.NodePair do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          from: binary,
          to: binary
        }
  defstruct [:from, :to]

  field :from, 1, type: :bytes
  field :to, 2, type: :bytes
end

defmodule Lnrpc.EdgeLocator do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channel_id: non_neg_integer,
          direction_reverse: boolean
        }
  defstruct [:channel_id, :direction_reverse]

  field :channel_id, 1, type: :uint64
  field :direction_reverse, 2, type: :bool
end

defmodule Lnrpc.QueryRoutesResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          routes: [Lnrpc.Route.t()],
          success_prob: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:routes, :success_prob]

  field :routes, 1, repeated: true, type: Lnrpc.Route
  field :success_prob, 2, type: :double
end

defmodule Lnrpc.Hop.CustomRecordsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: binary
        }
  defstruct [:key, :value]

  field :key, 1, type: :uint64
  field :value, 2, type: :bytes
end

defmodule Lnrpc.Hop do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_id: non_neg_integer,
          chan_capacity: integer,
          amt_to_forward: integer,
          fee: integer,
          expiry: non_neg_integer,
          amt_to_forward_msat: integer,
          fee_msat: integer,
          pub_key: String.t(),
          tlv_payload: boolean,
          mpp_record: Lnrpc.MPPRecord.t() | nil,
          amp_record: Lnrpc.AMPRecord.t() | nil,
          custom_records: %{non_neg_integer => binary}
        }
  defstruct [
    :chan_id,
    :chan_capacity,
    :amt_to_forward,
    :fee,
    :expiry,
    :amt_to_forward_msat,
    :fee_msat,
    :pub_key,
    :tlv_payload,
    :mpp_record,
    :amp_record,
    :custom_records
  ]

  field :chan_id, 1, type: :uint64
  field :chan_capacity, 2, type: :int64
  field :amt_to_forward, 3, type: :int64, deprecated: true
  field :fee, 4, type: :int64, deprecated: true
  field :expiry, 5, type: :uint32
  field :amt_to_forward_msat, 6, type: :int64
  field :fee_msat, 7, type: :int64
  field :pub_key, 8, type: :string
  field :tlv_payload, 9, type: :bool
  field :mpp_record, 10, type: Lnrpc.MPPRecord
  field :amp_record, 12, type: Lnrpc.AMPRecord
  field :custom_records, 11, repeated: true, type: Lnrpc.Hop.CustomRecordsEntry, map: true
end

defmodule Lnrpc.MPPRecord do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          payment_addr: binary,
          total_amt_msat: integer
        }
  defstruct [:payment_addr, :total_amt_msat]

  field :payment_addr, 11, type: :bytes
  field :total_amt_msat, 10, type: :int64
end

defmodule Lnrpc.AMPRecord do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          root_share: binary,
          set_id: binary,
          child_index: non_neg_integer
        }
  defstruct [:root_share, :set_id, :child_index]

  field :root_share, 1, type: :bytes
  field :set_id, 2, type: :bytes
  field :child_index, 3, type: :uint32
end

defmodule Lnrpc.Route do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_time_lock: non_neg_integer,
          total_fees: integer,
          total_amt: integer,
          hops: [Lnrpc.Hop.t()],
          total_fees_msat: integer,
          total_amt_msat: integer
        }
  defstruct [:total_time_lock, :total_fees, :total_amt, :hops, :total_fees_msat, :total_amt_msat]

  field :total_time_lock, 1, type: :uint32
  field :total_fees, 2, type: :int64, deprecated: true
  field :total_amt, 3, type: :int64, deprecated: true
  field :hops, 4, repeated: true, type: Lnrpc.Hop
  field :total_fees_msat, 5, type: :int64
  field :total_amt_msat, 6, type: :int64
end

defmodule Lnrpc.NodeInfoRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pub_key: String.t(),
          include_channels: boolean
        }
  defstruct [:pub_key, :include_channels]

  field :pub_key, 1, type: :string
  field :include_channels, 2, type: :bool
end

defmodule Lnrpc.NodeInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node: Lnrpc.LightningNode.t() | nil,
          num_channels: non_neg_integer,
          total_capacity: integer,
          channels: [Lnrpc.ChannelEdge.t()]
        }
  defstruct [:node, :num_channels, :total_capacity, :channels]

  field :node, 1, type: Lnrpc.LightningNode
  field :num_channels, 2, type: :uint32
  field :total_capacity, 3, type: :int64
  field :channels, 4, repeated: true, type: Lnrpc.ChannelEdge
end

defmodule Lnrpc.LightningNode.FeaturesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: Lnrpc.Feature.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, type: :uint32
  field :value, 2, type: Lnrpc.Feature
end

defmodule Lnrpc.LightningNode do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          last_update: non_neg_integer,
          pub_key: String.t(),
          alias: String.t(),
          addresses: [Lnrpc.NodeAddress.t()],
          color: String.t(),
          features: %{non_neg_integer => Lnrpc.Feature.t() | nil}
        }
  defstruct [:last_update, :pub_key, :alias, :addresses, :color, :features]

  field :last_update, 1, type: :uint32
  field :pub_key, 2, type: :string
  field :alias, 3, type: :string
  field :addresses, 4, repeated: true, type: Lnrpc.NodeAddress
  field :color, 5, type: :string
  field :features, 6, repeated: true, type: Lnrpc.LightningNode.FeaturesEntry, map: true
end

defmodule Lnrpc.NodeAddress do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          network: String.t(),
          addr: String.t()
        }
  defstruct [:network, :addr]

  field :network, 1, type: :string
  field :addr, 2, type: :string
end

defmodule Lnrpc.RoutingPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          time_lock_delta: non_neg_integer,
          min_htlc: integer,
          fee_base_msat: integer,
          fee_rate_milli_msat: integer,
          disabled: boolean,
          max_htlc_msat: non_neg_integer,
          last_update: non_neg_integer
        }
  defstruct [
    :time_lock_delta,
    :min_htlc,
    :fee_base_msat,
    :fee_rate_milli_msat,
    :disabled,
    :max_htlc_msat,
    :last_update
  ]

  field :time_lock_delta, 1, type: :uint32
  field :min_htlc, 2, type: :int64
  field :fee_base_msat, 3, type: :int64
  field :fee_rate_milli_msat, 4, type: :int64
  field :disabled, 5, type: :bool
  field :max_htlc_msat, 6, type: :uint64
  field :last_update, 7, type: :uint32
end

defmodule Lnrpc.ChannelEdge do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channel_id: non_neg_integer,
          chan_point: String.t(),
          last_update: non_neg_integer,
          node1_pub: String.t(),
          node2_pub: String.t(),
          capacity: integer,
          node1_policy: Lnrpc.RoutingPolicy.t() | nil,
          node2_policy: Lnrpc.RoutingPolicy.t() | nil
        }
  defstruct [
    :channel_id,
    :chan_point,
    :last_update,
    :node1_pub,
    :node2_pub,
    :capacity,
    :node1_policy,
    :node2_policy
  ]

  field :channel_id, 1, type: :uint64
  field :chan_point, 2, type: :string
  field :last_update, 3, type: :uint32, deprecated: true
  field :node1_pub, 4, type: :string
  field :node2_pub, 5, type: :string
  field :capacity, 6, type: :int64
  field :node1_policy, 7, type: Lnrpc.RoutingPolicy
  field :node2_policy, 8, type: Lnrpc.RoutingPolicy
end

defmodule Lnrpc.ChannelGraphRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          include_unannounced: boolean
        }
  defstruct [:include_unannounced]

  field :include_unannounced, 1, type: :bool
end

defmodule Lnrpc.ChannelGraph do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          nodes: [Lnrpc.LightningNode.t()],
          edges: [Lnrpc.ChannelEdge.t()]
        }
  defstruct [:nodes, :edges]

  field :nodes, 1, repeated: true, type: Lnrpc.LightningNode
  field :edges, 2, repeated: true, type: Lnrpc.ChannelEdge
end

defmodule Lnrpc.NodeMetricsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          types: [[Lnrpc.NodeMetricType.t()]]
        }
  defstruct [:types]

  field :types, 1, repeated: true, type: Lnrpc.NodeMetricType, enum: true
end

defmodule Lnrpc.NodeMetricsResponse.BetweennessCentralityEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Lnrpc.FloatMetric.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: Lnrpc.FloatMetric
end

defmodule Lnrpc.NodeMetricsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          betweenness_centrality: %{String.t() => Lnrpc.FloatMetric.t() | nil}
        }
  defstruct [:betweenness_centrality]

  field :betweenness_centrality, 1,
    repeated: true,
    type: Lnrpc.NodeMetricsResponse.BetweennessCentralityEntry,
    map: true
end

defmodule Lnrpc.FloatMetric do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: float | :infinity | :negative_infinity | :nan,
          normalized_value: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:value, :normalized_value]

  field :value, 1, type: :double
  field :normalized_value, 2, type: :double
end

defmodule Lnrpc.ChanInfoRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_id: non_neg_integer
        }
  defstruct [:chan_id]

  field :chan_id, 1, type: :uint64
end

defmodule Lnrpc.NetworkInfoRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.NetworkInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          graph_diameter: non_neg_integer,
          avg_out_degree: float | :infinity | :negative_infinity | :nan,
          max_out_degree: non_neg_integer,
          num_nodes: non_neg_integer,
          num_channels: non_neg_integer,
          total_network_capacity: integer,
          avg_channel_size: float | :infinity | :negative_infinity | :nan,
          min_channel_size: integer,
          max_channel_size: integer,
          median_channel_size_sat: integer,
          num_zombie_chans: non_neg_integer
        }
  defstruct [
    :graph_diameter,
    :avg_out_degree,
    :max_out_degree,
    :num_nodes,
    :num_channels,
    :total_network_capacity,
    :avg_channel_size,
    :min_channel_size,
    :max_channel_size,
    :median_channel_size_sat,
    :num_zombie_chans
  ]

  field :graph_diameter, 1, type: :uint32
  field :avg_out_degree, 2, type: :double
  field :max_out_degree, 3, type: :uint32
  field :num_nodes, 4, type: :uint32
  field :num_channels, 5, type: :uint32
  field :total_network_capacity, 6, type: :int64
  field :avg_channel_size, 7, type: :double
  field :min_channel_size, 8, type: :int64
  field :max_channel_size, 9, type: :int64
  field :median_channel_size_sat, 10, type: :int64
  field :num_zombie_chans, 11, type: :uint64
end

defmodule Lnrpc.StopRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.StopResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.GraphTopologySubscription do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.GraphTopologyUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node_updates: [Lnrpc.NodeUpdate.t()],
          channel_updates: [Lnrpc.ChannelEdgeUpdate.t()],
          closed_chans: [Lnrpc.ClosedChannelUpdate.t()]
        }
  defstruct [:node_updates, :channel_updates, :closed_chans]

  field :node_updates, 1, repeated: true, type: Lnrpc.NodeUpdate
  field :channel_updates, 2, repeated: true, type: Lnrpc.ChannelEdgeUpdate
  field :closed_chans, 3, repeated: true, type: Lnrpc.ClosedChannelUpdate
end

defmodule Lnrpc.NodeUpdate.FeaturesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: Lnrpc.Feature.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, type: :uint32
  field :value, 2, type: Lnrpc.Feature
end

defmodule Lnrpc.NodeUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          addresses: [String.t()],
          identity_key: String.t(),
          global_features: binary,
          alias: String.t(),
          color: String.t(),
          node_addresses: [Lnrpc.NodeAddress.t()],
          features: %{non_neg_integer => Lnrpc.Feature.t() | nil}
        }
  defstruct [
    :addresses,
    :identity_key,
    :global_features,
    :alias,
    :color,
    :node_addresses,
    :features
  ]

  field :addresses, 1, repeated: true, type: :string, deprecated: true
  field :identity_key, 2, type: :string
  field :global_features, 3, type: :bytes, deprecated: true
  field :alias, 4, type: :string
  field :color, 5, type: :string
  field :node_addresses, 7, repeated: true, type: Lnrpc.NodeAddress
  field :features, 6, repeated: true, type: Lnrpc.NodeUpdate.FeaturesEntry, map: true
end

defmodule Lnrpc.ChannelEdgeUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_id: non_neg_integer,
          chan_point: Lnrpc.ChannelPoint.t() | nil,
          capacity: integer,
          routing_policy: Lnrpc.RoutingPolicy.t() | nil,
          advertising_node: String.t(),
          connecting_node: String.t()
        }
  defstruct [
    :chan_id,
    :chan_point,
    :capacity,
    :routing_policy,
    :advertising_node,
    :connecting_node
  ]

  field :chan_id, 1, type: :uint64
  field :chan_point, 2, type: Lnrpc.ChannelPoint
  field :capacity, 3, type: :int64
  field :routing_policy, 4, type: Lnrpc.RoutingPolicy
  field :advertising_node, 5, type: :string
  field :connecting_node, 6, type: :string
end

defmodule Lnrpc.ClosedChannelUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_id: non_neg_integer,
          capacity: integer,
          closed_height: non_neg_integer,
          chan_point: Lnrpc.ChannelPoint.t() | nil
        }
  defstruct [:chan_id, :capacity, :closed_height, :chan_point]

  field :chan_id, 1, type: :uint64
  field :capacity, 2, type: :int64
  field :closed_height, 3, type: :uint32
  field :chan_point, 4, type: Lnrpc.ChannelPoint
end

defmodule Lnrpc.HopHint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node_id: String.t(),
          chan_id: non_neg_integer,
          fee_base_msat: non_neg_integer,
          fee_proportional_millionths: non_neg_integer,
          cltv_expiry_delta: non_neg_integer
        }
  defstruct [:node_id, :chan_id, :fee_base_msat, :fee_proportional_millionths, :cltv_expiry_delta]

  field :node_id, 1, type: :string
  field :chan_id, 2, type: :uint64
  field :fee_base_msat, 3, type: :uint32
  field :fee_proportional_millionths, 4, type: :uint32
  field :cltv_expiry_delta, 5, type: :uint32
end

defmodule Lnrpc.RouteHint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          hop_hints: [Lnrpc.HopHint.t()]
        }
  defstruct [:hop_hints]

  field :hop_hints, 1, repeated: true, type: Lnrpc.HopHint
end

defmodule Lnrpc.Invoice.FeaturesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: Lnrpc.Feature.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, type: :uint32
  field :value, 2, type: Lnrpc.Feature
end

defmodule Lnrpc.Invoice do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          memo: String.t(),
          r_preimage: binary,
          r_hash: binary,
          value: integer,
          value_msat: integer,
          settled: boolean,
          creation_date: integer,
          settle_date: integer,
          payment_request: String.t(),
          description_hash: binary,
          expiry: integer,
          fallback_addr: String.t(),
          cltv_expiry: non_neg_integer,
          route_hints: [Lnrpc.RouteHint.t()],
          private: boolean,
          add_index: non_neg_integer,
          settle_index: non_neg_integer,
          amt_paid: integer,
          amt_paid_sat: integer,
          amt_paid_msat: integer,
          state: Lnrpc.Invoice.InvoiceState.t(),
          htlcs: [Lnrpc.InvoiceHTLC.t()],
          features: %{non_neg_integer => Lnrpc.Feature.t() | nil},
          is_keysend: boolean,
          payment_addr: binary
        }
  defstruct [
    :memo,
    :r_preimage,
    :r_hash,
    :value,
    :value_msat,
    :settled,
    :creation_date,
    :settle_date,
    :payment_request,
    :description_hash,
    :expiry,
    :fallback_addr,
    :cltv_expiry,
    :route_hints,
    :private,
    :add_index,
    :settle_index,
    :amt_paid,
    :amt_paid_sat,
    :amt_paid_msat,
    :state,
    :htlcs,
    :features,
    :is_keysend,
    :payment_addr
  ]

  field :memo, 1, type: :string
  field :r_preimage, 3, type: :bytes
  field :r_hash, 4, type: :bytes
  field :value, 5, type: :int64
  field :value_msat, 23, type: :int64
  field :settled, 6, type: :bool, deprecated: true
  field :creation_date, 7, type: :int64
  field :settle_date, 8, type: :int64
  field :payment_request, 9, type: :string
  field :description_hash, 10, type: :bytes
  field :expiry, 11, type: :int64
  field :fallback_addr, 12, type: :string
  field :cltv_expiry, 13, type: :uint64
  field :route_hints, 14, repeated: true, type: Lnrpc.RouteHint
  field :private, 15, type: :bool
  field :add_index, 16, type: :uint64
  field :settle_index, 17, type: :uint64
  field :amt_paid, 18, type: :int64, deprecated: true
  field :amt_paid_sat, 19, type: :int64
  field :amt_paid_msat, 20, type: :int64
  field :state, 21, type: Lnrpc.Invoice.InvoiceState, enum: true
  field :htlcs, 22, repeated: true, type: Lnrpc.InvoiceHTLC
  field :features, 24, repeated: true, type: Lnrpc.Invoice.FeaturesEntry, map: true
  field :is_keysend, 25, type: :bool
  field :payment_addr, 26, type: :bytes
end

defmodule Lnrpc.InvoiceHTLC.CustomRecordsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: binary
        }
  defstruct [:key, :value]

  field :key, 1, type: :uint64
  field :value, 2, type: :bytes
end

defmodule Lnrpc.InvoiceHTLC do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_id: non_neg_integer,
          htlc_index: non_neg_integer,
          amt_msat: non_neg_integer,
          accept_height: integer,
          accept_time: integer,
          resolve_time: integer,
          expiry_height: integer,
          state: Lnrpc.InvoiceHTLCState.t(),
          custom_records: %{non_neg_integer => binary},
          mpp_total_amt_msat: non_neg_integer,
          amp: Lnrpc.AMP.t() | nil
        }
  defstruct [
    :chan_id,
    :htlc_index,
    :amt_msat,
    :accept_height,
    :accept_time,
    :resolve_time,
    :expiry_height,
    :state,
    :custom_records,
    :mpp_total_amt_msat,
    :amp
  ]

  field :chan_id, 1, type: :uint64
  field :htlc_index, 2, type: :uint64
  field :amt_msat, 3, type: :uint64
  field :accept_height, 4, type: :int32
  field :accept_time, 5, type: :int64
  field :resolve_time, 6, type: :int64
  field :expiry_height, 7, type: :int32
  field :state, 8, type: Lnrpc.InvoiceHTLCState, enum: true
  field :custom_records, 9, repeated: true, type: Lnrpc.InvoiceHTLC.CustomRecordsEntry, map: true
  field :mpp_total_amt_msat, 10, type: :uint64
  field :amp, 11, type: Lnrpc.AMP
end

defmodule Lnrpc.AMP do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          root_share: binary,
          set_id: binary,
          child_index: non_neg_integer,
          hash: binary,
          preimage: binary
        }
  defstruct [:root_share, :set_id, :child_index, :hash, :preimage]

  field :root_share, 1, type: :bytes
  field :set_id, 2, type: :bytes
  field :child_index, 3, type: :uint32
  field :hash, 4, type: :bytes
  field :preimage, 5, type: :bytes
end

defmodule Lnrpc.AddInvoiceResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          r_hash: binary,
          payment_request: String.t(),
          add_index: non_neg_integer,
          payment_addr: binary
        }
  defstruct [:r_hash, :payment_request, :add_index, :payment_addr]

  field :r_hash, 1, type: :bytes
  field :payment_request, 2, type: :string
  field :add_index, 16, type: :uint64
  field :payment_addr, 17, type: :bytes
end

defmodule Lnrpc.PaymentHash do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          r_hash_str: String.t(),
          r_hash: binary
        }
  defstruct [:r_hash_str, :r_hash]

  field :r_hash_str, 1, type: :string, deprecated: true
  field :r_hash, 2, type: :bytes
end

defmodule Lnrpc.ListInvoiceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pending_only: boolean,
          index_offset: non_neg_integer,
          num_max_invoices: non_neg_integer,
          reversed: boolean
        }
  defstruct [:pending_only, :index_offset, :num_max_invoices, :reversed]

  field :pending_only, 1, type: :bool
  field :index_offset, 4, type: :uint64
  field :num_max_invoices, 5, type: :uint64
  field :reversed, 6, type: :bool
end

defmodule Lnrpc.ListInvoiceResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          invoices: [Lnrpc.Invoice.t()],
          last_index_offset: non_neg_integer,
          first_index_offset: non_neg_integer
        }
  defstruct [:invoices, :last_index_offset, :first_index_offset]

  field :invoices, 1, repeated: true, type: Lnrpc.Invoice
  field :last_index_offset, 2, type: :uint64
  field :first_index_offset, 3, type: :uint64
end

defmodule Lnrpc.InvoiceSubscription do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          add_index: non_neg_integer,
          settle_index: non_neg_integer
        }
  defstruct [:add_index, :settle_index]

  field :add_index, 1, type: :uint64
  field :settle_index, 2, type: :uint64
end

defmodule Lnrpc.Payment do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          payment_hash: String.t(),
          value: integer,
          creation_date: integer,
          fee: integer,
          payment_preimage: String.t(),
          value_sat: integer,
          value_msat: integer,
          payment_request: String.t(),
          status: Lnrpc.Payment.PaymentStatus.t(),
          fee_sat: integer,
          fee_msat: integer,
          creation_time_ns: integer,
          htlcs: [Lnrpc.HTLCAttempt.t()],
          payment_index: non_neg_integer,
          failure_reason: Lnrpc.PaymentFailureReason.t()
        }
  defstruct [
    :payment_hash,
    :value,
    :creation_date,
    :fee,
    :payment_preimage,
    :value_sat,
    :value_msat,
    :payment_request,
    :status,
    :fee_sat,
    :fee_msat,
    :creation_time_ns,
    :htlcs,
    :payment_index,
    :failure_reason
  ]

  field :payment_hash, 1, type: :string
  field :value, 2, type: :int64, deprecated: true
  field :creation_date, 3, type: :int64, deprecated: true
  field :fee, 5, type: :int64, deprecated: true
  field :payment_preimage, 6, type: :string
  field :value_sat, 7, type: :int64
  field :value_msat, 8, type: :int64
  field :payment_request, 9, type: :string
  field :status, 10, type: Lnrpc.Payment.PaymentStatus, enum: true
  field :fee_sat, 11, type: :int64
  field :fee_msat, 12, type: :int64
  field :creation_time_ns, 13, type: :int64
  field :htlcs, 14, repeated: true, type: Lnrpc.HTLCAttempt
  field :payment_index, 15, type: :uint64
  field :failure_reason, 16, type: Lnrpc.PaymentFailureReason, enum: true
end

defmodule Lnrpc.HTLCAttempt do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          attempt_id: non_neg_integer,
          status: Lnrpc.HTLCAttempt.HTLCStatus.t(),
          route: Lnrpc.Route.t() | nil,
          attempt_time_ns: integer,
          resolve_time_ns: integer,
          failure: Lnrpc.Failure.t() | nil,
          preimage: binary
        }
  defstruct [
    :attempt_id,
    :status,
    :route,
    :attempt_time_ns,
    :resolve_time_ns,
    :failure,
    :preimage
  ]

  field :attempt_id, 7, type: :uint64
  field :status, 1, type: Lnrpc.HTLCAttempt.HTLCStatus, enum: true
  field :route, 2, type: Lnrpc.Route
  field :attempt_time_ns, 3, type: :int64
  field :resolve_time_ns, 4, type: :int64
  field :failure, 5, type: Lnrpc.Failure
  field :preimage, 6, type: :bytes
end

defmodule Lnrpc.ListPaymentsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          include_incomplete: boolean,
          index_offset: non_neg_integer,
          max_payments: non_neg_integer,
          reversed: boolean
        }
  defstruct [:include_incomplete, :index_offset, :max_payments, :reversed]

  field :include_incomplete, 1, type: :bool
  field :index_offset, 2, type: :uint64
  field :max_payments, 3, type: :uint64
  field :reversed, 4, type: :bool
end

defmodule Lnrpc.ListPaymentsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          payments: [Lnrpc.Payment.t()],
          first_index_offset: non_neg_integer,
          last_index_offset: non_neg_integer
        }
  defstruct [:payments, :first_index_offset, :last_index_offset]

  field :payments, 1, repeated: true, type: Lnrpc.Payment
  field :first_index_offset, 2, type: :uint64
  field :last_index_offset, 3, type: :uint64
end

defmodule Lnrpc.DeleteAllPaymentsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failed_payments_only: boolean,
          failed_htlcs_only: boolean
        }
  defstruct [:failed_payments_only, :failed_htlcs_only]

  field :failed_payments_only, 1, type: :bool
  field :failed_htlcs_only, 2, type: :bool
end

defmodule Lnrpc.DeleteAllPaymentsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.AbandonChannelRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channel_point: Lnrpc.ChannelPoint.t() | nil,
          pending_funding_shim_only: boolean
        }
  defstruct [:channel_point, :pending_funding_shim_only]

  field :channel_point, 1, type: Lnrpc.ChannelPoint
  field :pending_funding_shim_only, 2, type: :bool
end

defmodule Lnrpc.AbandonChannelResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.DebugLevelRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          show: boolean,
          level_spec: String.t()
        }
  defstruct [:show, :level_spec]

  field :show, 1, type: :bool
  field :level_spec, 2, type: :string
end

defmodule Lnrpc.DebugLevelResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sub_systems: String.t()
        }
  defstruct [:sub_systems]

  field :sub_systems, 1, type: :string
end

defmodule Lnrpc.PayReqString do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pay_req: String.t()
        }
  defstruct [:pay_req]

  field :pay_req, 1, type: :string
end

defmodule Lnrpc.PayReq.FeaturesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: Lnrpc.Feature.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, type: :uint32
  field :value, 2, type: Lnrpc.Feature
end

defmodule Lnrpc.PayReq do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          destination: String.t(),
          payment_hash: String.t(),
          num_satoshis: integer,
          timestamp: integer,
          expiry: integer,
          description: String.t(),
          description_hash: String.t(),
          fallback_addr: String.t(),
          cltv_expiry: integer,
          route_hints: [Lnrpc.RouteHint.t()],
          payment_addr: binary,
          num_msat: integer,
          features: %{non_neg_integer => Lnrpc.Feature.t() | nil}
        }
  defstruct [
    :destination,
    :payment_hash,
    :num_satoshis,
    :timestamp,
    :expiry,
    :description,
    :description_hash,
    :fallback_addr,
    :cltv_expiry,
    :route_hints,
    :payment_addr,
    :num_msat,
    :features
  ]

  field :destination, 1, type: :string
  field :payment_hash, 2, type: :string
  field :num_satoshis, 3, type: :int64
  field :timestamp, 4, type: :int64
  field :expiry, 5, type: :int64
  field :description, 6, type: :string
  field :description_hash, 7, type: :string
  field :fallback_addr, 8, type: :string
  field :cltv_expiry, 9, type: :int64
  field :route_hints, 10, repeated: true, type: Lnrpc.RouteHint
  field :payment_addr, 11, type: :bytes
  field :num_msat, 12, type: :int64
  field :features, 13, repeated: true, type: Lnrpc.PayReq.FeaturesEntry, map: true
end

defmodule Lnrpc.Feature do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          is_required: boolean,
          is_known: boolean
        }
  defstruct [:name, :is_required, :is_known]

  field :name, 2, type: :string
  field :is_required, 3, type: :bool
  field :is_known, 4, type: :bool
end

defmodule Lnrpc.FeeReportRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.ChannelFeeReport do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_id: non_neg_integer,
          channel_point: String.t(),
          base_fee_msat: integer,
          fee_per_mil: integer,
          fee_rate: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:chan_id, :channel_point, :base_fee_msat, :fee_per_mil, :fee_rate]

  field :chan_id, 5, type: :uint64
  field :channel_point, 1, type: :string
  field :base_fee_msat, 2, type: :int64
  field :fee_per_mil, 3, type: :int64
  field :fee_rate, 4, type: :double
end

defmodule Lnrpc.FeeReportResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channel_fees: [Lnrpc.ChannelFeeReport.t()],
          day_fee_sum: non_neg_integer,
          week_fee_sum: non_neg_integer,
          month_fee_sum: non_neg_integer
        }
  defstruct [:channel_fees, :day_fee_sum, :week_fee_sum, :month_fee_sum]

  field :channel_fees, 1, repeated: true, type: Lnrpc.ChannelFeeReport
  field :day_fee_sum, 2, type: :uint64
  field :week_fee_sum, 3, type: :uint64
  field :month_fee_sum, 4, type: :uint64
end

defmodule Lnrpc.PolicyUpdateRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          scope: {atom, any},
          base_fee_msat: integer,
          fee_rate: float | :infinity | :negative_infinity | :nan,
          time_lock_delta: non_neg_integer,
          max_htlc_msat: non_neg_integer,
          min_htlc_msat: non_neg_integer,
          min_htlc_msat_specified: boolean
        }
  defstruct [
    :scope,
    :base_fee_msat,
    :fee_rate,
    :time_lock_delta,
    :max_htlc_msat,
    :min_htlc_msat,
    :min_htlc_msat_specified
  ]

  oneof :scope, 0
  field :global, 1, type: :bool, oneof: 0
  field :chan_point, 2, type: Lnrpc.ChannelPoint, oneof: 0
  field :base_fee_msat, 3, type: :int64
  field :fee_rate, 4, type: :double
  field :time_lock_delta, 5, type: :uint32
  field :max_htlc_msat, 6, type: :uint64
  field :min_htlc_msat, 7, type: :uint64
  field :min_htlc_msat_specified, 8, type: :bool
end

defmodule Lnrpc.PolicyUpdateResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.ForwardingHistoryRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          start_time: non_neg_integer,
          end_time: non_neg_integer,
          index_offset: non_neg_integer,
          num_max_events: non_neg_integer
        }
  defstruct [:start_time, :end_time, :index_offset, :num_max_events]

  field :start_time, 1, type: :uint64
  field :end_time, 2, type: :uint64
  field :index_offset, 3, type: :uint32
  field :num_max_events, 4, type: :uint32
end

defmodule Lnrpc.ForwardingEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timestamp: non_neg_integer,
          chan_id_in: non_neg_integer,
          chan_id_out: non_neg_integer,
          amt_in: non_neg_integer,
          amt_out: non_neg_integer,
          fee: non_neg_integer,
          fee_msat: non_neg_integer,
          amt_in_msat: non_neg_integer,
          amt_out_msat: non_neg_integer,
          timestamp_ns: non_neg_integer
        }
  defstruct [
    :timestamp,
    :chan_id_in,
    :chan_id_out,
    :amt_in,
    :amt_out,
    :fee,
    :fee_msat,
    :amt_in_msat,
    :amt_out_msat,
    :timestamp_ns
  ]

  field :timestamp, 1, type: :uint64, deprecated: true
  field :chan_id_in, 2, type: :uint64
  field :chan_id_out, 4, type: :uint64
  field :amt_in, 5, type: :uint64
  field :amt_out, 6, type: :uint64
  field :fee, 7, type: :uint64
  field :fee_msat, 8, type: :uint64
  field :amt_in_msat, 9, type: :uint64
  field :amt_out_msat, 10, type: :uint64
  field :timestamp_ns, 11, type: :uint64
end

defmodule Lnrpc.ForwardingHistoryResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          forwarding_events: [Lnrpc.ForwardingEvent.t()],
          last_offset_index: non_neg_integer
        }
  defstruct [:forwarding_events, :last_offset_index]

  field :forwarding_events, 1, repeated: true, type: Lnrpc.ForwardingEvent
  field :last_offset_index, 2, type: :uint32
end

defmodule Lnrpc.ExportChannelBackupRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_point: Lnrpc.ChannelPoint.t() | nil
        }
  defstruct [:chan_point]

  field :chan_point, 1, type: Lnrpc.ChannelPoint
end

defmodule Lnrpc.ChannelBackup do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_point: Lnrpc.ChannelPoint.t() | nil,
          chan_backup: binary
        }
  defstruct [:chan_point, :chan_backup]

  field :chan_point, 1, type: Lnrpc.ChannelPoint
  field :chan_backup, 2, type: :bytes
end

defmodule Lnrpc.MultiChanBackup do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_points: [Lnrpc.ChannelPoint.t()],
          multi_chan_backup: binary
        }
  defstruct [:chan_points, :multi_chan_backup]

  field :chan_points, 1, repeated: true, type: Lnrpc.ChannelPoint
  field :multi_chan_backup, 2, type: :bytes
end

defmodule Lnrpc.ChanBackupExportRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.ChanBackupSnapshot do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          single_chan_backups: Lnrpc.ChannelBackups.t() | nil,
          multi_chan_backup: Lnrpc.MultiChanBackup.t() | nil
        }
  defstruct [:single_chan_backups, :multi_chan_backup]

  field :single_chan_backups, 1, type: Lnrpc.ChannelBackups
  field :multi_chan_backup, 2, type: Lnrpc.MultiChanBackup
end

defmodule Lnrpc.ChannelBackups do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_backups: [Lnrpc.ChannelBackup.t()]
        }
  defstruct [:chan_backups]

  field :chan_backups, 1, repeated: true, type: Lnrpc.ChannelBackup
end

defmodule Lnrpc.RestoreChanBackupRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          backup: {atom, any}
        }
  defstruct [:backup]

  oneof :backup, 0
  field :chan_backups, 1, type: Lnrpc.ChannelBackups, oneof: 0
  field :multi_chan_backup, 2, type: :bytes, oneof: 0
end

defmodule Lnrpc.RestoreBackupResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.ChannelBackupSubscription do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.VerifyChanBackupResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.MacaroonPermission do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          entity: String.t(),
          action: String.t()
        }
  defstruct [:entity, :action]

  field :entity, 1, type: :string
  field :action, 2, type: :string
end

defmodule Lnrpc.BakeMacaroonRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          permissions: [Lnrpc.MacaroonPermission.t()],
          root_key_id: non_neg_integer
        }
  defstruct [:permissions, :root_key_id]

  field :permissions, 1, repeated: true, type: Lnrpc.MacaroonPermission
  field :root_key_id, 2, type: :uint64
end

defmodule Lnrpc.BakeMacaroonResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          macaroon: String.t()
        }
  defstruct [:macaroon]

  field :macaroon, 1, type: :string
end

defmodule Lnrpc.ListMacaroonIDsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.ListMacaroonIDsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          root_key_ids: [non_neg_integer]
        }
  defstruct [:root_key_ids]

  field :root_key_ids, 1, repeated: true, type: :uint64
end

defmodule Lnrpc.DeleteMacaroonIDRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          root_key_id: non_neg_integer
        }
  defstruct [:root_key_id]

  field :root_key_id, 1, type: :uint64
end

defmodule Lnrpc.DeleteMacaroonIDResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          deleted: boolean
        }
  defstruct [:deleted]

  field :deleted, 1, type: :bool
end

defmodule Lnrpc.MacaroonPermissionList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          permissions: [Lnrpc.MacaroonPermission.t()]
        }
  defstruct [:permissions]

  field :permissions, 1, repeated: true, type: Lnrpc.MacaroonPermission
end

defmodule Lnrpc.ListPermissionsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Lnrpc.ListPermissionsResponse.MethodPermissionsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Lnrpc.MacaroonPermissionList.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: Lnrpc.MacaroonPermissionList
end

defmodule Lnrpc.ListPermissionsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          method_permissions: %{String.t() => Lnrpc.MacaroonPermissionList.t() | nil}
        }
  defstruct [:method_permissions]

  field :method_permissions, 1,
    repeated: true,
    type: Lnrpc.ListPermissionsResponse.MethodPermissionsEntry,
    map: true
end

defmodule Lnrpc.Failure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          code: Lnrpc.Failure.FailureCode.t(),
          channel_update: Lnrpc.ChannelUpdate.t() | nil,
          htlc_msat: non_neg_integer,
          onion_sha_256: binary,
          cltv_expiry: non_neg_integer,
          flags: non_neg_integer,
          failure_source_index: non_neg_integer,
          height: non_neg_integer
        }
  defstruct [
    :code,
    :channel_update,
    :htlc_msat,
    :onion_sha_256,
    :cltv_expiry,
    :flags,
    :failure_source_index,
    :height
  ]

  field :code, 1, type: Lnrpc.Failure.FailureCode, enum: true
  field :channel_update, 3, type: Lnrpc.ChannelUpdate
  field :htlc_msat, 4, type: :uint64
  field :onion_sha_256, 5, type: :bytes
  field :cltv_expiry, 6, type: :uint32
  field :flags, 7, type: :uint32
  field :failure_source_index, 8, type: :uint32
  field :height, 9, type: :uint32
end

defmodule Lnrpc.ChannelUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          signature: binary,
          chain_hash: binary,
          chan_id: non_neg_integer,
          timestamp: non_neg_integer,
          message_flags: non_neg_integer,
          channel_flags: non_neg_integer,
          time_lock_delta: non_neg_integer,
          htlc_minimum_msat: non_neg_integer,
          base_fee: non_neg_integer,
          fee_rate: non_neg_integer,
          htlc_maximum_msat: non_neg_integer,
          extra_opaque_data: binary
        }
  defstruct [
    :signature,
    :chain_hash,
    :chan_id,
    :timestamp,
    :message_flags,
    :channel_flags,
    :time_lock_delta,
    :htlc_minimum_msat,
    :base_fee,
    :fee_rate,
    :htlc_maximum_msat,
    :extra_opaque_data
  ]

  field :signature, 1, type: :bytes
  field :chain_hash, 2, type: :bytes
  field :chan_id, 3, type: :uint64
  field :timestamp, 4, type: :uint32
  field :message_flags, 10, type: :uint32
  field :channel_flags, 5, type: :uint32
  field :time_lock_delta, 6, type: :uint32
  field :htlc_minimum_msat, 7, type: :uint64
  field :base_fee, 8, type: :uint32
  field :fee_rate, 9, type: :uint32
  field :htlc_maximum_msat, 11, type: :uint64
  field :extra_opaque_data, 12, type: :bytes
end

defmodule Lnrpc.MacaroonId do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          nonce: binary,
          storageId: binary,
          ops: [Lnrpc.Op.t()]
        }
  defstruct [:nonce, :storageId, :ops]

  field :nonce, 1, type: :bytes
  field :storageId, 2, type: :bytes
  field :ops, 3, repeated: true, type: Lnrpc.Op
end

defmodule Lnrpc.Op do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          entity: String.t(),
          actions: [String.t()]
        }
  defstruct [:entity, :actions]

  field :entity, 1, type: :string
  field :actions, 2, repeated: true, type: :string
end

defmodule Lnrpc.Lightning.Service do
  @moduledoc false
  use GRPC.Service, name: "lnrpc.Lightning"

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
end

defmodule Lnrpc.Lightning.Stub do
  @moduledoc false
  use GRPC.Stub, service: Lnrpc.Lightning.Service
end
