defmodule Routerrpc.FailureDetail do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :UNKNOWN
          | :NO_DETAIL
          | :ONION_DECODE
          | :LINK_NOT_ELIGIBLE
          | :ON_CHAIN_TIMEOUT
          | :HTLC_EXCEEDS_MAX
          | :INSUFFICIENT_BALANCE
          | :INCOMPLETE_FORWARD
          | :HTLC_ADD_FAILED
          | :FORWARDS_DISABLED
          | :INVOICE_CANCELED
          | :INVOICE_UNDERPAID
          | :INVOICE_EXPIRY_TOO_SOON
          | :INVOICE_NOT_OPEN
          | :MPP_INVOICE_TIMEOUT
          | :ADDRESS_MISMATCH
          | :SET_TOTAL_MISMATCH
          | :SET_TOTAL_TOO_LOW
          | :SET_OVERPAID
          | :UNKNOWN_INVOICE
          | :INVALID_KEYSEND
          | :MPP_IN_PROGRESS
          | :CIRCULAR_ROUTE

  field :UNKNOWN, 0
  field :NO_DETAIL, 1
  field :ONION_DECODE, 2
  field :LINK_NOT_ELIGIBLE, 3
  field :ON_CHAIN_TIMEOUT, 4
  field :HTLC_EXCEEDS_MAX, 5
  field :INSUFFICIENT_BALANCE, 6
  field :INCOMPLETE_FORWARD, 7
  field :HTLC_ADD_FAILED, 8
  field :FORWARDS_DISABLED, 9
  field :INVOICE_CANCELED, 10
  field :INVOICE_UNDERPAID, 11
  field :INVOICE_EXPIRY_TOO_SOON, 12
  field :INVOICE_NOT_OPEN, 13
  field :MPP_INVOICE_TIMEOUT, 14
  field :ADDRESS_MISMATCH, 15
  field :SET_TOTAL_MISMATCH, 16
  field :SET_TOTAL_TOO_LOW, 17
  field :SET_OVERPAID, 18
  field :UNKNOWN_INVOICE, 19
  field :INVALID_KEYSEND, 20
  field :MPP_IN_PROGRESS, 21
  field :CIRCULAR_ROUTE, 22
end
defmodule Routerrpc.PaymentState do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :IN_FLIGHT
          | :SUCCEEDED
          | :FAILED_TIMEOUT
          | :FAILED_NO_ROUTE
          | :FAILED_ERROR
          | :FAILED_INCORRECT_PAYMENT_DETAILS
          | :FAILED_INSUFFICIENT_BALANCE

  field :IN_FLIGHT, 0
  field :SUCCEEDED, 1
  field :FAILED_TIMEOUT, 2
  field :FAILED_NO_ROUTE, 3
  field :FAILED_ERROR, 4
  field :FAILED_INCORRECT_PAYMENT_DETAILS, 5
  field :FAILED_INSUFFICIENT_BALANCE, 6
end
defmodule Routerrpc.ResolveHoldForwardAction do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :SETTLE | :FAIL | :RESUME

  field :SETTLE, 0
  field :FAIL, 1
  field :RESUME, 2
end
defmodule Routerrpc.ChanStatusAction do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :ENABLE | :DISABLE | :AUTO

  field :ENABLE, 0
  field :DISABLE, 1
  field :AUTO, 2
end
defmodule Routerrpc.HtlcEvent.EventType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :UNKNOWN | :SEND | :RECEIVE | :FORWARD

  field :UNKNOWN, 0
  field :SEND, 1
  field :RECEIVE, 2
  field :FORWARD, 3
