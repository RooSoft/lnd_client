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

  @type t ::
          integer
          | :UNKNOWN_COMMITMENT_TYPE
          | :LEGACY
          | :STATIC_REMOTE_KEY
          | :ANCHORS
          | :SCRIPT_ENFORCED_LEASE

  field :UNKNOWN_COMMITMENT_TYPE, 0
  field :LEGACY, 1
  field :STATIC_REMOTE_KEY, 2
  field :ANCHORS, 3
  field :SCRIPT_ENFORCED_LEASE, 4
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
          | :AMP_REQ
          | :AMP_OPT

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
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :UPDATE_FAILURE_UNKNOWN
          | :UPDATE_FAILURE_PENDING
          | :UPDATE_FAILURE_NOT_FOUND
          | :UPDATE_FAILURE_INTERNAL_ERR
          | :UPDATE_FAILURE_INVALID_PARAMETER

  field :UPDATE_FAILURE_UNKNOWN, 0
  field :UPDATE_FAILURE_PENDING, 1
  field :UPDATE_FAILURE_NOT_FOUND, 2
  field :UPDATE_FAILURE_INTERNAL_ERR, 3
  field :UPDATE_FAILURE_INVALID_PARAMETER, 4
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
          | :FULLY_RESOLVED_CHANNEL

  field :OPEN_CHANNEL, 0
  field :CLOSED_CHANNEL, 1
  field :ACTIVE_CHANNEL, 2
  field :INACTIVE_CHANNEL, 3
  field :PENDING_OPEN_CHANNEL, 4
  field :FULLY_RESOLVED_CHANNEL, 5
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
defmodule Lnrpc.SubscribeCustomMessagesRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Lnrpc.CustomMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          peer: binary,
          type: non_neg_integer,
          data: binary
        }

  defstruct peer: "",
            type: 0,
            data: ""

  field :peer, 1, type: :bytes
  field :type, 2, type: :uint32
  field :data, 3, type: :bytes
end
defmodule Lnrpc.SendCustomMessageRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          peer: binary,
          type: non_neg_integer,
          data: binary
        }

  defstruct peer: "",
            type: 0,
            data: ""

  field :peer, 1, type: :bytes
  field :type, 2, type: :uint32
  field :data, 3, type: :bytes
end
defmodule Lnrpc.SendCustomMessageResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
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

  defstruct address_type: :WITNESS_PUBKEY_HASH,
            address: "",
            amount_sat: 0,
            pk_script: "",
            outpoint: nil,
            confirmations: 0

  field :address_type, 1, type: Lnrpc.AddressType, json_name: "addressType", enum: true
  field :address, 2, type: :string
  field :amount_sat, 3, type: :int64, json_name: "amountSat"
  field :pk_script, 4, type: :string, json_name: "pkScript"
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

  defstruct tx_hash: "",
            amount: 0,
            num_confirmations: 0,
            block_hash: "",
            block_height: 0,
            time_stamp: 0,
            total_fees: 0,
            dest_addresses: [],
            raw_tx_hex: "",
            label: ""

  field :tx_hash, 1, type: :string, json_name: "txHash"
  field :amount, 2, type: :int64
  field :num_confirmations, 3, type: :int32, json_name: "numConfirmations"
  field :block_hash, 4, type: :string, json_name: "blockHash"
  field :block_height, 5, type: :int32, json_name: "blockHeight"
  field :time_stamp, 6, type: :int64, json_name: "timeStamp"
  field :total_fees, 7, type: :int64, json_name: "totalFees"
  field :dest_addresses, 8, repeated: true, type: :string, json_name: "destAddresses"
  field :raw_tx_hex, 9, type: :string, json_name: "rawTxHex"
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

  defstruct start_height: 0,
            end_height: 0,
            account: ""

  field :start_height, 1, type: :int32, json_name: "startHeight"
  field :end_height, 2, type: :int32, json_name: "endHeight"
  field :account, 3, type: :string
end
defmodule Lnrpc.TransactionDetails do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transactions: [Lnrpc.Transaction.t()]
        }

  defstruct transactions: []

  field :transactions, 1, repeated: true, type: Lnrpc.Transaction
end
defmodule Lnrpc.FeeLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          limit: {:fixed, integer} | {:fixed_msat, integer} | {:percent, integer}
        }

  defstruct limit: nil

  oneof :limit, 0

  field :fixed, 1, type: :int64, oneof: 0
  field :fixed_msat, 3, type: :int64, json_name: "fixedMsat", oneof: 0
  field :percent, 2, type: :int64, oneof: 0
end
defmodule Lnrpc.SendRequest.DestCustomRecordsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: binary
        }

  defstruct key: 0,
            value: ""

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
          dest_features: [Lnrpc.FeatureBit.t()],
          payment_addr: binary
        }

  defstruct dest: "",
            dest_string: "",
            amt: 0,
            amt_msat: 0,
            payment_hash: "",
            payment_hash_string: "",
            payment_request: "",
            final_cltv_delta: 0,
            fee_limit: nil,
            outgoing_chan_id: 0,
            last_hop_pubkey: "",
            cltv_limit: 0,
            dest_custom_records: %{},
            allow_self_payment: false,
            dest_features: [],
            payment_addr: ""

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          payment_error: String.t(),
          payment_preimage: binary,
          payment_route: Lnrpc.Route.t() | nil,
          payment_hash: binary
        }

  defstruct payment_error: "",
            payment_preimage: "",
            payment_route: nil,
            payment_hash: ""

  field :payment_error, 1, type: :string, json_name: "paymentError"
  field :payment_preimage, 2, type: :bytes, json_name: "paymentPreimage"
  field :payment_route, 3, type: Lnrpc.Route, json_name: "paymentRoute"
  field :payment_hash, 4, type: :bytes, json_name: "paymentHash"
end
defmodule Lnrpc.SendToRouteRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          payment_hash: binary,
          payment_hash_string: String.t(),
          route: Lnrpc.Route.t() | nil
        }

  defstruct payment_hash: "",
            payment_hash_string: "",
            route: nil

  field :payment_hash, 1, type: :bytes, json_name: "paymentHash"
  field :payment_hash_string, 2, type: :string, json_name: "paymentHashString", deprecated: true
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
          channel_flags: non_neg_integer,
          commitment_type: Lnrpc.CommitmentType.t()
        }

  defstruct node_pubkey: "",
            chain_hash: "",
            pending_chan_id: "",
            funding_amt: 0,
            push_amt: 0,
            dust_limit: 0,
            max_value_in_flight: 0,
            channel_reserve: 0,
            min_htlc: 0,
            fee_per_kw: 0,
            csv_delay: 0,
            max_accepted_htlcs: 0,
            channel_flags: 0,
            commitment_type: :UNKNOWN_COMMITMENT_TYPE

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

  defstruct accept: false,
            pending_chan_id: "",
            error: "",
            upfront_shutdown: "",
            csv_delay: 0,
            reserve_sat: 0,
            in_flight_max_msat: 0,
            max_htlc_count: 0,
            min_htlc_in: 0,
            min_accept_depth: 0

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
end
defmodule Lnrpc.ChannelPoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          funding_txid: {:funding_txid_bytes, binary} | {:funding_txid_str, String.t()},
          output_index: non_neg_integer
        }

  defstruct funding_txid: nil,
            output_index: 0

  oneof :funding_txid, 0

  field :funding_txid_bytes, 1, type: :bytes, json_name: "fundingTxidBytes", oneof: 0
  field :funding_txid_str, 2, type: :string, json_name: "fundingTxidStr", oneof: 0
  field :output_index, 3, type: :uint32, json_name: "outputIndex"
end
defmodule Lnrpc.OutPoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          txid_bytes: binary,
          txid_str: String.t(),
          output_index: non_neg_integer
        }

  defstruct txid_bytes: "",
            txid_str: "",
            output_index: 0

  field :txid_bytes, 1, type: :bytes, json_name: "txidBytes"
  field :txid_str, 2, type: :string, json_name: "txidStr"
  field :output_index, 3, type: :uint32, json_name: "outputIndex"
end
defmodule Lnrpc.LightningAddress do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pubkey: String.t(),
          host: String.t()
        }

  defstruct pubkey: "",
            host: ""

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

  defstruct key: "",
            value: 0

  field :key, 1, type: :string
  field :value, 2, type: :int64
