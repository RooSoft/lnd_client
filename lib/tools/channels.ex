defmodule LndClient.Tools.Channels do
  def get_small_channels(maximum_size \\ 2_000_000, is_active \\ true) do
    %Lnrpc.ListChannelsResponse{channels: channels} =
      LndClient.get_channels(is_active)

    channels
    |> keep_smaller_channels(maximum_size)
    |> display_names_and_capacity()
  end

  def keep_smaller_channels(channels, size_in_sats) do
    channels
    |> Enum.filter(fn channel -> channel.capacity < size_in_sats end)
  end

  def display_names_and_capacity(channels) do
    channels
    |> Enum.each(fn channel -> IO.puts("#{channel.chan_id} is #{channel.capacity} sats") end)
  end
  
  def get_stagnant_channels() do
    %Lnrpc.ListChannelsResponse{channels: channels} = LndClient.get_channels()
    channels
    |> Stream.filter(fn channel -> (channel.total_satoshis_sent == 0 || channel.total_satoshis_received == 0) end)
    |> Stream.filter(fn channel -> channel.local_balance > (channel.capacity * 0.55) end)
    |> Enum.each(fn channel -> IO.puts("#{channel.chan_id} with #{channel.local_balance} sats is stagnant") end)
  end
end