end
defmodule Routerrpc.SendPaymentRequest.DestCustomRecordsEntry do
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
defmodule Routerrpc.SendPaymentRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dest: binary,
          amt: integer,
          amt_msat: integer,
          payment_hash: binary,
          final_cltv_delta: integer,
          payment_addr: binary,
          payment_request: String.t(),
          timeout_seconds: integer,
          fee_limit_sat: integer,
          fee_limit_msat: integer,
          outgoing_chan_id: non_neg_integer,
          outgoing_chan_ids: [non_neg_integer],
          last_hop_pubkey: binary,
          cltv_limit: integer,
          route_hints: [Lnrpc.RouteHint.t()],
          dest_custom_records: %{non_neg_integer => binary},
          allow_self_payment: boolean,
          dest_features: [Lnrpc.FeatureBit.t()],
          max_parts: non_neg_integer,
          no_inflight_updates: boolean,
          max_shard_size_msat: non_neg_integer,
          amp: boolean
        }

  defstruct dest: "",
            amt: 0,
            amt_msat: 0,
            payment_hash: "",
            final_cltv_delta: 0,
            payment_addr: "",
            payment_request: "",
            timeout_seconds: 0,
            fee_limit_sat: 0,
            fee_limit_msat: 0,
            outgoing_chan_id: 0,
            outgoing_chan_ids: [],
            last_hop_pubkey: "",
            cltv_limit: 0,
            route_hints: [],
            dest_custom_records: %{},
            allow_self_payment: false,
            dest_features: [],
            max_parts: 0,
            no_inflight_updates: false,
            max_shard_size_msat: 0,
            amp: false

  field :dest, 1, type: :bytes
  field :amt, 2, type: :int64
  field :amt_msat, 12, type: :int64, json_name: "amtMsat"
  field :payment_hash, 3, type: :bytes, json_name: "paymentHash"
  field :final_cltv_delta, 4, type: :int32, json_name: "finalCltvDelta"
  field :payment_addr, 20, type: :bytes, json_name: "paymentAddr"
  field :payment_request, 5, type: :string, json_name: "paymentRequest"
  field :timeout_seconds, 6, type: :int32, json_name: "timeoutSeconds"
  field :fee_limit_sat, 7, type: :int64, json_name: "feeLimitSat"
  field :fee_limit_msat, 13, type: :int64, json_name: "feeLimitMsat"
  field :outgoing_chan_id, 8, type: :uint64, json_name: "outgoingChanId", deprecated: true
  field :outgoing_chan_ids, 19, repeated: true, type: :uint64, json_name: "outgoingChanIds"
  field :last_hop_pubkey, 14, type: :bytes, json_name: "lastHopPubkey"
  field :cltv_limit, 9, type: :int32, json_name: "cltvLimit"
  field :route_hints, 10, repeated: true, type: Lnrpc.RouteHint, json_name: "routeHints"

  field :dest_custom_records, 11,
    repeated: true,
    type: Routerrpc.SendPaymentRequest.DestCustomRecordsEntry,
    json_name: "destCustomRecords",
    map: true

  field :allow_self_payment, 15, type: :bool, json_name: "allowSelfPayment"

  field :dest_features, 16,
    repeated: true,
    type: Lnrpc.FeatureBit,
    json_name: "destFeatures",
    enum: true

  field :max_parts, 17, type: :uint32, json_name: "maxParts"
  field :no_inflight_updates, 18, type: :bool, json_name: "noInflightUpdates"
  field :max_shard_size_msat, 21, type: :uint64, json_name: "maxShardSizeMsat"
  field :amp, 22, type: :bool
end
defmodule Routerrpc.TrackPaymentRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          payment_hash: binary,
          no_inflight_updates: boolean
        }

  defstruct payment_hash: "",
            no_inflight_updates: false

  field :payment_hash, 1, type: :bytes, json_name: "paymentHash"
  field :no_inflight_updates, 2, type: :bool, json_name: "noInflightUpdates"
end
defmodule Routerrpc.RouteFeeRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dest: binary,
          amt_sat: integer
        }

  defstruct dest: "",
            amt_sat: 0

  field :dest, 1, type: :bytes
  field :amt_sat, 2, type: :int64, json_name: "amtSat"
end
defmodule Routerrpc.RouteFeeResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          routing_fee_msat: integer,
          time_lock_delay: integer
        }

  defstruct routing_fee_msat: 0,
            time_lock_delay: 0

  field :routing_fee_msat, 1, type: :int64, json_name: "routingFeeMsat"
  field :time_lock_delay, 2, type: :int64, json_name: "timeLockDelay"