end
defmodule Lnrpc.EstimateFeeRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          AddrToAmount: %{String.t() => integer},
          target_conf: integer,
          min_confs: integer,
          spend_unconfirmed: boolean
        }

  defstruct AddrToAmount: %{},
            target_conf: 0,
            min_confs: 0,
            spend_unconfirmed: false

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          fee_sat: integer,
          feerate_sat_per_byte: integer,
          sat_per_vbyte: non_neg_integer
        }

  defstruct fee_sat: 0,
            feerate_sat_per_byte: 0,
            sat_per_vbyte: 0

  field :fee_sat, 1, type: :int64, json_name: "feeSat"
  field :feerate_sat_per_byte, 2, type: :int64, json_name: "feerateSatPerByte", deprecated: true
  field :sat_per_vbyte, 3, type: :uint64, json_name: "satPerVbyte"
end
defmodule Lnrpc.SendManyRequest.AddrToAmountEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }

  defstruct key: "",
            value: 0

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

  defstruct AddrToAmount: %{},
            target_conf: 0,
            sat_per_vbyte: 0,
            sat_per_byte: 0,
            label: "",
            min_confs: 0,
            spend_unconfirmed: false

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          txid: String.t()
        }

  defstruct txid: ""

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

  defstruct addr: "",
            amount: 0,
            target_conf: 0,
            sat_per_vbyte: 0,
            sat_per_byte: 0,
            send_all: false,
            label: "",
            min_confs: 0,
            spend_unconfirmed: false

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          txid: String.t()
        }

  defstruct txid: ""

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

  defstruct min_confs: 0,
            max_confs: 0,
            account: ""

  field :min_confs, 1, type: :int32, json_name: "minConfs"
  field :max_confs, 2, type: :int32, json_name: "maxConfs"
  field :account, 3, type: :string
end
defmodule Lnrpc.ListUnspentResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          utxos: [Lnrpc.Utxo.t()]
        }

  defstruct utxos: []

  field :utxos, 1, repeated: true, type: Lnrpc.Utxo
end
defmodule Lnrpc.NewAddressRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: Lnrpc.AddressType.t(),
          account: String.t()
        }

  defstruct type: :WITNESS_PUBKEY_HASH,
            account: ""

  field :type, 1, type: Lnrpc.AddressType, enum: true
  field :account, 2, type: :string
end
defmodule Lnrpc.NewAddressResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: String.t()
        }

  defstruct address: ""

  field :address, 1, type: :string
end
defmodule Lnrpc.SignMessageRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          msg: binary,
          single_hash: boolean
        }

  defstruct msg: "",
            single_hash: false

  field :msg, 1, type: :bytes
  field :single_hash, 2, type: :bool, json_name: "singleHash"
end
defmodule Lnrpc.SignMessageResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          signature: String.t()
        }

  defstruct signature: ""

  field :signature, 1, type: :string
end
defmodule Lnrpc.VerifyMessageRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          msg: binary,
          signature: String.t()
        }

  defstruct msg: "",
            signature: ""

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

  defstruct valid: false,
            pubkey: ""

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

  defstruct addr: nil,
            perm: false,
            timeout: 0

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

  defstruct pub_key: ""

  field :pub_key, 1, type: :string, json_name: "pubKey"
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

  defstruct incoming: false,
            amount: 0,
            hash_lock: "",
            expiration_height: 0,
            htlc_index: 0,
            forwarding_channel: 0,
            forwarding_htlc_index: 0

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          csv_delay: non_neg_integer,
          chan_reserve_sat: non_neg_integer,
          dust_limit_sat: non_neg_integer,
          max_pending_amt_msat: non_neg_integer,
          min_htlc_msat: non_neg_integer,
          max_accepted_htlcs: non_neg_integer
        }

  defstruct csv_delay: 0,
            chan_reserve_sat: 0,
            dust_limit_sat: 0,
            max_pending_amt_msat: 0,
            min_htlc_msat: 0,
            max_accepted_htlcs: 0

  field :csv_delay, 1, type: :uint32, json_name: "csvDelay"
  field :chan_reserve_sat, 2, type: :uint64, json_name: "chanReserveSat"
  field :dust_limit_sat, 3, type: :uint64, json_name: "dustLimitSat"
  field :max_pending_amt_msat, 4, type: :uint64, json_name: "maxPendingAmtMsat"
  field :min_htlc_msat, 5, type: :uint64, json_name: "minHtlcMsat"
  field :max_accepted_htlcs, 6, type: :uint32, json_name: "maxAcceptedHtlcs"
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

  defstruct active: false,
            remote_pubkey: "",
            channel_point: "",
            chan_id: 0,
            capacity: 0,
            local_balance: 0,
            remote_balance: 0,
            commit_fee: 0,
            commit_weight: 0,
            fee_per_kw: 0,
            unsettled_balance: 0,
            total_satoshis_sent: 0,
            total_satoshis_received: 0,
            num_updates: 0,
            pending_htlcs: [],
            csv_delay: 0,
            private: false,
            initiator: false,
            chan_status_flags: "",
            local_chan_reserve_sat: 0,
            remote_chan_reserve_sat: 0,
            static_remote_key: false,
            commitment_type: :UNKNOWN_COMMITMENT_TYPE,
            lifetime: 0,
            uptime: 0,
            close_address: "",
            push_amount_sat: 0,
            thaw_height: 0,
            local_constraints: nil,
            remote_constraints: nil

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

  defstruct active_only: false,
            inactive_only: false,
            public_only: false,
            private_only: false,
            peer: ""

  field :active_only, 1, type: :bool, json_name: "activeOnly"
  field :inactive_only, 2, type: :bool, json_name: "inactiveOnly"
  field :public_only, 3, type: :bool, json_name: "publicOnly"
  field :private_only, 4, type: :bool, json_name: "privateOnly"
  field :peer, 5, type: :bytes
end
defmodule Lnrpc.ListChannelsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channels: [Lnrpc.Channel.t()]
        }

  defstruct channels: []

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

  defstruct channel_point: "",
            chan_id: 0,
            chain_hash: "",
            closing_tx_hash: "",
            remote_pubkey: "",
            capacity: 0,
            close_height: 0,
            settled_balance: 0,
            time_locked_balance: 0,
            close_type: :COOPERATIVE_CLOSE,
            open_initiator: :INITIATOR_UNKNOWN,
            close_initiator: :INITIATOR_UNKNOWN,
            resolutions: []

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

  defstruct resolution_type: :TYPE_UNKNOWN,
            outcome: :OUTCOME_UNKNOWN,
            outpoint: nil,
            amount_sat: 0,
            sweep_txid: ""

  field :resolution_type, 1, type: Lnrpc.ResolutionType, json_name: "resolutionType", enum: true
  field :outcome, 2, type: Lnrpc.ResolutionOutcome, enum: true
  field :outpoint, 3, type: Lnrpc.OutPoint
  field :amount_sat, 4, type: :uint64, json_name: "amountSat"
  field :sweep_txid, 5, type: :string, json_name: "sweepTxid"
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

  defstruct cooperative: false,
            local_force: false,
            remote_force: false,
            breach: false,
            funding_canceled: false,
            abandoned: false

  field :cooperative, 1, type: :bool
  field :local_force, 2, type: :bool, json_name: "localForce"
  field :remote_force, 3, type: :bool, json_name: "remoteForce"
  field :breach, 4, type: :bool
  field :funding_canceled, 5, type: :bool, json_name: "fundingCanceled"
  field :abandoned, 6, type: :bool
end
defmodule Lnrpc.ClosedChannelsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channels: [Lnrpc.ChannelCloseSummary.t()]
        }

  defstruct channels: []

  field :channels, 1, repeated: true, type: Lnrpc.ChannelCloseSummary
end
defmodule Lnrpc.Peer.FeaturesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: Lnrpc.Feature.t() | nil
        }

  defstruct key: 0,
            value: nil

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
          last_flap_ns: integer,
          last_ping_payload: binary
        }

  defstruct pub_key: "",
            address: "",
            bytes_sent: 0,
            bytes_recv: 0,
            sat_sent: 0,
            sat_recv: 0,
            inbound: false,
            ping_time: 0,
            sync_type: :UNKNOWN_SYNC,
            features: %{},
            errors: [],
            flap_count: 0,
            last_flap_ns: 0,
            last_ping_payload: ""

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timestamp: non_neg_integer,
          error: String.t()
        }

  defstruct timestamp: 0,
            error: ""

  field :timestamp, 1, type: :uint64
  field :error, 2, type: :string
end
defmodule Lnrpc.ListPeersRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          latest_error: boolean
        }

  defstruct latest_error: false

  field :latest_error, 1, type: :bool, json_name: "latestError"
