defmodule LndClient.Models.ListInvoiceRequest do
  defstruct pending_only: true, index_offset: 0, num_max_invoices: 20, reversed: false
end
