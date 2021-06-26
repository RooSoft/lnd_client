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
end