end
defmodule Routerrpc.SendToRouteRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          payment_hash: binary,
          route: Lnrpc.Route.t() | nil
        }

  defstruct payment_hash: "",
            route: nil

  field :payment_hash, 1, type: :bytes, json_name: "paymentHash"
  field :route, 2, type: Lnrpc.Route
end
defmodule Routerrpc.SendToRouteResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          preimage: binary,
          failure: Lnrpc.Failure.t() | nil
        }

  defstruct preimage: "",
            failure: nil

  field :preimage, 1, type: :bytes
  field :failure, 2, type: Lnrpc.Failure
end
defmodule Routerrpc.ResetMissionControlRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Routerrpc.ResetMissionControlResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Routerrpc.QueryMissionControlRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Routerrpc.QueryMissionControlResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pairs: [Routerrpc.PairHistory.t()]
        }

  defstruct pairs: []

  field :pairs, 2, repeated: true, type: Routerrpc.PairHistory
end
defmodule Routerrpc.XImportMissionControlRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pairs: [Routerrpc.PairHistory.t()]
        }

  defstruct pairs: []

  field :pairs, 1, repeated: true, type: Routerrpc.PairHistory
end
defmodule Routerrpc.XImportMissionControlResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Routerrpc.PairHistory do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node_from: binary,
          node_to: binary,
          history: Routerrpc.PairData.t() | nil
        }

  defstruct node_from: "",
            node_to: "",
            history: nil

  field :node_from, 1, type: :bytes, json_name: "nodeFrom"
  field :node_to, 2, type: :bytes, json_name: "nodeTo"
  field :history, 7, type: Routerrpc.PairData
end
defmodule Routerrpc.PairData do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          fail_time: integer,
          fail_amt_sat: integer,
          fail_amt_msat: integer,
          success_time: integer,
          success_amt_sat: integer,
          success_amt_msat: integer
        }

  defstruct fail_time: 0,
            fail_amt_sat: 0,
            fail_amt_msat: 0,
            success_time: 0,
            success_amt_sat: 0,
            success_amt_msat: 0

  field :fail_time, 1, type: :int64, json_name: "failTime"
  field :fail_amt_sat, 2, type: :int64, json_name: "failAmtSat"
  field :fail_amt_msat, 4, type: :int64, json_name: "failAmtMsat"
  field :success_time, 5, type: :int64, json_name: "successTime"
  field :success_amt_sat, 6, type: :int64, json_name: "successAmtSat"
  field :success_amt_msat, 7, type: :int64, json_name: "successAmtMsat"
end
defmodule Routerrpc.GetMissionControlConfigRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Routerrpc.GetMissionControlConfigResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config: Routerrpc.MissionControlConfig.t() | nil
        }

  defstruct config: nil

  field :config, 1, type: Routerrpc.MissionControlConfig
end
defmodule Routerrpc.SetMissionControlConfigRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config: Routerrpc.MissionControlConfig.t() | nil
        }

  defstruct config: nil

  field :config, 1, type: Routerrpc.MissionControlConfig
end
defmodule Routerrpc.SetMissionControlConfigResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Routerrpc.MissionControlConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          half_life_seconds: non_neg_integer,
          hop_probability: float | :infinity | :negative_infinity | :nan,
          weight: float | :infinity | :negative_infinity | :nan,
          maximum_payment_results: non_neg_integer,
          minimum_failure_relax_interval: non_neg_integer
        }

  defstruct half_life_seconds: 0,
            hop_probability: 0.0,
            weight: 0.0,
            maximum_payment_results: 0,
            minimum_failure_relax_interval: 0

  field :half_life_seconds, 1, type: :uint64, json_name: "halfLifeSeconds"
  field :hop_probability, 2, type: :float, json_name: "hopProbability"
  field :weight, 3, type: :float
  field :maximum_payment_results, 4, type: :uint32, json_name: "maximumPaymentResults"

  field :minimum_failure_relax_interval, 5,
    type: :uint64,
    json_name: "minimumFailureRelaxInterval"