end
defmodule Lnrpc.ListPeersResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          peers: [Lnrpc.Peer.t()]
        }

  defstruct peers: []

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

  defstruct pub_key: "",
            type: :PEER_ONLINE

  field :pub_key, 1, type: :string, json_name: "pubKey"
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

  defstruct key: 0,
            value: nil

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

  defstruct version: "",
            commit_hash: "",
            identity_pubkey: "",
            alias: "",
            color: "",
            num_pending_channels: 0,
            num_active_channels: 0,
            num_inactive_channels: 0,
            num_peers: 0,
            block_height: 0,
            block_hash: "",
            best_header_timestamp: 0,
            synced_to_chain: false,
            synced_to_graph: false,
            testnet: false,
            chains: [],
            uris: [],
            features: %{}

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

  defstruct recovery_mode: false,
            recovery_finished: false,
            progress: 0.0

  field :recovery_mode, 1, type: :bool, json_name: "recoveryMode"
  field :recovery_finished, 2, type: :bool, json_name: "recoveryFinished"
  field :progress, 3, type: :double
end
defmodule Lnrpc.Chain do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chain: String.t(),
          network: String.t()
        }

  defstruct chain: "",
            network: ""

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

  defstruct block_sha: "",
            block_height: 0,
            num_confs_left: 0

  field :block_sha, 1, type: :bytes, json_name: "blockSha"
  field :block_height, 2, type: :int32, json_name: "blockHeight"
  field :num_confs_left, 3, type: :uint32, json_name: "numConfsLeft"
end
defmodule Lnrpc.ChannelOpenUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channel_point: Lnrpc.ChannelPoint.t() | nil
        }

  defstruct channel_point: nil

  field :channel_point, 1, type: Lnrpc.ChannelPoint, json_name: "channelPoint"
end
defmodule Lnrpc.ChannelCloseUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          closing_txid: binary,
          success: boolean
        }

  defstruct closing_txid: "",
            success: false

  field :closing_txid, 1, type: :bytes, json_name: "closingTxid"
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

  defstruct channel_point: nil,
            force: false,
            target_conf: 0,
            sat_per_byte: 0,
            delivery_address: "",
            sat_per_vbyte: 0

  field :channel_point, 1, type: Lnrpc.ChannelPoint, json_name: "channelPoint"
  field :force, 2, type: :bool
  field :target_conf, 3, type: :int32, json_name: "targetConf"
  field :sat_per_byte, 4, type: :int64, json_name: "satPerByte", deprecated: true
  field :delivery_address, 5, type: :string, json_name: "deliveryAddress"
  field :sat_per_vbyte, 6, type: :uint64, json_name: "satPerVbyte"
end
defmodule Lnrpc.CloseStatusUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          update:
            {:close_pending, Lnrpc.PendingUpdate.t() | nil}
            | {:chan_close, Lnrpc.ChannelCloseUpdate.t() | nil}
        }

  defstruct update: nil

  oneof :update, 0

  field :close_pending, 1, type: Lnrpc.PendingUpdate, json_name: "closePending", oneof: 0
  field :chan_close, 3, type: Lnrpc.ChannelCloseUpdate, json_name: "chanClose", oneof: 0
end
defmodule Lnrpc.PendingUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          txid: binary,
          output_index: non_neg_integer
        }

  defstruct txid: "",
            output_index: 0

  field :txid, 1, type: :bytes
  field :output_index, 2, type: :uint32, json_name: "outputIndex"
end
defmodule Lnrpc.ReadyForPsbtFunding do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          funding_address: String.t(),
          funding_amount: integer,
          psbt: binary
        }

  defstruct funding_address: "",
            funding_amount: 0,
            psbt: ""

  field :funding_address, 1, type: :string, json_name: "fundingAddress"
  field :funding_amount, 2, type: :int64, json_name: "fundingAmount"
  field :psbt, 3, type: :bytes
end
defmodule Lnrpc.BatchOpenChannelRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channels: [Lnrpc.BatchOpenChannel.t()],
          target_conf: integer,
          sat_per_vbyte: integer,
          min_confs: integer,
          spend_unconfirmed: boolean,
          label: String.t()
        }

  defstruct channels: [],
            target_conf: 0,
            sat_per_vbyte: 0,
            min_confs: 0,
            spend_unconfirmed: false,
            label: ""

  field :channels, 1, repeated: true, type: Lnrpc.BatchOpenChannel
  field :target_conf, 2, type: :int32, json_name: "targetConf"
  field :sat_per_vbyte, 3, type: :int64, json_name: "satPerVbyte"
  field :min_confs, 4, type: :int32, json_name: "minConfs"
  field :spend_unconfirmed, 5, type: :bool, json_name: "spendUnconfirmed"
  field :label, 6, type: :string
end
defmodule Lnrpc.BatchOpenChannel do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node_pubkey: binary,
          local_funding_amount: integer,
          push_sat: integer,
          private: boolean,
          min_htlc_msat: integer,
          remote_csv_delay: non_neg_integer,
          close_address: String.t(),
          pending_chan_id: binary,
          commitment_type: Lnrpc.CommitmentType.t()
        }

  defstruct node_pubkey: "",
            local_funding_amount: 0,
            push_sat: 0,
            private: false,
            min_htlc_msat: 0,
            remote_csv_delay: 0,
            close_address: "",
            pending_chan_id: "",
            commitment_type: :UNKNOWN_COMMITMENT_TYPE

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pending_channels: [Lnrpc.PendingUpdate.t()]
        }

  defstruct pending_channels: []

  field :pending_channels, 1,
    repeated: true,
    type: Lnrpc.PendingUpdate,
    json_name: "pendingChannels"
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
          max_local_csv: non_neg_integer,
          commitment_type: Lnrpc.CommitmentType.t()
        }

  defstruct sat_per_vbyte: 0,
            node_pubkey: "",
            node_pubkey_string: "",
            local_funding_amount: 0,
            push_sat: 0,
            target_conf: 0,
            sat_per_byte: 0,
            private: false,
            min_htlc_msat: 0,
            remote_csv_delay: 0,
            min_confs: 0,
            spend_unconfirmed: false,
            close_address: "",
            funding_shim: nil,
            remote_max_value_in_flight_msat: 0,
            remote_max_htlcs: 0,
            max_local_csv: 0,
            commitment_type: :UNKNOWN_COMMITMENT_TYPE

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
end
defmodule Lnrpc.OpenStatusUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          update:
            {:chan_pending, Lnrpc.PendingUpdate.t() | nil}
            | {:chan_open, Lnrpc.ChannelOpenUpdate.t() | nil}
            | {:psbt_fund, Lnrpc.ReadyForPsbtFunding.t() | nil},
          pending_chan_id: binary
        }

  defstruct update: nil,
            pending_chan_id: ""

  oneof :update, 0

  field :chan_pending, 1, type: Lnrpc.PendingUpdate, json_name: "chanPending", oneof: 0
  field :chan_open, 3, type: Lnrpc.ChannelOpenUpdate, json_name: "chanOpen", oneof: 0
  field :psbt_fund, 5, type: Lnrpc.ReadyForPsbtFunding, json_name: "psbtFund", oneof: 0
  field :pending_chan_id, 4, type: :bytes, json_name: "pendingChanId"
end
defmodule Lnrpc.KeyLocator do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key_family: integer,
          key_index: integer
        }

  defstruct key_family: 0,
            key_index: 0

  field :key_family, 1, type: :int32, json_name: "keyFamily"
  field :key_index, 2, type: :int32, json_name: "keyIndex"
end
defmodule Lnrpc.KeyDescriptor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          raw_key_bytes: binary,
          key_loc: Lnrpc.KeyLocator.t() | nil
        }

  defstruct raw_key_bytes: "",
            key_loc: nil

  field :raw_key_bytes, 1, type: :bytes, json_name: "rawKeyBytes"
  field :key_loc, 2, type: Lnrpc.KeyLocator, json_name: "keyLoc"
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

  defstruct amt: 0,
            chan_point: nil,
            local_key: nil,
            remote_key: "",
            pending_chan_id: "",
            thaw_height: 0

  field :amt, 1, type: :int64
  field :chan_point, 2, type: Lnrpc.ChannelPoint, json_name: "chanPoint"
  field :local_key, 3, type: Lnrpc.KeyDescriptor, json_name: "localKey"
  field :remote_key, 4, type: :bytes, json_name: "remoteKey"
  field :pending_chan_id, 5, type: :bytes, json_name: "pendingChanId"
  field :thaw_height, 6, type: :uint32, json_name: "thawHeight"
