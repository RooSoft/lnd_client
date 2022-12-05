defmodule LndClient do
  require Logger

  alias LndClient.{
    ConnConfig
  }

  alias LndClient.Models.{
    OpenChannelRequest,
    ListInvoiceRequest,
    ListPaymentsRequest
  }

  alias Lnrpc.{
    Invoice,
    SendRequest,
    NodeInfoRequest
  }

  @long_timeout 500_000
  @server LndClient.Server

  def start(%ConnConfig{} = conn_config, name \\ @server) do
    GenServer.start(@server, init_state(conn_config), name: name)
  end

  def child_spec(opts) do
    conn_config = opts[:conn_config]
    name = opts[:name] || @server

    %{
      id: name,
      start: {__MODULE__, :start_link, [conn_config, name]}
    }
  end

  @doc """
  Starts a process which connects to an LND instance.

  ## Examples

      iex> {:ok, pid} = %LndClient.Config.new{
        node_uri: "127.0.0.1:10001",
        cert_path: "/path/to/tls.cert",
        macaroon_path: "/path/to/readonly.macaroon"
      } |> LndClient.start_link()

  You may pass something like the following to a Supervisor:

  ```ex
  {
    LndClient,
    %LndClient.ConnConfig{
      node_uri: System.get_env("NODE_URI"),
      cert_path: System.get_env("CERT_PATH"),
      macaroon_path: System.get_env("MACAROON_PATH")
    },
  },
  ```
  """
  def start_link(%ConnConfig{} = conn_config, name \\ @server) do
    GenServer.start_link(@server, init_state(conn_config), name: name)
  end

  def stop(reason \\ :normal, timeout \\ :infinity) do
    GenServer.stop(@server, reason, timeout)
  end

  def subscribe_uptime(%{pid: pid}) do
    GenServer.call(@server, {:subscribe_uptime, %{pid: pid}})
  end

  def get_info(name \\ @server) do
    GenServer.call(name, :get_info)
  end

  def get_fee_report(name \\ @server) do
    GenServer.call(name, :get_fee_report)
  end

  def get_network_info(name \\ @server) do
    GenServer.call(name, :get_network_info)
  end

  def describe_graph(name \\ @server) do
    GenServer.call(name, :describe_graph, @long_timeout)
  end

  def subscribe_htlc_events(%{pid: pid}, name \\ @server) do
    GenServer.call(name, {:subscribe_htlc_events, %{pid: pid}})
  end

  def subscribe_channel_graph(pid, name \\ @server) do
    GenServer.call(name, {:subscribe_channel_graph, %{pid: pid}})
  end

  def subscribe_channel_event(%{pid: pid}, name \\ @server) do
    GenServer.call(name, {:subscribe_channel_event, %{pid: pid}})
  end

  def subscribe_invoices(%{pid: pid}, name \\ @server) do
    GenServer.call(name, {:subscribe_invoices, %{pid: pid}})
  end

  def get_node_info(%NodeInfoRequest{} = node_info_request, name \\ @server) do
    GenServer.call(name, {:get_node_info, node_info_request})
  end

  def get_channels(active_only \\ false, name \\ @server) do
    GenServer.call(name, {:get_channels, %{active_only: active_only}})
  end

  def get_closed_channels(name \\ @server) do
    GenServer.call(name, {:get_closed_channels, %{}})
  end

  def get_channel(id, name \\ @server) do
    GenServer.call(name, {:get_channel, %{id: id}})
  end

  def open_channel(%OpenChannelRequest{} = request, name \\ @server) do
    GenServer.call(name, {:open_channel, request})
  end

  def get_invoices(%ListInvoiceRequest{} = request \\ %ListInvoiceRequest{}, name \\ @server) do
    GenServer.call(name, {:list_invoices, request})
  end

  def get_payments(%ListPaymentsRequest{} = request \\ %ListPaymentsRequest{}, name \\ @server) do
    GenServer.call(name, {:list_payments, request})
  end

  @doc """
  Takes an %Lnrpc.Invoice and adds that to LND.

  ## Examples

      iex> Lnrpc.Invoice.new(value_msat: 100_000) |> LndClient.add_invoice
      {:ok, %Lnrpc.AddInvoiceResponse{}}

  """
  def add_invoice(%Invoice{} = invoice, name \\ @server) do
    GenServer.call(name, {:add_invoice, invoice})
  end

  @doc """
  Takes a %Lnrpc.SendRequest and attempts to pay the invoice

  ## Examples

      iex> Lnrpc.SendRequest.new(payment_request: "lnbcrt500paymentrequest") |> LndClient.send_payment_sync
      { :ok, %Lnrpc.SendResponse{} }

  """
  def send_payment_sync(%SendRequest{} = send_request, name \\ @server) do
    GenServer.call(name, {:send_payment_sync, send_request})
  end

  def close_channel(
        %{
          txid: txid,
          output_index: output_index,
          force: force,
          target_conf: target_conf,
          sat_per_vbyte: sat_per_vbyte
        },
        name \\ @server
      ) do
    GenServer.call(name, {
      :close_channel,
      %{
        txid: txid,
        output_index: output_index,
        force: force,
        target_conf: target_conf,
        sat_per_vbyte: sat_per_vbyte
      }
    })
  end

  def get_node_balance(name \\ @server) do
    GenServer.call(name, :get_node_balance)
  end

  def get_wallet_balance(name \\ @server) do
    GenServer.call(name, :get_wallet_balance)
  end

  @forwarding_history_defaults %{max_events: 100, offset: 0, start_time: nil, end_time: nil}
  def get_forwarding_history(parameters \\ [], name \\ @server) do
    parameter_map = Enum.into(parameters, @forwarding_history_defaults)

    GenServer.call(name, {:get_forwarding_history, parameter_map})
  end

  @doc """
  Takes a payment request string and returns decoded version (Lnrpc.PayReq)

  ## Examples

      iex> LndClient.decode_payment_request("lnbcrt500u1p3hmq4gpp5sa2s5ue4f750pxrr9s6zdrydyqf8pz502678czpqj3s0kj36m58qdqqcqzpgxqyz5vqsp52ecznqzf65tjtw2h2ld8kqut92p5ajuf47y5y926z5d2w3w0s0hq9qyyssqss0qrg2xu8yeqvrs9vykw4m56739vlqxuztzr3wrdpm350n5k8djmkrcascl33vt74m5k2fxcam6emqa0a76navtyaj9myp9ry5dshgp6mzn02")
      {:ok,
        %Lnrpc.PayReq{
         destination: "02355b24c2dcf043eef225af8a2192d8e76a03e836a559bf81f30a711591ec560a",
         payment_hash: "87550a73354fa8f098632c34268c8d2012708a8f56bc7c08209460fb4a3add0e",
         num_satoshis: 50000,
         timestamp: 1669169832,
         expiry: 86400,
         description: "",
         description_hash: "",
         fallback_addr: "",
         cltv_expiry: 40,
         route_hints: [],
         payment_addr: <<86, 112, 41, 128, 73, 213, 23, 37, 185, 87, 87, 218, 123, 3,
           139, 42, 131, 78, 203, 137, 175, 137, 66, 21, 90, 21, 26, 167, 69, 207,
           131, 238>>,
         num_msat: 50000000,
         features: %{
           9 => %Lnrpc.Feature{
             name: "tlv-onion",
             is_required: false,
             is_known: true,
             __unknown_fields__: []
           },
           14 => %Lnrpc.Feature{
             name: "payment-addr",
             is_required: true,
             is_known: true,
             __unknown_fields__: []
           },
           17 => %Lnrpc.Feature{
             name: "multi-path-payments",
             is_required: false,
             is_known: true,
             __unknown_fields__: []
           }
         },
         __unknown_fields__: []
        }}

  """
  def decode_payment_request(payment_request, name \\ @server) do
    GenServer.call(name, {:decode_payment_request, payment_request})
  end

  def update_channel_policy(
        %{
          txid: txid,
          output_index: output_index,
          base_fee_msat: base_fee_msat,
          fee_rate: fee_rate,
          time_lock_delta: time_lock_delta,
          max_htlc_msat: max_htlc_msat
        },
        name \\ @server
      ) do
    GenServer.call(name, {
      :update_channel_policy,
      %{
        txid: txid,
        output_index: output_index,
        base_fee_msat: base_fee_msat,
        fee_rate: fee_rate,
        time_lock_delta: time_lock_delta,
        max_htlc_msat: max_htlc_msat
      }
    })
  end

  defp init_state(conn_config) do
    %{
      subscriptions: %{},
      conn_config: conn_config
    }
  end
end