end
defmodule Routerrpc.QueryProbabilityRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          from_node: binary,
          to_node: binary,
          amt_msat: integer
        }

  defstruct from_node: "",
            to_node: "",
            amt_msat: 0

  field :from_node, 1, type: :bytes, json_name: "fromNode"
  field :to_node, 2, type: :bytes, json_name: "toNode"
  field :amt_msat, 3, type: :int64, json_name: "amtMsat"
end
defmodule Routerrpc.QueryProbabilityResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          probability: float | :infinity | :negative_infinity | :nan,
          history: Routerrpc.PairData.t() | nil
        }

  defstruct probability: 0.0,
            history: nil

  field :probability, 1, type: :double
  field :history, 2, type: Routerrpc.PairData
end
defmodule Routerrpc.BuildRouteRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          amt_msat: integer,
          final_cltv_delta: integer,
          outgoing_chan_id: non_neg_integer,
          hop_pubkeys: [binary],
          payment_addr: binary
        }

  defstruct amt_msat: 0,
            final_cltv_delta: 0,
            outgoing_chan_id: 0,
            hop_pubkeys: [],
            payment_addr: ""

  field :amt_msat, 1, type: :int64, json_name: "amtMsat"
  field :final_cltv_delta, 2, type: :int32, json_name: "finalCltvDelta"
  field :outgoing_chan_id, 3, type: :uint64, json_name: "outgoingChanId", deprecated: false
  field :hop_pubkeys, 4, repeated: true, type: :bytes, json_name: "hopPubkeys"
  field :payment_addr, 5, type: :bytes, json_name: "paymentAddr"
end
defmodule Routerrpc.BuildRouteResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          route: Lnrpc.Route.t() | nil
        }

  defstruct route: nil

  field :route, 1, type: Lnrpc.Route
end
defmodule Routerrpc.SubscribeHtlcEventsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Routerrpc.HtlcEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          event:
            {:forward_event, Routerrpc.ForwardEvent.t() | nil}
            | {:forward_fail_event, Routerrpc.ForwardFailEvent.t() | nil}
            | {:settle_event, Routerrpc.SettleEvent.t() | nil}
            | {:link_fail_event, Routerrpc.LinkFailEvent.t() | nil},
          incoming_channel_id: non_neg_integer,
          outgoing_channel_id: non_neg_integer,
          incoming_htlc_id: non_neg_integer,
          outgoing_htlc_id: non_neg_integer,
          timestamp_ns: non_neg_integer,
          event_type: Routerrpc.HtlcEvent.EventType.t()
        }

  defstruct event: nil,
            incoming_channel_id: 0,
            outgoing_channel_id: 0,
            incoming_htlc_id: 0,
            outgoing_htlc_id: 0,
            timestamp_ns: 0,
            event_type: :UNKNOWN

  oneof :event, 0

  field :incoming_channel_id, 1, type: :uint64, json_name: "incomingChannelId"
  field :outgoing_channel_id, 2, type: :uint64, json_name: "outgoingChannelId"
  field :incoming_htlc_id, 3, type: :uint64, json_name: "incomingHtlcId"
  field :outgoing_htlc_id, 4, type: :uint64, json_name: "outgoingHtlcId"
  field :timestamp_ns, 5, type: :uint64, json_name: "timestampNs"
  field :event_type, 6, type: Routerrpc.HtlcEvent.EventType, json_name: "eventType", enum: true
  field :forward_event, 7, type: Routerrpc.ForwardEvent, json_name: "forwardEvent", oneof: 0

  field :forward_fail_event, 8,
    type: Routerrpc.ForwardFailEvent,
    json_name: "forwardFailEvent",
    oneof: 0

  field :settle_event, 9, type: Routerrpc.SettleEvent, json_name: "settleEvent", oneof: 0
  field :link_fail_event, 10, type: Routerrpc.LinkFailEvent, json_name: "linkFailEvent", oneof: 0
