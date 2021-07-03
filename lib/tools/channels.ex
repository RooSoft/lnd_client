defmodule LndClient.Tools.Channels do

  def get_small_channels(maximum_size \\ 4_499_000, is_active \\ true) do
    %Lnrpc.ListChannelsResponse{channels: channels} = LndClient.get_channels(is_active)
    channels
    |> Stream.filter(fn channel -> channel.capacity < maximum_size end)
    |> Enum.each(&print_small_channels/1)
  end

  defp print_small_channels(channel) do
    %Lnrpc.NodeInfo{ node: %Lnrpc.LightningNode{ alias: node_alias } } = LndClient.get_node_info(channel.remote_pubkey)
    IO.puts "#{node_alias} has only a #{channel.capacity} sat capacity"
  end

  def keep_smaller_channels(channels, size_in_sats) do
    channels
    |> Enum.filter(fn channel -> channel.capacity < size_in_sats end)
  end

  def display_names_and_capacity() do
    %Lnrpc.ListChannelsResponse{channels: channels} = LndClient.get_channels()
    channels
    |> Enum.each(&print_names_and_capacity/1)
  end

  defp print_names_and_capacity(channel) do
    %Lnrpc.NodeInfo{ node: %Lnrpc.LightningNode{ alias: node_alias } } = LndClient.get_node_info(channel.remote_pubkey)
    IO.puts("#{node_alias} Capacity:#{channel.capacity}, LocalBalance:#{channel.local_balance}")
  end

  def get_stagnant_channels() do
    %Lnrpc.ListChannelsResponse{channels: channels} = LndClient.get_channels()
    channels
    |> Stream.filter(fn channel -> (channel.total_satoshis_sent == 0 || channel.total_satoshis_received == 0) end)
    |> Stream.filter(fn channel -> channel.local_balance > (channel.capacity * 0.45) end)
    |> Enum.each(&print_stagnant_channel/1)
  end

  defp print_stagnant_channel(channel) do
    %Lnrpc.NodeInfo{ node: %Lnrpc.LightningNode{ alias: node_alias } } = LndClient.get_node_info(channel.remote_pubkey)
    IO.puts("#{node_alias} with #{channel.local_balance} sats is stagnant")
  end

  def get_inactive_channels() do
    %Lnrpc.ListChannelsResponse{ channels: channels } = LndClient.get_channels()
    channels
    |> Stream.filter(fn channel -> channel.active == :false end)
    |> Stream.filter(fn channel -> channel.local_balance != 0 end)
    |> Enum.each(&print_inactive_channels/1)
  end

  defp print_inactive_channels(channel) do
    %Lnrpc.NodeInfo{ node: %Lnrpc.LightningNode{ alias: node_alias } } = LndClient.get_node_info(channel.remote_pubkey)
    IO.puts("#{node_alias} with #{channel.local_balance} sats is inactive")
  end
end
