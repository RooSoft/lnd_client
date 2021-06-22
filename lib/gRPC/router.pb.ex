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
  defstruct [:key, :value]

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
          dest_features: [[Lnrpc.FeatureBit.t()]],
          max_parts: non_neg_integer,
          no_inflight_updates: boolean,
          max_shard_size_msat: non_neg_integer
        }
  defstruct [
    :dest,
    :amt,
    :amt_msat,
    :payment_hash,
    :final_cltv_delta,
    :payment_addr,
    :payment_request,
    :timeout_seconds,
    :fee_limit_sat,
    :fee_limit_msat,
    :outgoing_chan_id,
    :outgoing_chan_ids,
    :last_hop_pubkey,
    :cltv_limit,
    :route_hints,
    :dest_custom_records,
    :allow_self_payment,
    :dest_features,
    :max_parts,
    :no_inflight_updates,
    :max_shard_size_msat
  ]

  field :dest, 1, type: :bytes
  field :amt, 2, type: :int64
  field :amt_msat, 12, type: :int64
  field :payment_hash, 3, type: :bytes
  field :final_cltv_delta, 4, type: :int32
  field :payment_addr, 20, type: :bytes
  field :payment_request, 5, type: :string
  field :timeout_seconds, 6, type: :int32
  field :fee_limit_sat, 7, type: :int64
  field :fee_limit_msat, 13, type: :int64
  field :outgoing_chan_id, 8, type: :uint64, deprecated: true
  field :outgoing_chan_ids, 19, repeated: true, type: :uint64
  field :last_hop_pubkey, 14, type: :bytes
  field :cltv_limit, 9, type: :int32
  field :route_hints, 10, repeated: true, type: Lnrpc.RouteHint

  field :dest_custom_records, 11,
    repeated: true,
    type: Routerrpc.SendPaymentRequest.DestCustomRecordsEntry,
    map: true

  field :allow_self_payment, 15, type: :bool
  field :dest_features, 16, repeated: true, type: Lnrpc.FeatureBit, enum: true
  field :max_parts, 17, type: :uint32
  field :no_inflight_updates, 18, type: :bool
  field :max_shard_size_msat, 21, type: :uint64
end

defmodule Routerrpc.TrackPaymentRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          payment_hash: binary,
          no_inflight_updates: boolean
        }
  defstruct [:payment_hash, :no_inflight_updates]

  field :payment_hash, 1, type: :bytes
  field :no_inflight_updates, 2, type: :bool
end

defmodule Routerrpc.RouteFeeRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dest: binary,
          amt_sat: integer
        }
  defstruct [:dest, :amt_sat]

  field :dest, 1, type: :bytes
  field :amt_sat, 2, type: :int64
end

defmodule Routerrpc.RouteFeeResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          routing_fee_msat: integer,
          time_lock_delay: integer
        }
  defstruct [:routing_fee_msat, :time_lock_delay]

  field :routing_fee_msat, 1, type: :int64
  field :time_lock_delay, 2, type: :int64
end

defmodule Routerrpc.SendToRouteRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          payment_hash: binary,
          route: Lnrpc.Route.t() | nil
        }
  defstruct [:payment_hash, :route]

  field :payment_hash, 1, type: :bytes
  field :route, 2, type: Lnrpc.Route
end

defmodule Routerrpc.SendToRouteResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          preimage: binary,
          failure: Lnrpc.Failure.t() | nil
        }
  defstruct [:preimage, :failure]

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
  defstruct [:pairs]

  field :pairs, 2, repeated: true, type: Routerrpc.PairHistory
end

defmodule Routerrpc.XImportMissionControlRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pairs: [Routerrpc.PairHistory.t()]
        }
  defstruct [:pairs]

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
  defstruct [:node_from, :node_to, :history]

  field :node_from, 1, type: :bytes
  field :node_to, 2, type: :bytes
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
  defstruct [
    :fail_time,
    :fail_amt_sat,
    :fail_amt_msat,
    :success_time,
    :success_amt_sat,
    :success_amt_msat
  ]

  field :fail_time, 1, type: :int64
  field :fail_amt_sat, 2, type: :int64
  field :fail_amt_msat, 4, type: :int64
  field :success_time, 5, type: :int64
  field :success_amt_sat, 6, type: :int64
  field :success_amt_msat, 7, type: :int64
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
  defstruct [:config]

  field :config, 1, type: Routerrpc.MissionControlConfig
end

defmodule Routerrpc.SetMissionControlConfigRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config: Routerrpc.MissionControlConfig.t() | nil
        }
  defstruct [:config]

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
  defstruct [
    :half_life_seconds,
    :hop_probability,
    :weight,
    :maximum_payment_results,
    :minimum_failure_relax_interval
  ]

  field :half_life_seconds, 1, type: :uint64
  field :hop_probability, 2, type: :float
  field :weight, 3, type: :float
  field :maximum_payment_results, 4, type: :uint32
  field :minimum_failure_relax_interval, 5, type: :uint64
end