end
defmodule Routerrpc.HtlcInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          incoming_timelock: non_neg_integer,
          outgoing_timelock: non_neg_integer,
          incoming_amt_msat: non_neg_integer,
          outgoing_amt_msat: non_neg_integer
        }

  defstruct incoming_timelock: 0,
            outgoing_timelock: 0,
            incoming_amt_msat: 0,
            outgoing_amt_msat: 0

  field :incoming_timelock, 1, type: :uint32, json_name: "incomingTimelock"
  field :outgoing_timelock, 2, type: :uint32, json_name: "outgoingTimelock"
  field :incoming_amt_msat, 3, type: :uint64, json_name: "incomingAmtMsat"
  field :outgoing_amt_msat, 4, type: :uint64, json_name: "outgoingAmtMsat"
end
defmodule Routerrpc.ForwardEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          info: Routerrpc.HtlcInfo.t() | nil
        }

  defstruct info: nil

  field :info, 1, type: Routerrpc.HtlcInfo
end
defmodule Routerrpc.ForwardFailEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Routerrpc.SettleEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          preimage: binary
        }

  defstruct preimage: ""

  field :preimage, 1, type: :bytes
end
defmodule Routerrpc.LinkFailEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          info: Routerrpc.HtlcInfo.t() | nil,
          wire_failure: Lnrpc.Failure.FailureCode.t(),
          failure_detail: Routerrpc.FailureDetail.t(),
          failure_string: String.t()
        }

  defstruct info: nil,
            wire_failure: :RESERVED,
            failure_detail: :UNKNOWN,
            failure_string: ""

  field :info, 1, type: Routerrpc.HtlcInfo
  field :wire_failure, 2, type: Lnrpc.Failure.FailureCode, json_name: "wireFailure", enum: true
  field :failure_detail, 3, type: Routerrpc.FailureDetail, json_name: "failureDetail", enum: true
  field :failure_string, 4, type: :string, json_name: "failureString"
end
defmodule Routerrpc.PaymentStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          state: Routerrpc.PaymentState.t(),
          preimage: binary,
          htlcs: [Lnrpc.HTLCAttempt.t()]
        }

  defstruct state: :IN_FLIGHT,
            preimage: "",
            htlcs: []

  field :state, 1, type: Routerrpc.PaymentState, enum: true
  field :preimage, 2, type: :bytes
  field :htlcs, 4, repeated: true, type: Lnrpc.HTLCAttempt
end
defmodule Routerrpc.CircuitKey do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_id: non_neg_integer,
          htlc_id: non_neg_integer
        }

  defstruct chan_id: 0,
            htlc_id: 0

  field :chan_id, 1, type: :uint64, json_name: "chanId"
  field :htlc_id, 2, type: :uint64, json_name: "htlcId"
end
defmodule Routerrpc.ForwardHtlcInterceptRequest.CustomRecordsEntry do
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
defmodule Routerrpc.ForwardHtlcInterceptRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          incoming_circuit_key: Routerrpc.CircuitKey.t() | nil,
          incoming_amount_msat: non_neg_integer,
          incoming_expiry: non_neg_integer,
          payment_hash: binary,
          outgoing_requested_chan_id: non_neg_integer,
          outgoing_amount_msat: non_neg_integer,
          outgoing_expiry: non_neg_integer,
          custom_records: %{non_neg_integer => binary},
          onion_blob: binary
        }

  defstruct incoming_circuit_key: nil,
            incoming_amount_msat: 0,
            incoming_expiry: 0,
            payment_hash: "",
            outgoing_requested_chan_id: 0,
            outgoing_amount_msat: 0,
            outgoing_expiry: 0,
            custom_records: %{},
            onion_blob: ""

  field :incoming_circuit_key, 1, type: Routerrpc.CircuitKey, json_name: "incomingCircuitKey"
  field :incoming_amount_msat, 5, type: :uint64, json_name: "incomingAmountMsat"
  field :incoming_expiry, 6, type: :uint32, json_name: "incomingExpiry"
  field :payment_hash, 2, type: :bytes, json_name: "paymentHash"
  field :outgoing_requested_chan_id, 7, type: :uint64, json_name: "outgoingRequestedChanId"
  field :outgoing_amount_msat, 3, type: :uint64, json_name: "outgoingAmountMsat"
  field :outgoing_expiry, 4, type: :uint32, json_name: "outgoingExpiry"

  field :custom_records, 8,
    repeated: true,
    type: Routerrpc.ForwardHtlcInterceptRequest.CustomRecordsEntry,
    json_name: "customRecords",
    map: true

  field :onion_blob, 9, type: :bytes, json_name: "onionBlob"
