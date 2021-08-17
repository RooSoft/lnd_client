defmodule LndClient.Models.ListPaymentsRequest do
  defstruct [include_incomplete: true, index_offset: 0, max_payments: 20, reversed: false]
end
