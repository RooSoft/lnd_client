defmodule LndClient.Tools.Channels do

  def get_small_channels(maximum_size \\ 3_999_000, is_active \\ true) do
    LndClient.get_channels.channels
    |> Stream.filter(fn channel -> channel.capacity < maximum_size end)
    |> Enum.each(&print_small_channels/1)
  end

  defp print_small_channels(channel) do
    %Lnrpc.NodeInfo{ node: %Lnrpc.LightningNode{ alias: node_alias } } = LndClient.get_node_info(channel.remote_pubkey)
    IO.puts "#{node_alias} has only a #{channel.capacity} sat capacity"
  end

  def get_large_channels(minimum_size \\ 10_000_000, is_active \\ true) do
    LndClient.get_channels.channels
    |> Stream.filter(fn channel -> channel.capacity > minimum_size end)
    |> Enum.each(&print_large_channels/1)
  end

  defp print_large_channels(channel) do
    %Lnrpc.NodeInfo{ node: %Lnrpc.LightningNode{ alias: node_alias } } = LndClient.get_node_info(channel.remote_pubkey)
    IO.puts "#{node_alias} has a #{channel.capacity} sat capacity"
  end

  def keep_smaller_channels(channels, size_in_sats) do
    channels
    |> Enum.filter(fn channel -> channel.capacity < size_in_sats end)
  end

  def display_names_and_capacity() do
    LndClient.get_channels.channels
    |> Enum.each(&print_names_and_capacity/1)
  end

  defp print_names_and_capacity(channel) do
    %Lnrpc.NodeInfo{ node: %Lnrpc.LightningNode{ alias: node_alias } } = LndClient.get_node_info(channel.remote_pubkey)
    IO.puts "#{node_alias} Capacity:#{channel.capacity}, LocalBalance:#{channel.local_balance}"
  end

  def get_stagnant_channels() do
    LndClient.get_channels.channels
    |> Stream.filter(fn channel -> (channel.total_satoshis_sent < 2000 || channel.total_satoshis_received < 2000) end)
    |> Stream.filter(fn channel -> channel.local_balance > (channel.capacity * 0.45) end)
    |> Enum.each(&print_stagnant_channel/1)
  end

  defp print_stagnant_channel(channel) do
    %Lnrpc.NodeInfo{ node: %Lnrpc.LightningNode{ alias: node_alias } } = LndClient.get_node_info(channel.remote_pubkey)
    IO.puts "#{node_alias} with #{channel.local_balance} sats is stagnant"
  end

  def get_inactive_channels() do
    LndClient.get_channels.channels
    |> Stream.filter(fn channel -> channel.active == :false end)
    |> Stream.filter(fn channel -> channel.local_balance != 0 end)
    |> Enum.each(&print_inactive_channels/1)
  end

  defp print_inactive_channels(channel) do
    %Lnrpc.NodeInfo{ node: %Lnrpc.LightningNode{ alias: node_alias } } = LndClient.get_node_info(channel.remote_pubkey)
    IO.puts "#{node_alias} with #{channel.local_balance} sats is inactive"
  end

  def get_poor_channels() do
    LndClient.get_channels.channels
    |> Stream.filter(fn channel -> (channel.total_satoshis_sent < 2000 || channel.total_satoshis_received < 2000) end)
    |> Stream.filter(fn channel -> channel.capacity < 3_900_000 end)
    |> Stream.filter(fn channel -> channel.local_balance > (channel.capacity * 0.45) end)
    |> Enum.each(&print_poor_channels/1)
  end

  defp print_poor_channels(channel) do
    %Lnrpc.NodeInfo{ node: %Lnrpc.LightningNode{ alias: node_alias } } = LndClient.get_node_info(channel.remote_pubkey)
    IO.puts "#{node_alias} is only #{channel.capacity} sats and is stagnant"
  end

  def update_channel_policy(max_htlc_msat, base_fee_msat, fee_rate, output_index, csv_delay, txid) do
    LndClient.update_channel_policy(%{
      max_htlc_msat: max_htlc_msat,
      base_fee_msat: base_fee_msat,
      fee_rate: fee_rate,
      output_index: output_index,
      time_lock_delta: csv_delay,
      txid: txid
      })
  end
end
