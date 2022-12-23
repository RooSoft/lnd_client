# LndClient ⚡

Connects to the [Lightning Network Daemon](https://github.com/lightningnetwork/lnd)'s [gRPC API](https://api.lightning.community/#lnd-grpc-api-reference) known as LND

## Donations

This library is being built in the wild according to these principles

- Free to use
- Developer friendly
- Modular

Arguably, the most important part is that it is `unbiased`.

If you want to keep it that way, and want to promote its active development, please send donations
here: `bc1qwpj2nyunrvjkj7z0unk4gg3ht26h2ysh9dqtez`

Thank you!

## Prerequisites for umbrel users

with a fresh clone of this project, run

```bash
mix deps.get
```

copy those files from the umbrel to the computer running the app

- `/home/umbrel/umbrel/lnd/tls.cert` must be copied to `~/.lnd/umbrel.cert`
- add `/home/umbrel/umbrel/lnd/data/chain/bitcoin/mainnet/readonly.macaroon` to the `~/.lnd`
- look below for the NODE environment variable that must be set when you run `iex -S mix`

## How to use as a dependency

The package can be installed by adding `lnd_client`
to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:lnd_client, "~> 0.1.7"}
  ]
end
```

## Usage
This may be used with another Elixir application or on its own using IEx.

## How to use in an app

### Add this dependency in mix.exs

```elixir
{:lnd_client, "~> 0.1"}
```

### LND config

Whenever you start a LndClient GenServer, you need to specify the credential config.

```elixir
conn_config = %LndClient.ConnConfig{
  node_uri: System.get_env("BOB_NODE"),
  cert_path: System.get_env("BOB_CERT"),
  macaroon_path: System.get_env("BOB_MACAROON")
}
```

### Start the server, get node info and then stop the server

```elixir
LndClient.start_link(%LndClient.Config{conn_config: conn_config})
LndClient.get_info
LndClient.stop
```

### Multiple LNDs
You can start multiple GenServers by passing in the name:

```elixir
LndClient.start_link(%LndClient.Config{conn_config: conn_config, name: BobLndClient})
LndClient.get_info(BobLndClient)
```

## How to use it with a Supervisor

Add this to the list of children:

```elixir
children = [
  # ...
] ++ LndClient.child_specs(%LndClient.Config{conn_config: conn_config})
```

If you're going to make more than one connection to an LND, pass in the name.

```elixir
children = [
  # ...
] ++ LndClient.child_specs(%LndClient.Config{conn_config: alice_conn_config, name: AliceLndClient}) ++ LndClient.child_specs(%LndClient.Config{conn_config: bob_conn_config, name: BobLndClient})
```

Then, somewhere else in your app:

```elixir
LndClient.add_invoice(%Lnrpc.Invoice{value_msat: 150_000}, BobLndClient)
```

## How to use with IEx

In the root of the folder, ensure that the following env vars in the example below exist:

```bash
NODE=localhost:100009
CERT=~/path/to/tls.cert
MACAROON=~/path/to/macaroon
```

Then `iex -S mix`

See if the connection was made:

```elixir
LndClient.get_info
```

You didn't need to call `start_link` because `.iex.exs` calls that for you.

## Tests

Run `mix test`

## Library Maintenance

### Get fresh protos

[List of protos](https://api.lightning.community/#lnd-grpc-api-reference)

Make sure protoc is properly installed. Here is how to do it on Debian.

```bash
sudo apt install -y protobuf-compiler
mix escript.install hex protobuf
asdf reshim
```

```bash
cd proto

curl -O https://raw.githubusercontent.com/lightningnetwork/lnd/master/lnrpc/lightning.proto
curl -O https://raw.githubusercontent.com/lightningnetwork/lnd/master/lnrpc/routerrpc/router.proto
curl -O https://raw.githubusercontent.com/lightningnetwork/lnd/master/lnrpc/invoicesrpc/invoices.proto

protoc --elixir_out=plugins=grpc:../lib/gRPC lightning.proto
protoc --elixir_out=plugins=grpc:../lib/gRPC router.proto
protoc --elixir_out=plugins=grpc:../lib/gRPC invoices.proto

cd ..
```

### HTLC examples

#### Routerrpc.ForwardEvent

```elixir
%Routerrpc.HtlcEvent{
  event: {:forward_event,
   %Routerrpc.ForwardEvent{
     info: %Routerrpc.HtlcInfo{
       incoming_amt_msat: 11005,
       incoming_timelock: 680165,
       outgoing_amt_msat: 11000,
       outgoing_timelock: 680125
     }
   }},
  event_type: :FORWARD,
  incoming_channel_id: 744146171265875972,
  incoming_htlc_id: 87,
  outgoing_channel_id: 742921315233366017,
  outgoing_htlc_id: 379,
  timestamp_ns: 1619026298906259040
}
```

#### Routerrpc.ForwardFailEvent

```elixir
%Routerrpc.HtlcEvent{
  event: {:forward_fail_event, %Routerrpc.ForwardFailEvent{}},
  event_type: :FORWARD,
  incoming_channel_id: 744146171265875972,
  incoming_htlc_id: 88,
  outgoing_channel_id: 742921315233366017,
  outgoing_htlc_id: 380,
  timestamp_ns: 1619028533664696456
}
```

#### Routerrpc.SettleEvent

```elixir
%Routerrpc.HtlcEvent{
  event: {:settle_event, %Routerrpc.SettleEvent{}},
  event_type: :RECEIVE,
  incoming_channel_id: 744146171265875972,
  incoming_htlc_id: 90,
  outgoing_channel_id: 0,
  outgoing_htlc_id: 0,
  timestamp_ns: 1619028715648844495
}
```

#### Routerrpc.LinkFailEvent

```elixir
%Routerrpc.HtlcEvent{
  event: {:link_fail_event,
   %Routerrpc.LinkFailEvent{
     failure_detail: :INVALID_KEYSEND,
     failure_string: "invalid keysend parameters",
     info: %Routerrpc.HtlcInfo{
       incoming_amt_msat: 10000,
       incoming_timelock: 680090,
       outgoing_amt_msat: 0,
       outgoing_timelock: 0
     },
     wire_failure: :INCORRECT_OR_UNKNOWN_PAYMENT_DETAILS
   }},
  event_type: :RECEIVE,
  incoming_channel_id: 744146171265875972,
  incoming_htlc_id: 89,
  outgoing_channel_id: 0,
  outgoing_htlc_id: 0,
  timestamp_ns: 1619028709202674659
}
```