end
defmodule Routerrpc.ForwardHtlcInterceptResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          incoming_circuit_key: Routerrpc.CircuitKey.t() | nil,
          action: Routerrpc.ResolveHoldForwardAction.t(),
          preimage: binary
        }

  defstruct incoming_circuit_key: nil,
            action: :SETTLE,
            preimage: ""

  field :incoming_circuit_key, 1, type: Routerrpc.CircuitKey, json_name: "incomingCircuitKey"
  field :action, 2, type: Routerrpc.ResolveHoldForwardAction, enum: true
  field :preimage, 3, type: :bytes
end
defmodule Routerrpc.UpdateChanStatusRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chan_point: Lnrpc.ChannelPoint.t() | nil,
          action: Routerrpc.ChanStatusAction.t()
        }

  defstruct chan_point: nil,
            action: :ENABLE

  field :chan_point, 1, type: Lnrpc.ChannelPoint, json_name: "chanPoint"
  field :action, 2, type: Routerrpc.ChanStatusAction, enum: true
end
defmodule Routerrpc.UpdateChanStatusResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}

  defstruct []
end
defmodule Routerrpc.Router.Service do
  @moduledoc false
  use GRPC.Service, name: "routerrpc.Router"

  rpc :SendPaymentV2, Routerrpc.SendPaymentRequest, stream(Lnrpc.Payment)

  rpc :TrackPaymentV2, Routerrpc.TrackPaymentRequest, stream(Lnrpc.Payment)

  rpc :EstimateRouteFee, Routerrpc.RouteFeeRequest, Routerrpc.RouteFeeResponse

  rpc :SendToRoute, Routerrpc.SendToRouteRequest, Routerrpc.SendToRouteResponse

  rpc :SendToRouteV2, Routerrpc.SendToRouteRequest, Lnrpc.HTLCAttempt

  rpc :ResetMissionControl,
      Routerrpc.ResetMissionControlRequest,
      Routerrpc.ResetMissionControlResponse

  rpc :QueryMissionControl,
      Routerrpc.QueryMissionControlRequest,
      Routerrpc.QueryMissionControlResponse

  rpc :XImportMissionControl,
      Routerrpc.XImportMissionControlRequest,
      Routerrpc.XImportMissionControlResponse

  rpc :GetMissionControlConfig,
      Routerrpc.GetMissionControlConfigRequest,
      Routerrpc.GetMissionControlConfigResponse

  rpc :SetMissionControlConfig,
      Routerrpc.SetMissionControlConfigRequest,
      Routerrpc.SetMissionControlConfigResponse

  rpc :QueryProbability, Routerrpc.QueryProbabilityRequest, Routerrpc.QueryProbabilityResponse

  rpc :BuildRoute, Routerrpc.BuildRouteRequest, Routerrpc.BuildRouteResponse

  rpc :SubscribeHtlcEvents, Routerrpc.SubscribeHtlcEventsRequest, stream(Routerrpc.HtlcEvent)

  rpc :SendPayment, Routerrpc.SendPaymentRequest, stream(Routerrpc.PaymentStatus)

  rpc :TrackPayment, Routerrpc.TrackPaymentRequest, stream(Routerrpc.PaymentStatus)

  rpc :HtlcInterceptor,
      stream(Routerrpc.ForwardHtlcInterceptResponse),
      stream(Routerrpc.ForwardHtlcInterceptRequest)

  rpc :UpdateChanStatus, Routerrpc.UpdateChanStatusRequest, Routerrpc.UpdateChanStatusResponse
end

defmodule Routerrpc.Router.Stub do
  @moduledoc false
  use GRPC.Stub, service: Routerrpc.Router.Service
end