end
defmodule Lnrpc.PsbtShim do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pending_chan_id: binary,
          base_psbt: binary,
          no_publish: boolean
        }

  defstruct pending_chan_id: "",
            base_psbt: "",
            no_publish: false

  field :pending_chan_id, 1, type: :bytes, json_name: "pendingChanId"
  field :base_psbt, 2, type: :bytes, json_name: "basePsbt"
  field :no_publish, 3, type: :bool, json_name: "noPublish"
end
defmodule Lnrpc.FundingShim do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          shim:
            {:chan_point_shim, Lnrpc.ChanPointShim.t() | nil}
            | {:psbt_shim, Lnrpc.PsbtShim.t() | nil}
        }

  defstruct shim: nil

  oneof :shim, 0

  field :chan_point_shim, 1, type: Lnrpc.ChanPointShim, json_name: "chanPointShim", oneof: 0
  field :psbt_shim, 2, type: Lnrpc.PsbtShim, json_name: "psbtShim", oneof: 0
end
defmodule Lnrpc.FundingShimCancel do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pending_chan_id: binary
        }

  defstruct pending_chan_id: ""

  field :pending_chan_id, 1, type: :bytes, json_name: "pendingChanId"
end
defmodule Lnrpc.FundingPsbtVerify do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          funded_psbt: binary,
          pending_chan_id: binary,
          skip_finalize: boolean
        }

  defstruct funded_psbt: "",
            pending_chan_id: "",
            skip_finalize: false

  field :funded_psbt, 1, type: :bytes, json_name: "fundedPsbt"
  field :pending_chan_id, 2, type: :bytes, json_name: "pendingChanId"
  field :skip_finalize, 3, type: :bool, json_name: "skipFinalize"
end
defmodule Lnrpc.FundingPsbtFinalize do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          signed_psbt: binary,
          pending_chan_id: binary,
          final_raw_tx: binary
        }

  defstruct signed_psbt: "",
            pending_chan_id: "",
            final_raw_tx: ""

  field :signed_psbt, 1, type: :bytes, json_name: "signedPsbt"
  field :pending_chan_id, 2, type: :bytes, json_name: "pendingChanId"
  field :final_raw_tx, 3, type: :bytes, json_name: "finalRawTx"
end
defmodule Lnrpc.FundingTransitionMsg do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          trigger:
            {:shim_register, Lnrpc.FundingShim.t() | nil}
            | {:shim_cancel, Lnrpc.FundingShimCancel.t() | nil}
            | {:psbt_verify, Lnrpc.FundingPsbtVerify.t() | nil}
            | {:psbt_finalize, Lnrpc.FundingPsbtFinalize.t() | nil}
        }

  defstruct trigger: nil

  oneof :trigger, 0

  field :shim_register, 1, type: Lnrpc.FundingShim, json_name: "shimRegister", oneof: 0
  field :shim_cancel, 2, type: Lnrpc.FundingShimCancel, json_name: "shimCancel", oneof: 0
  field :psbt_verify, 3, type: Lnrpc.FundingPsbtVerify, json_name: "psbtVerify", oneof: 0
  field :psbt_finalize, 4, type: Lnrpc.FundingPsbtFinalize, json_name: "psbtFinalize", oneof: 0
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

  defstruct incoming: false,
            amount: 0,
            outpoint: "",
            maturity_height: 0,
            blocks_til_maturity: 0,
            stage: 0

  field :incoming, 1, type: :bool
  field :amount, 2, type: :int64
  field :outpoint, 3, type: :string
  field :maturity_height, 4, type: :uint32, json_name: "maturityHeight"
  field :blocks_til_maturity, 5, type: :int32, json_name: "blocksTilMaturity"
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
          commitment_type: Lnrpc.CommitmentType.t(),
          num_forwarding_packages: integer,
          chan_status_flags: String.t()
        }

  defstruct remote_node_pub: "",
            channel_point: "",
            capacity: 0,
            local_balance: 0,
            remote_balance: 0,
            local_chan_reserve_sat: 0,
            remote_chan_reserve_sat: 0,
            initiator: :INITIATOR_UNKNOWN,
            commitment_type: :UNKNOWN_COMMITMENT_TYPE,
            num_forwarding_packages: 0,
            chan_status_flags: ""

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

  defstruct channel: nil,
            confirmation_height: 0,
            commit_fee: 0,
            commit_weight: 0,
            fee_per_kw: 0

  field :channel, 1, type: Lnrpc.PendingChannelsResponse.PendingChannel
  field :confirmation_height, 2, type: :uint32, json_name: "confirmationHeight"
  field :commit_fee, 4, type: :int64, json_name: "commitFee"
  field :commit_weight, 5, type: :int64, json_name: "commitWeight"
  field :fee_per_kw, 6, type: :int64, json_name: "feePerKw"
end
defmodule Lnrpc.PendingChannelsResponse.WaitingCloseChannel do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channel: Lnrpc.PendingChannelsResponse.PendingChannel.t() | nil,
          limbo_balance: integer,
          commitments: Lnrpc.PendingChannelsResponse.Commitments.t() | nil
        }

  defstruct channel: nil,
            limbo_balance: 0,
            commitments: nil

  field :channel, 1, type: Lnrpc.PendingChannelsResponse.PendingChannel
  field :limbo_balance, 2, type: :int64, json_name: "limboBalance"
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

  defstruct local_txid: "",
            remote_txid: "",
            remote_pending_txid: "",
            local_commit_fee_sat: 0,
            remote_commit_fee_sat: 0,
            remote_pending_commit_fee_sat: 0

  field :local_txid, 1, type: :string, json_name: "localTxid"
  field :remote_txid, 2, type: :string, json_name: "remoteTxid"
  field :remote_pending_txid, 3, type: :string, json_name: "remotePendingTxid"
  field :local_commit_fee_sat, 4, type: :uint64, json_name: "localCommitFeeSat"
  field :remote_commit_fee_sat, 5, type: :uint64, json_name: "remoteCommitFeeSat"
  field :remote_pending_commit_fee_sat, 6, type: :uint64, json_name: "remotePendingCommitFeeSat"
end
defmodule Lnrpc.PendingChannelsResponse.ClosedChannel do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channel: Lnrpc.PendingChannelsResponse.PendingChannel.t() | nil,
          closing_txid: String.t()
        }

  defstruct channel: nil,
            closing_txid: ""

  field :channel, 1, type: Lnrpc.PendingChannelsResponse.PendingChannel
  field :closing_txid, 2, type: :string, json_name: "closingTxid"
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

  defstruct channel: nil,
            closing_txid: "",
            limbo_balance: 0,
            maturity_height: 0,
            blocks_til_maturity: 0,
            recovered_balance: 0,
            pending_htlcs: [],
            anchor: :LIMBO

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          total_limbo_balance: integer,
          pending_open_channels: [Lnrpc.PendingChannelsResponse.PendingOpenChannel.t()],
          pending_closing_channels: [Lnrpc.PendingChannelsResponse.ClosedChannel.t()],
          pending_force_closing_channels: [Lnrpc.PendingChannelsResponse.ForceClosedChannel.t()],
          waiting_close_channels: [Lnrpc.PendingChannelsResponse.WaitingCloseChannel.t()]
        }

  defstruct total_limbo_balance: 0,
            pending_open_channels: [],
            pending_closing_channels: [],
            pending_force_closing_channels: [],
            waiting_close_channels: []

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Lnrpc.ChannelEventUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          channel:
            {:open_channel, Lnrpc.Channel.t() | nil}
            | {:closed_channel, Lnrpc.ChannelCloseSummary.t() | nil}
            | {:active_channel, Lnrpc.ChannelPoint.t() | nil}
            | {:inactive_channel, Lnrpc.ChannelPoint.t() | nil}
            | {:pending_open_channel, Lnrpc.PendingUpdate.t() | nil}
            | {:fully_resolved_channel, Lnrpc.ChannelPoint.t() | nil},
          type: Lnrpc.ChannelEventUpdate.UpdateType.t()
        }

  defstruct channel: nil,
            type: :OPEN_CHANNEL

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          confirmed_balance: integer,
          unconfirmed_balance: integer
        }

  defstruct confirmed_balance: 0,
            unconfirmed_balance: 0

  field :confirmed_balance, 1, type: :int64, json_name: "confirmedBalance"
  field :unconfirmed_balance, 2, type: :int64, json_name: "unconfirmedBalance"
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

  defstruct key: "",
            value: nil

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

  defstruct total_balance: 0,
            confirmed_balance: 0,
            unconfirmed_balance: 0,
            account_balance: %{}

  field :total_balance, 1, type: :int64, json_name: "totalBalance"
  field :confirmed_balance, 2, type: :int64, json_name: "confirmedBalance"
  field :unconfirmed_balance, 3, type: :int64, json_name: "unconfirmedBalance"

  field :account_balance, 4,
    repeated: true,
    type: Lnrpc.WalletBalanceResponse.AccountBalanceEntry,
    json_name: "accountBalance",
    map: true
