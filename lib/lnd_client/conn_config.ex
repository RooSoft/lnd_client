defmodule LndClient.ConnConfig do
  defstruct [:node_uri, :cert_path, :macaroon_path]

  @type t :: %__MODULE__{}
end
