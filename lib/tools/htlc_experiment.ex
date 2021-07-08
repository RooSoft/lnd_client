defmodule LndClient.Tools.HtlcExperiment do
  def set_max_htlc_msat_to_local_balance do
    LndClient.get_channels.channels
    |> add_empty_policies
    |> extract_channel_points
    |> extract_txid_and_output_index
    |> add_max_htlc_msat
    |> modify_policies
  end

  defp add_empty_policies(channels) do
    channels
    |> Enum.map(fn channel -> { %{}, channel } end)
  end

  defp extract_channel_points(channels_with_policies) do
    channels_with_policies
    |> Enum.map(fn { policy, channel } ->
      policy = policy
      |> Map.put(:channel_point, channel.channel_point)

      { policy, channel }
    end)
  end

  defp extract_txid_and_output_index(channels_with_policies) do
    channels_with_policies
    |> Enum.map(fn { policy, channel } ->
      [txid | [output_index | []]] = String.split(policy.channel_point, ":")
      policy = Map.put(policy, :txid, txid)
      policy = Map.put(policy, :output_index, String.to_integer(output_index))

      { policy, channel }
    end)
  end

  defp add_max_htlc_msat(channels_with_policies) do
    channels_with_policies
    |> Enum.map(fn { policy, channel } ->
      policy = Map.put(policy, :max_htlc_msat, channel.local_balance)

      { policy, channel }
    end)
  end

  defp modify_policies(channels_with_policies) do
    channels_with_policies
    |> Enum.each(fn { policy, _channel } ->
      LndClient.update_channel_policy(%{
        txid: policy.txid,
        output_index: policy.output_index,
        base_fee_msat: 900,
        fee_rate: 0.00025,
        time_lock_delta: 18,
        max_htlc_msat: (policy.max_htlc_msat * 1000)
        })
    end)
  end

  def restore_max_htlc_msat_to_capacity do
    LndClient.get_channels.channels
    |> add_empty_policies
    |> extract_channel_points
    |> extract_txid_and_output_index
    |> set_max_htlc_to_capacity
    |> add_local_reserve
    |> restore_policies
  end

  defp set_max_htlc_to_capacity(channels_with_policies) do
    channels_with_policies
    |> Enum.map(fn { policy, channel } ->
      policy = Map.put(policy, :capacity, channel.capacity)
      { policy, channel }
    end)
  end

  defp add_local_reserve(channels_with_policies) do
    channels_with_policies
    |> Enum.map(fn { policy, channel } ->
      policy = Map.put(policy, :local_reserve, channel.local_chan_reserve_sat)
      { policy, channel }
    end)
  end

  defp restore_policies(channels_with_policies) do
    channels_with_policies
    |> Enum.each(fn { policy, channel } ->
      LndClient.update_channel_policy(%{
        txid: policy.txid,
        output_index: policy.output_index,
        base_fee_msat: 250,
        fee_rate: 0.00025,
        time_lock_delta: 18,
        max_htlc_msat: ((policy.capacity - policy.local_reserve) * 1000)
        })
        IO.inspect policy
    end)
  end
end