end
defmodule Lnrpc.Amount do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sat: non_neg_integer,
          msat: non_neg_integer
        }

  defstruct sat: 0,
            msat: 0

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

  defstruct balance: 0,
            pending_open_balance: 0,
            local_balance: nil,
            remote_balance: nil,
            unsettled_local_balance: nil,
            unsettled_remote_balance: nil,
            pending_open_local_balance: nil,
            pending_open_remote_balance: nil

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
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: binary
        }

  defstruct key: 0,
            value: ""

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
          dest_features: [Lnrpc.FeatureBit.t()]
        }

  defstruct pub_key: "",
            amt: 0,
            amt_msat: 0,
            final_cltv_delta: 0,
            fee_limit: nil,
            ignored_nodes: [],
            ignored_edges: [],
            source_pub_key: "",
            use_mission_control: false,
            ignored_pairs: [],
            cltv_limit: 0,
            dest_custom_records: %{},
            outgoing_chan_id: 0,
            last_hop_pubkey: "",
            route_hints: [],
            dest_features: []

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
end
defmodule Lnrpc.NodePair do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          from: binary,
          to: binary
        }

  defstruct from: "",
            to: ""

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

  defstruct channel_id: 0,
            direction_reverse: false

  field :channel_id, 1, type: :uint64, json_name: "channelId", deprecated: false
  field :direction_reverse, 2, type: :bool, json_name: "directionReverse"
end
defmodule Lnrpc.QueryRoutesResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          routes: [Lnrpc.Route.t()],
          success_prob: float | :infinity | :negative_infinity | :nan
        }

  defstruct routes: [],
            success_prob: 0.0

  field :routes, 1, repeated: true, type: Lnrpc.Route
  field :success_prob, 2, type: :double, json_name: "successProb"
end
defmodule Lnrpc.Hop.CustomRecordsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: binary
        }

  defstruct key: 0,
            value: ""

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

  defstruct chan_id: 0,
            chan_capacity: 0,
            amt_to_forward: 0,
            fee: 0,
            expiry: 0,
            amt_to_forward_msat: 0,
            fee_msat: 0,
            pub_key: "",
            tlv_payload: false,
            mpp_record: nil,
            amp_record: nil,
            custom_records: %{}

  field :chan_id, 1, type: :uint64, json_name: "chanId", deprecated: false
  field :chan_capacity, 2, type: :int64, json_name: "chanCapacity", deprecated: true
  field :amt_to_forward, 3, type: :int64, json_name: "amtToForward", deprecated: true
  field :fee, 4, type: :int64, deprecated: true
  field :expiry, 5, type: :uint32
  field :amt_to_forward_msat, 6, type: :int64, json_name: "amtToForwardMsat"
  field :fee_msat, 7, type: :int64, json_name: "feeMsat"
  field :pub_key, 8, type: :string, json_name: "pubKey"
  field :tlv_payload, 9, type: :bool, json_name: "tlvPayload"
  field :mpp_record, 10, type: Lnrpc.MPPRecord, json_name: "mppRecord"
  field :amp_record, 12, type: Lnrpc.AMPRecord, json_name: "ampRecord"

  field :custom_records, 11,
    repeated: true,
    type: Lnrpc.Hop.CustomRecordsEntry,
    json_name: "customRecords",
    map: true
end
defmodule Lnrpc.MPPRecord do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          payment_addr: binary,
          total_amt_msat: integer
        }

  defstruct payment_addr: "",
            total_amt_msat: 0

  field :payment_addr, 11, type: :bytes, json_name: "paymentAddr"
  field :total_amt_msat, 10, type: :int64, json_name: "totalAmtMsat"
end
defmodule Lnrpc.AMPRecord do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          root_share: binary,
          set_id: binary,
          child_index: non_neg_integer
        }

  defstruct root_share: "",
            set_id: "",
            child_index: 0

  field :root_share, 1, type: :bytes, json_name: "rootShare"
  field :set_id, 2, type: :bytes, json_name: "setId"
  field :child_index, 3, type: :uint32, json_name: "childIndex"
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

  defstruct total_time_lock: 0,
            total_fees: 0,
            total_amt: 0,
            hops: [],
            total_fees_msat: 0,
            total_amt_msat: 0

  field :total_time_lock, 1, type: :uint32, json_name: "totalTimeLock"
  field :total_fees, 2, type: :int64, json_name: "totalFees", deprecated: true
  field :total_amt, 3, type: :int64, json_name: "totalAmt", deprecated: true
  field :hops, 4, repeated: true, type: Lnrpc.Hop
  field :total_fees_msat, 5, type: :int64, json_name: "totalFeesMsat"
  field :total_amt_msat, 6, type: :int64, json_name: "totalAmtMsat"
end
defmodule Lnrpc.NodeInfoRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pub_key: String.t(),
          include_channels: boolean
        }

  defstruct pub_key: "",
            include_channels: false

  field :pub_key, 1, type: :string, json_name: "pubKey"
  field :include_channels, 2, type: :bool, json_name: "includeChannels"
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

  defstruct node: nil,
            num_channels: 0,
            total_capacity: 0,
            channels: []

  field :node, 1, type: Lnrpc.LightningNode
  field :num_channels, 2, type: :uint32, json_name: "numChannels"
  field :total_capacity, 3, type: :int64, json_name: "totalCapacity"
  field :channels, 4, repeated: true, type: Lnrpc.ChannelEdge
end
defmodule Lnrpc.LightningNode.FeaturesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: Lnrpc.Feature.t() | nil
        }

  defstruct key: 0,
            value: nil

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

  defstruct last_update: 0,
            pub_key: "",
            alias: "",
            addresses: [],
            color: "",
            features: %{}

  field :last_update, 1, type: :uint32, json_name: "lastUpdate"
  field :pub_key, 2, type: :string, json_name: "pubKey"
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

  defstruct network: "",
            addr: ""

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

  defstruct time_lock_delta: 0,
            min_htlc: 0,
            fee_base_msat: 0,
            fee_rate_milli_msat: 0,
            disabled: false,
            max_htlc_msat: 0,
            last_update: 0

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

  defstruct channel_id: 0,
            chan_point: "",
            last_update: 0,
            node1_pub: "",
            node2_pub: "",
            capacity: 0,
            node1_policy: nil,
            node2_policy: nil

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          include_unannounced: boolean
        }

  defstruct include_unannounced: false

  field :include_unannounced, 1, type: :bool, json_name: "includeUnannounced"
end
defmodule Lnrpc.ChannelGraph do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          nodes: [Lnrpc.LightningNode.t()],
          edges: [Lnrpc.ChannelEdge.t()]
        }

  defstruct nodes: [],
            edges: []

  field :nodes, 1, repeated: true, type: Lnrpc.LightningNode
  field :edges, 2, repeated: true, type: Lnrpc.ChannelEdge
end
defmodule Lnrpc.NodeMetricsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          types: [Lnrpc.NodeMetricType.t()]
        }

  defstruct types: []

  field :types, 1, repeated: true, type: Lnrpc.NodeMetricType, enum: true
end
defmodule Lnrpc.NodeMetricsResponse.BetweennessCentralityEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Lnrpc.FloatMetric.t() | nil
        }

  defstruct key: "",
            value: nil

  field :key, 1, type: :string
  field :value, 2, type: Lnrpc.FloatMetric
end
defmodule Lnrpc.NodeMetricsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          betweenness_centrality: %{String.t() => Lnrpc.FloatMetric.t() | nil}
        }

  defstruct betweenness_centrality: %{}

  field :betweenness_centrality, 1,
    repeated: true,
    type: Lnrpc.NodeMetricsResponse.BetweennessCentralityEntry,
    json_name: "betweennessCentrality",
    map: true
end
defmodule Lnrpc.FloatMetric do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: float | :infinity | :negative_infinity | :nan,
          normalized_value: float | :infinity | :negative_infinity | :nan
        }

  defstruct value: 0.0,
            normalized_value: 0.0

  field :value, 1, type: :double
  field :normalized_value, 2, type: :double, json_name: "normalizedValue"
