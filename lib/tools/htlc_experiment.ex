defmodule LndClient.Tools.HtlcExperiment do
  def set_local_balance_as_max_htlc_msat do
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
      policy = Map.put(policy, :output_index, Integer.parse(output_index))

      { policy, channel }
    end)
  end

  defp add_max_htlc_msat(channels_with_policies) do
    IO.inspect channels_with_policies

    channels_with_policies
    |> Enum.map(fn { policy, channel } ->
      policy = Map.put(policy, :max_htlc_msat, channel.local_balance)

      { policy, channel }
    end)
  end

  defp modify_policies(channels_with_policies) do
    channels_with_policies
    |> Enum.each(fn { policy, _channel } ->
      IO.inspect policy
      # LndClient.update_channel_policy(policy)
    end)
  end
end
