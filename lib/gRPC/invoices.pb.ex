defmodule Invoicesrpc.LookupModifier do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :DEFAULT, 0
  field :HTLC_SET_ONLY, 1
  field :HTLC_SET_BLANK, 2
end

defmodule Invoicesrpc.CancelInvoiceMsg do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :payment_hash, 1, type: :bytes, json_name: "paymentHash"
end

defmodule Invoicesrpc.CancelInvoiceResp do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Invoicesrpc.AddHoldInvoiceRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :memo, 1, type: :string
  field :hash, 2, type: :bytes
  field :value, 3, type: :int64
  field :value_msat, 10, type: :int64, json_name: "valueMsat"
  field :description_hash, 4, type: :bytes, json_name: "descriptionHash"
  field :expiry, 5, type: :int64
  field :fallback_addr, 6, type: :string, json_name: "fallbackAddr"
  field :cltv_expiry, 7, type: :uint64, json_name: "cltvExpiry"
  field :route_hints, 8, repeated: true, type: Lnrpc.RouteHint, json_name: "routeHints"
  field :private, 9, type: :bool
end

defmodule Invoicesrpc.AddHoldInvoiceResp do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :payment_request, 1, type: :string, json_name: "paymentRequest"
  field :add_index, 2, type: :uint64, json_name: "addIndex"
  field :payment_addr, 3, type: :bytes, json_name: "paymentAddr"
end

defmodule Invoicesrpc.SettleInvoiceMsg do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :preimage, 1, type: :bytes
end

defmodule Invoicesrpc.SettleInvoiceResp do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Invoicesrpc.SubscribeSingleInvoiceRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :r_hash, 2, type: :bytes, json_name: "rHash"
end

defmodule Invoicesrpc.LookupInvoiceMsg do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :invoice_ref, 0

  field :payment_hash, 1, type: :bytes, json_name: "paymentHash", oneof: 0
  field :payment_addr, 2, type: :bytes, json_name: "paymentAddr", oneof: 0
  field :set_id, 3, type: :bytes, json_name: "setId", oneof: 0

  field :lookup_modifier, 4,
    type: Invoicesrpc.LookupModifier,
    json_name: "lookupModifier",
    enum: true
end

defmodule Invoicesrpc.Invoices.Service do
  @moduledoc false
  use GRPC.Service, name: "invoicesrpc.Invoices", protoc_gen_elixir_version: "0.11.0"

  rpc :SubscribeSingleInvoice, Invoicesrpc.SubscribeSingleInvoiceRequest, stream(Lnrpc.Invoice)

  rpc :CancelInvoice, Invoicesrpc.CancelInvoiceMsg, Invoicesrpc.CancelInvoiceResp

  rpc :AddHoldInvoice, Invoicesrpc.AddHoldInvoiceRequest, Invoicesrpc.AddHoldInvoiceResp

  rpc :SettleInvoice, Invoicesrpc.SettleInvoiceMsg, Invoicesrpc.SettleInvoiceResp

  rpc :LookupInvoiceV2, Invoicesrpc.LookupInvoiceMsg, Lnrpc.Invoice
end

defmodule Invoicesrpc.Invoices.Stub do
  @moduledoc false
  use GRPC.Stub, service: Invoicesrpc.Invoices.Service
end