end
defmodule Lnrpc.ChanInfoRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_id: non_neg_integer
        }

  defstruct chan_id: 0

  field :chan_id, 1, type: :uint64, json_name: "chanId", deprecated: false
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

  defstruct graph_diameter: 0,
            avg_out_degree: 0.0,
            max_out_degree: 0,
            num_nodes: 0,
            num_channels: 0,
            total_network_capacity: 0,
            avg_channel_size: 0.0,
            min_channel_size: 0,
            max_channel_size: 0,
            median_channel_size_sat: 0,
            num_zombie_chans: 0

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

  defstruct node_updates: [],
            channel_updates: [],
            closed_chans: []

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
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: Lnrpc.Feature.t() | nil
        }

  defstruct key: 0,
            value: nil

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

  defstruct addresses: [],
            identity_key: "",
            global_features: "",
            alias: "",
            color: "",
            node_addresses: [],
            features: %{}

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_id: non_neg_integer,
          chan_point: Lnrpc.ChannelPoint.t() | nil,
          capacity: integer,
          routing_policy: Lnrpc.RoutingPolicy.t() | nil,
          advertising_node: String.t(),
          connecting_node: String.t()
        }

  defstruct chan_id: 0,
            chan_point: nil,
            capacity: 0,
            routing_policy: nil,
            advertising_node: "",
            connecting_node: ""

  field :chan_id, 1, type: :uint64, json_name: "chanId", deprecated: false
  field :chan_point, 2, type: Lnrpc.ChannelPoint, json_name: "chanPoint"
  field :capacity, 3, type: :int64
  field :routing_policy, 4, type: Lnrpc.RoutingPolicy, json_name: "routingPolicy"
  field :advertising_node, 5, type: :string, json_name: "advertisingNode"
  field :connecting_node, 6, type: :string, json_name: "connectingNode"
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

  defstruct chan_id: 0,
            capacity: 0,
            closed_height: 0,
            chan_point: nil

  field :chan_id, 1, type: :uint64, json_name: "chanId", deprecated: false
  field :capacity, 2, type: :int64
  field :closed_height, 3, type: :uint32, json_name: "closedHeight"
  field :chan_point, 4, type: Lnrpc.ChannelPoint, json_name: "chanPoint"
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

  defstruct node_id: "",
            chan_id: 0,
            fee_base_msat: 0,
            fee_proportional_millionths: 0,
            cltv_expiry_delta: 0

  field :node_id, 1, type: :string, json_name: "nodeId"
  field :chan_id, 2, type: :uint64, json_name: "chanId", deprecated: false
  field :fee_base_msat, 3, type: :uint32, json_name: "feeBaseMsat"
  field :fee_proportional_millionths, 4, type: :uint32, json_name: "feeProportionalMillionths"
  field :cltv_expiry_delta, 5, type: :uint32, json_name: "cltvExpiryDelta"
end
defmodule Lnrpc.SetID do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          set_id: binary
        }

  defstruct set_id: ""

  field :set_id, 1, type: :bytes, json_name: "setId"
end
defmodule Lnrpc.RouteHint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          hop_hints: [Lnrpc.HopHint.t()]
        }

  defstruct hop_hints: []

  field :hop_hints, 1, repeated: true, type: Lnrpc.HopHint, json_name: "hopHints"
end
defmodule Lnrpc.AMPInvoiceState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          state: Lnrpc.InvoiceHTLCState.t(),
          settle_index: non_neg_integer,
          settle_time: integer,
          amt_paid_msat: integer
        }

  defstruct state: :ACCEPTED,
            settle_index: 0,
            settle_time: 0,
            amt_paid_msat: 0

  field :state, 1, type: Lnrpc.InvoiceHTLCState, enum: true
  field :settle_index, 2, type: :uint64, json_name: "settleIndex"
  field :settle_time, 3, type: :int64, json_name: "settleTime"
  field :amt_paid_msat, 5, type: :int64, json_name: "amtPaidMsat"
end
defmodule Lnrpc.Invoice.FeaturesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: Lnrpc.Feature.t() | nil
        }

  defstruct key: 0,
            value: nil

  field :key, 1, type: :uint32
  field :value, 2, type: Lnrpc.Feature
end
defmodule Lnrpc.Invoice.AmpInvoiceStateEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Lnrpc.AMPInvoiceState.t() | nil
        }

  defstruct key: "",
            value: nil

  field :key, 1, type: :string
  field :value, 2, type: Lnrpc.AMPInvoiceState
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
          payment_addr: binary,
          is_amp: boolean,
          amp_invoice_state: %{String.t() => Lnrpc.AMPInvoiceState.t() | nil}
        }

  defstruct memo: "",
            r_preimage: "",
            r_hash: "",
            value: 0,
            value_msat: 0,
            settled: false,
            creation_date: 0,
            settle_date: 0,
            payment_request: "",
            description_hash: "",
            expiry: 0,
            fallback_addr: "",
            cltv_expiry: 0,
            route_hints: [],
            private: false,
            add_index: 0,
            settle_index: 0,
            amt_paid: 0,
            amt_paid_sat: 0,
            amt_paid_msat: 0,
            state: :OPEN,
            htlcs: [],
            features: %{},
            is_keysend: false,
            payment_addr: "",
            is_amp: false,
            amp_invoice_state: %{}

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
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: binary
        }

  defstruct key: 0,
            value: ""

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

  defstruct chan_id: 0,
            htlc_index: 0,
            amt_msat: 0,
            accept_height: 0,
            accept_time: 0,
            resolve_time: 0,
            expiry_height: 0,
            state: :ACCEPTED,
            custom_records: %{},
            mpp_total_amt_msat: 0,
            amp: nil

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          root_share: binary,
          set_id: binary,
          child_index: non_neg_integer,
          hash: binary,
          preimage: binary
        }

  defstruct root_share: "",
            set_id: "",
            child_index: 0,
            hash: "",
            preimage: ""

  field :root_share, 1, type: :bytes, json_name: "rootShare"
  field :set_id, 2, type: :bytes, json_name: "setId"
  field :child_index, 3, type: :uint32, json_name: "childIndex"
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

  defstruct r_hash: "",
            payment_request: "",
            add_index: 0,
            payment_addr: ""

  field :r_hash, 1, type: :bytes, json_name: "rHash"
  field :payment_request, 2, type: :string, json_name: "paymentRequest"
  field :add_index, 16, type: :uint64, json_name: "addIndex"
  field :payment_addr, 17, type: :bytes, json_name: "paymentAddr"
end
defmodule Lnrpc.PaymentHash do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          r_hash_str: String.t(),
          r_hash: binary
        }

  defstruct r_hash_str: "",
            r_hash: ""

  field :r_hash_str, 1, type: :string, json_name: "rHashStr", deprecated: true
  field :r_hash, 2, type: :bytes, json_name: "rHash"
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

  defstruct pending_only: false,
            index_offset: 0,
            num_max_invoices: 0,
            reversed: false

  field :pending_only, 1, type: :bool, json_name: "pendingOnly"
  field :index_offset, 4, type: :uint64, json_name: "indexOffset"
  field :num_max_invoices, 5, type: :uint64, json_name: "numMaxInvoices"
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

  defstruct invoices: [],
            last_index_offset: 0,
            first_index_offset: 0

  field :invoices, 1, repeated: true, type: Lnrpc.Invoice
  field :last_index_offset, 2, type: :uint64, json_name: "lastIndexOffset"
  field :first_index_offset, 3, type: :uint64, json_name: "firstIndexOffset"
end
defmodule Lnrpc.InvoiceSubscription do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          add_index: non_neg_integer,
          settle_index: non_neg_integer
        }

  defstruct add_index: 0,
            settle_index: 0

  field :add_index, 1, type: :uint64, json_name: "addIndex"
  field :settle_index, 2, type: :uint64, json_name: "settleIndex"
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

  defstruct payment_hash: "",
            value: 0,
            creation_date: 0,
            fee: 0,
            payment_preimage: "",
            value_sat: 0,
            value_msat: 0,
            payment_request: "",
            status: :UNKNOWN,
            fee_sat: 0,
            fee_msat: 0,
            creation_time_ns: 0,
            htlcs: [],
            payment_index: 0,
            failure_reason: :FAILURE_REASON_NONE

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

  defstruct attempt_id: 0,
            status: :IN_FLIGHT,
            route: nil,
            attempt_time_ns: 0,
            resolve_time_ns: 0,
            failure: nil,
            preimage: ""

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          include_incomplete: boolean,
          index_offset: non_neg_integer,
          max_payments: non_neg_integer,
          reversed: boolean
        }

  defstruct include_incomplete: false,
            index_offset: 0,
            max_payments: 0,
            reversed: false

  field :include_incomplete, 1, type: :bool, json_name: "includeIncomplete"
  field :index_offset, 2, type: :uint64, json_name: "indexOffset"
  field :max_payments, 3, type: :uint64, json_name: "maxPayments"
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

  defstruct payments: [],
            first_index_offset: 0,
            last_index_offset: 0

  field :payments, 1, repeated: true, type: Lnrpc.Payment
  field :first_index_offset, 2, type: :uint64, json_name: "firstIndexOffset"
  field :last_index_offset, 3, type: :uint64, json_name: "lastIndexOffset"
