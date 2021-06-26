# LndClient

Connects to the Lightning Network Daemon known as LND

## Prerequisites for umbrel users

with a fresh clone of this project, run 

```bash
mix deps.get
```

copy those files from the umbrel to the computer running the app

- `/home/umbrel/umbrel/lnd/tls.cert` must be copied to `~/.lnd/umbrel.cert`
- add `/home/umbrel/umbrel/lnd/data/chain/bitcoin/mainnet/readonly.macaroon` to the `~/.lnd`
- look below for the SERVER environment variable that must be set when you run `iex -S mix`

## How to use with IEx

Connect to a LND node directly from IEx

Execute this in the root folder if your LND listens on the `localhost` port `10009`

Otherwise, replace UMBRE_IP and UMBREL_LND_PORT to fit your environment

```bash
UMBREL_IP=localhost
UMBREL_LND_PORT=10009
SERVER=$UMBREL_IP:$UMBREL_LND_PORT iex -S mix
```

Then, it is possible to get the LND's basic informations by typing

```elixir
LndClient.get_info
```

## How to use in an app

### Add this dependency in mix.exs

```elixir
{:lnd_client, git: "https://git.roosoft.com/bitcoin/lightning/lnd_client.git", tag: "0.1.1"}
```

### Start the server, get node info and then stop the server

```elixir
LndClient.start_link(nil)
LndClient.get_info
LndClient.stop
```

## Library Maintenance

### Get fresh protos

[List of protos](https://api.lightning.community/#lnd-grpc-api-reference)

```bash
cd proto

curl -o rpc.proto -s https://raw.githubusercontent.com/lightningnetwork/lnd/master/lnrpc/rpc.proto
curl -O https://raw.githubusercontent.com/lightningnetwork/lnd/master/lnrpc/routerrpc/router.proto

protoc --elixir_out=plugins=grpc:../lib/gRPC rpc.proto
protoc --elixir_out=plugins=grpc:../lib/gRPC router.proto

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