defmodule Routerrpc.QueryProbabilityRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          from_node: binary,
          to_node: binary,
          amt_msat: integer
        }
  defstruct [:from_node, :to_node, :amt_msat]

  field :from_node, 1, type: :bytes
  field :to_node, 2, type: :bytes
  field :amt_msat, 3, type: :int64
end

defmodule Routerrpc.QueryProbabilityResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          probability: float | :infinity | :negative_infinity | :nan,
          history: Routerrpc.PairData.t() | nil
        }
  defstruct [:probability, :history]

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
  defstruct [:amt_msat, :final_cltv_delta, :outgoing_chan_id, :hop_pubkeys, :payment_addr]

  field :amt_msat, 1, type: :int64
  field :final_cltv_delta, 2, type: :int32
  field :outgoing_chan_id, 3, type: :uint64
  field :hop_pubkeys, 4, repeated: true, type: :bytes
  field :payment_addr, 5, type: :bytes
end

defmodule Routerrpc.BuildRouteResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          route: Lnrpc.Route.t() | nil
        }
  defstruct [:route]

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
          event: {atom, any},
          incoming_channel_id: non_neg_integer,
          outgoing_channel_id: non_neg_integer,
          incoming_htlc_id: non_neg_integer,
          outgoing_htlc_id: non_neg_integer,
          timestamp_ns: non_neg_integer,
          event_type: Routerrpc.HtlcEvent.EventType.t()
        }
  defstruct [
    :event,
    :incoming_channel_id,
    :outgoing_channel_id,
    :incoming_htlc_id,
    :outgoing_htlc_id,
    :timestamp_ns,
    :event_type
  ]

  oneof :event, 0
  field :incoming_channel_id, 1, type: :uint64
  field :outgoing_channel_id, 2, type: :uint64
  field :incoming_htlc_id, 3, type: :uint64
  field :outgoing_htlc_id, 4, type: :uint64
  field :timestamp_ns, 5, type: :uint64
  field :event_type, 6, type: Routerrpc.HtlcEvent.EventType, enum: true
  field :forward_event, 7, type: Routerrpc.ForwardEvent, oneof: 0
  field :forward_fail_event, 8, type: Routerrpc.ForwardFailEvent, oneof: 0
  field :settle_event, 9, type: Routerrpc.SettleEvent, oneof: 0
  field :link_fail_event, 10, type: Routerrpc.LinkFailEvent, oneof: 0
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
  defstruct [:incoming_timelock, :outgoing_timelock, :incoming_amt_msat, :outgoing_amt_msat]

  field :incoming_timelock, 1, type: :uint32
  field :outgoing_timelock, 2, type: :uint32
  field :incoming_amt_msat, 3, type: :uint64
  field :outgoing_amt_msat, 4, type: :uint64
end

defmodule Routerrpc.ForwardEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          info: Routerrpc.HtlcInfo.t() | nil
        }
  defstruct [:info]

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

  @type t :: %__MODULE__{}
  defstruct []
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
  defstruct [:info, :wire_failure, :failure_detail, :failure_string]

  field :info, 1, type: Routerrpc.HtlcInfo
  field :wire_failure, 2, type: Lnrpc.Failure.FailureCode, enum: true
  field :failure_detail, 3, type: Routerrpc.FailureDetail, enum: true
  field :failure_string, 4, type: :string
end

defmodule Routerrpc.PaymentStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          state: Routerrpc.PaymentState.t(),
          preimage: binary,
          htlcs: [Lnrpc.HTLCAttempt.t()]
        }
  defstruct [:state, :preimage, :htlcs]

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
  defstruct [:chan_id, :htlc_id]

  field :chan_id, 1, type: :uint64
  field :htlc_id, 2, type: :uint64
end

defmodule Routerrpc.ForwardHtlcInterceptRequest.CustomRecordsEntry do
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
  defstruct [
    :incoming_circuit_key,
    :incoming_amount_msat,
    :incoming_expiry,
    :payment_hash,
    :outgoing_requested_chan_id,
    :outgoing_amount_msat,
    :outgoing_expiry,
    :custom_records,
    :onion_blob
  ]

  field :incoming_circuit_key, 1, type: Routerrpc.CircuitKey
  field :incoming_amount_msat, 5, type: :uint64
  field :incoming_expiry, 6, type: :uint32
  field :payment_hash, 2, type: :bytes
  field :outgoing_requested_chan_id, 7, type: :uint64
  field :outgoing_amount_msat, 3, type: :uint64
  field :outgoing_expiry, 4, type: :uint32

  field :custom_records, 8,
    repeated: true,
    type: Routerrpc.ForwardHtlcInterceptRequest.CustomRecordsEntry,
    map: true

  field :onion_blob, 9, type: :bytes
end

defmodule Routerrpc.ForwardHtlcInterceptResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          incoming_circuit_key: Routerrpc.CircuitKey.t() | nil,
          action: Routerrpc.ResolveHoldForwardAction.t(),
          preimage: binary
        }
  defstruct [:incoming_circuit_key, :action, :preimage]

  field :incoming_circuit_key, 1, type: Routerrpc.CircuitKey
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
  defstruct [:chan_point, :action]

  field :chan_point, 1, type: Lnrpc.ChannelPoint
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