end
defmodule Lnrpc.DeletePaymentRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          payment_hash: binary,
          failed_htlcs_only: boolean
        }

  defstruct payment_hash: "",
            failed_htlcs_only: false

  field :payment_hash, 1, type: :bytes, json_name: "paymentHash"
  field :failed_htlcs_only, 2, type: :bool, json_name: "failedHtlcsOnly"
end
defmodule Lnrpc.DeleteAllPaymentsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failed_payments_only: boolean,
          failed_htlcs_only: boolean
        }

  defstruct failed_payments_only: false,
            failed_htlcs_only: false

  field :failed_payments_only, 1, type: :bool, json_name: "failedPaymentsOnly"
  field :failed_htlcs_only, 2, type: :bool, json_name: "failedHtlcsOnly"
end
defmodule Lnrpc.DeletePaymentResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
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
          pending_funding_shim_only: boolean,
          i_know_what_i_am_doing: boolean
        }

  defstruct channel_point: nil,
            pending_funding_shim_only: false,
            i_know_what_i_am_doing: false

  field :channel_point, 1, type: Lnrpc.ChannelPoint, json_name: "channelPoint"
  field :pending_funding_shim_only, 2, type: :bool, json_name: "pendingFundingShimOnly"
  field :i_know_what_i_am_doing, 3, type: :bool, json_name: "iKnowWhatIAmDoing"
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

  defstruct show: false,
            level_spec: ""

  field :show, 1, type: :bool
  field :level_spec, 2, type: :string, json_name: "levelSpec"
end
defmodule Lnrpc.DebugLevelResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sub_systems: String.t()
        }

  defstruct sub_systems: ""

  field :sub_systems, 1, type: :string, json_name: "subSystems"
end
defmodule Lnrpc.PayReqString do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pay_req: String.t()
        }

  defstruct pay_req: ""

  field :pay_req, 1, type: :string, json_name: "payReq"
end
defmodule Lnrpc.PayReq.FeaturesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value: Lnrpc.Feature.t() | nil
        }

  defstruct key: 0,
            value: nil

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

  defstruct destination: "",
            payment_hash: "",
            num_satoshis: 0,
            timestamp: 0,
            expiry: 0,
            description: "",
            description_hash: "",
            fallback_addr: "",
            cltv_expiry: 0,
            route_hints: [],
            payment_addr: "",
            num_msat: 0,
            features: %{}

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          is_required: boolean,
          is_known: boolean
        }

  defstruct name: "",
            is_required: false,
            is_known: false

  field :name, 2, type: :string
  field :is_required, 3, type: :bool, json_name: "isRequired"
  field :is_known, 4, type: :bool, json_name: "isKnown"
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

  defstruct chan_id: 0,
            channel_point: "",
            base_fee_msat: 0,
            fee_per_mil: 0,
            fee_rate: 0.0

  field :chan_id, 5, type: :uint64, json_name: "chanId", deprecated: false
  field :channel_point, 1, type: :string, json_name: "channelPoint"
  field :base_fee_msat, 2, type: :int64, json_name: "baseFeeMsat"
  field :fee_per_mil, 3, type: :int64, json_name: "feePerMil"
  field :fee_rate, 4, type: :double, json_name: "feeRate"
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

  defstruct channel_fees: [],
            day_fee_sum: 0,
            week_fee_sum: 0,
            month_fee_sum: 0

  field :channel_fees, 1, repeated: true, type: Lnrpc.ChannelFeeReport, json_name: "channelFees"
  field :day_fee_sum, 2, type: :uint64, json_name: "dayFeeSum"
  field :week_fee_sum, 3, type: :uint64, json_name: "weekFeeSum"
  field :month_fee_sum, 4, type: :uint64, json_name: "monthFeeSum"
end
defmodule Lnrpc.PolicyUpdateRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          scope: {:global, boolean} | {:chan_point, Lnrpc.ChannelPoint.t() | nil},
          base_fee_msat: integer,
          fee_rate: float | :infinity | :negative_infinity | :nan,
          time_lock_delta: non_neg_integer,
          max_htlc_msat: non_neg_integer,
          min_htlc_msat: non_neg_integer,
          min_htlc_msat_specified: boolean
        }

  defstruct scope: nil,
            base_fee_msat: 0,
            fee_rate: 0.0,
            time_lock_delta: 0,
            max_htlc_msat: 0,
            min_htlc_msat: 0,
            min_htlc_msat_specified: false

  oneof :scope, 0

  field :global, 1, type: :bool, oneof: 0
  field :chan_point, 2, type: Lnrpc.ChannelPoint, json_name: "chanPoint", oneof: 0
  field :base_fee_msat, 3, type: :int64, json_name: "baseFeeMsat"
  field :fee_rate, 4, type: :double, json_name: "feeRate"
  field :time_lock_delta, 5, type: :uint32, json_name: "timeLockDelta"
  field :max_htlc_msat, 6, type: :uint64, json_name: "maxHtlcMsat"
  field :min_htlc_msat, 7, type: :uint64, json_name: "minHtlcMsat"
  field :min_htlc_msat_specified, 8, type: :bool, json_name: "minHtlcMsatSpecified"
end
defmodule Lnrpc.FailedUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          outpoint: Lnrpc.OutPoint.t() | nil,
          reason: Lnrpc.UpdateFailure.t(),
          update_error: String.t()
        }

  defstruct outpoint: nil,
            reason: :UPDATE_FAILURE_UNKNOWN,
            update_error: ""

  field :outpoint, 1, type: Lnrpc.OutPoint
  field :reason, 2, type: Lnrpc.UpdateFailure, enum: true
  field :update_error, 3, type: :string, json_name: "updateError"
end
defmodule Lnrpc.PolicyUpdateResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failed_updates: [Lnrpc.FailedUpdate.t()]
        }

  defstruct failed_updates: []

  field :failed_updates, 1, repeated: true, type: Lnrpc.FailedUpdate, json_name: "failedUpdates"
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

  defstruct start_time: 0,
            end_time: 0,
            index_offset: 0,
            num_max_events: 0

  field :start_time, 1, type: :uint64, json_name: "startTime"
  field :end_time, 2, type: :uint64, json_name: "endTime"
  field :index_offset, 3, type: :uint32, json_name: "indexOffset"
  field :num_max_events, 4, type: :uint32, json_name: "numMaxEvents"
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

  defstruct timestamp: 0,
            chan_id_in: 0,
            chan_id_out: 0,
            amt_in: 0,
            amt_out: 0,
            fee: 0,
            fee_msat: 0,
            amt_in_msat: 0,
            amt_out_msat: 0,
            timestamp_ns: 0

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          forwarding_events: [Lnrpc.ForwardingEvent.t()],
          last_offset_index: non_neg_integer
        }

  defstruct forwarding_events: [],
            last_offset_index: 0

  field :forwarding_events, 1,
    repeated: true,
    type: Lnrpc.ForwardingEvent,
    json_name: "forwardingEvents"

  field :last_offset_index, 2, type: :uint32, json_name: "lastOffsetIndex"
end
defmodule Lnrpc.ExportChannelBackupRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_point: Lnrpc.ChannelPoint.t() | nil
        }

  defstruct chan_point: nil

  field :chan_point, 1, type: Lnrpc.ChannelPoint, json_name: "chanPoint"
end
defmodule Lnrpc.ChannelBackup do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_point: Lnrpc.ChannelPoint.t() | nil,
          chan_backup: binary
        }

  defstruct chan_point: nil,
            chan_backup: ""

  field :chan_point, 1, type: Lnrpc.ChannelPoint, json_name: "chanPoint"
  field :chan_backup, 2, type: :bytes, json_name: "chanBackup"
