defmodule LndClient.Tools.CommonPeers do
  @spec intersect(any, any) :: list
  def intersect(node1_pub_key, node2_pub_key) do
    node1_node_ids = node1_pub_key |> get_node_peer_ids
    node2_node_ids = node2_pub_key |> get_node_peer_ids

    node1_node_ids -- node1_node_ids -- node2_node_ids
  end

  defp get_node_peer_ids(pub_key) do
    {:ok, %Lnrpc.NodeInfo{channels: channels}} =
      %Lnrpc.NodeInfoRequest{pub_key: pub_key, include_channels: true}
      |> LndClient.get_node_info()

    channels
    |> Enum.map(fn channel ->
      get_peer_pub_key(channel, pub_key)
    end)
  end

  defp get_peer_pub_key(%{node1_pub: local_pub_key} = channel, local_pub_key) do
    channel.node2_pub
  end

  defp get_peer_pub_key(%{node2_pub: local_pub_key} = channel, local_pub_key) do
    channel.node1_pub
  end
end