end
defmodule Lnrpc.MultiChanBackup do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_points: [Lnrpc.ChannelPoint.t()],
          multi_chan_backup: binary
        }

  defstruct chan_points: [],
            multi_chan_backup: ""

  field :chan_points, 1, repeated: true, type: Lnrpc.ChannelPoint, json_name: "chanPoints"
  field :multi_chan_backup, 2, type: :bytes, json_name: "multiChanBackup"
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

  defstruct single_chan_backups: nil,
            multi_chan_backup: nil

  field :single_chan_backups, 1, type: Lnrpc.ChannelBackups, json_name: "singleChanBackups"
  field :multi_chan_backup, 2, type: Lnrpc.MultiChanBackup, json_name: "multiChanBackup"
end
defmodule Lnrpc.ChannelBackups do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_backups: [Lnrpc.ChannelBackup.t()]
        }

  defstruct chan_backups: []

  field :chan_backups, 1, repeated: true, type: Lnrpc.ChannelBackup, json_name: "chanBackups"
end
defmodule Lnrpc.RestoreChanBackupRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          backup: {:chan_backups, Lnrpc.ChannelBackups.t() | nil} | {:multi_chan_backup, binary}
        }

  defstruct backup: nil

  oneof :backup, 0

  field :chan_backups, 1, type: Lnrpc.ChannelBackups, json_name: "chanBackups", oneof: 0
  field :multi_chan_backup, 2, type: :bytes, json_name: "multiChanBackup", oneof: 0
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

  defstruct entity: "",
            action: ""

  field :entity, 1, type: :string
  field :action, 2, type: :string
end
defmodule Lnrpc.BakeMacaroonRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          permissions: [Lnrpc.MacaroonPermission.t()],
          root_key_id: non_neg_integer,
          allow_external_permissions: boolean
        }

  defstruct permissions: [],
            root_key_id: 0,
            allow_external_permissions: false

  field :permissions, 1, repeated: true, type: Lnrpc.MacaroonPermission
  field :root_key_id, 2, type: :uint64, json_name: "rootKeyId"
  field :allow_external_permissions, 3, type: :bool, json_name: "allowExternalPermissions"
end
defmodule Lnrpc.BakeMacaroonResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          macaroon: String.t()
        }

  defstruct macaroon: ""

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

  defstruct root_key_ids: []

  field :root_key_ids, 1, repeated: true, type: :uint64, json_name: "rootKeyIds"
end
defmodule Lnrpc.DeleteMacaroonIDRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          root_key_id: non_neg_integer
        }

  defstruct root_key_id: 0

  field :root_key_id, 1, type: :uint64, json_name: "rootKeyId"
end
defmodule Lnrpc.DeleteMacaroonIDResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          deleted: boolean
        }

  defstruct deleted: false

  field :deleted, 1, type: :bool
end
defmodule Lnrpc.MacaroonPermissionList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          permissions: [Lnrpc.MacaroonPermission.t()]
        }

  defstruct permissions: []

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

  defstruct key: "",
            value: nil

  field :key, 1, type: :string
  field :value, 2, type: Lnrpc.MacaroonPermissionList
end
defmodule Lnrpc.ListPermissionsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          method_permissions: %{String.t() => Lnrpc.MacaroonPermissionList.t() | nil}
        }

  defstruct method_permissions: %{}

  field :method_permissions, 1,
    repeated: true,
    type: Lnrpc.ListPermissionsResponse.MethodPermissionsEntry,
    json_name: "methodPermissions",
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

  defstruct code: :RESERVED,
            channel_update: nil,
            htlc_msat: 0,
            onion_sha_256: "",
            cltv_expiry: 0,
            flags: 0,
            failure_source_index: 0,
            height: 0

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

  defstruct signature: "",
            chain_hash: "",
            chan_id: 0,
            timestamp: 0,
            message_flags: 0,
            channel_flags: 0,
            time_lock_delta: 0,
            htlc_minimum_msat: 0,
            base_fee: 0,
            fee_rate: 0,
            htlc_maximum_msat: 0,
            extra_opaque_data: ""

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
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          nonce: binary,
          storageId: binary,
          ops: [Lnrpc.Op.t()]
        }

  defstruct nonce: "",
            storageId: "",
            ops: []

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

  defstruct entity: "",
            actions: []

  field :entity, 1, type: :string
  field :actions, 2, repeated: true, type: :string
end
defmodule Lnrpc.CheckMacPermRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          macaroon: binary,
          permissions: [Lnrpc.MacaroonPermission.t()],
          fullMethod: String.t()
        }

  defstruct macaroon: "",
            permissions: [],
            fullMethod: ""

  field :macaroon, 1, type: :bytes
  field :permissions, 2, repeated: true, type: Lnrpc.MacaroonPermission
  field :fullMethod, 3, type: :string
end
defmodule Lnrpc.CheckMacPermResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          valid: boolean
        }

  defstruct valid: false

  field :valid, 1, type: :bool
end
defmodule Lnrpc.RPCMiddlewareRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          intercept_type:
            {:stream_auth, Lnrpc.StreamAuth.t() | nil}
            | {:request, Lnrpc.RPCMessage.t() | nil}
            | {:response, Lnrpc.RPCMessage.t() | nil},
          request_id: non_neg_integer,
          raw_macaroon: binary,
          custom_caveat_condition: String.t(),
          msg_id: non_neg_integer
        }

  defstruct intercept_type: nil,
            request_id: 0,
            raw_macaroon: "",
            custom_caveat_condition: "",
            msg_id: 0

  oneof :intercept_type, 0

  field :request_id, 1, type: :uint64, json_name: "requestId"
  field :raw_macaroon, 2, type: :bytes, json_name: "rawMacaroon"
  field :custom_caveat_condition, 3, type: :string, json_name: "customCaveatCondition"
  field :stream_auth, 4, type: Lnrpc.StreamAuth, json_name: "streamAuth", oneof: 0
  field :request, 5, type: Lnrpc.RPCMessage, oneof: 0
  field :response, 6, type: Lnrpc.RPCMessage, oneof: 0
  field :msg_id, 7, type: :uint64, json_name: "msgId"
end
defmodule Lnrpc.StreamAuth do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          method_full_uri: String.t()
        }

  defstruct method_full_uri: ""

  field :method_full_uri, 1, type: :string, json_name: "methodFullUri"
end
defmodule Lnrpc.RPCMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          method_full_uri: String.t(),
          stream_rpc: boolean,
          type_name: String.t(),
          serialized: binary
        }

  defstruct method_full_uri: "",
            stream_rpc: false,
            type_name: "",
            serialized: ""

  field :method_full_uri, 1, type: :string, json_name: "methodFullUri"
  field :stream_rpc, 2, type: :bool, json_name: "streamRpc"
  field :type_name, 3, type: :string, json_name: "typeName"
  field :serialized, 4, type: :bytes
end
defmodule Lnrpc.RPCMiddlewareResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          middleware_message:
            {:register, Lnrpc.MiddlewareRegistration.t() | nil}
            | {:feedback, Lnrpc.InterceptFeedback.t() | nil},
          ref_msg_id: non_neg_integer
        }

  defstruct middleware_message: nil,
            ref_msg_id: 0

  oneof :middleware_message, 0

  field :ref_msg_id, 1, type: :uint64, json_name: "refMsgId"
  field :register, 2, type: Lnrpc.MiddlewareRegistration, oneof: 0
  field :feedback, 3, type: Lnrpc.InterceptFeedback, oneof: 0
end
defmodule Lnrpc.MiddlewareRegistration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          middleware_name: String.t(),
          custom_macaroon_caveat_name: String.t(),
          read_only_mode: boolean
        }

  defstruct middleware_name: "",
            custom_macaroon_caveat_name: "",
            read_only_mode: false

  field :middleware_name, 1, type: :string, json_name: "middlewareName"
  field :custom_macaroon_caveat_name, 2, type: :string, json_name: "customMacaroonCaveatName"
  field :read_only_mode, 3, type: :bool, json_name: "readOnlyMode"
end
defmodule Lnrpc.InterceptFeedback do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          error: String.t(),
          replace_response: boolean,
          replacement_serialized: binary
        }

  defstruct error: "",
            replace_response: false,
            replacement_serialized: ""

  field :error, 1, type: :string
  field :replace_response, 2, type: :bool, json_name: "replaceResponse"
  field :replacement_serialized, 3, type: :bytes, json_name: "replacementSerialized"
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
end

defmodule Lnrpc.Lightning.Stub do
  @moduledoc false
  use GRPC.Stub, service: Lnrpc.Lightning.Service
end
