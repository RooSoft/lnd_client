defmodule LndClient.ListUtils do
  def append_if(list, condition, item) do
    if condition, do: list ++ [item], else: list
  end

  def unique_append(list, item) do
    list
    |> append_if(!Enum.member?(list, item), item)
  end
end
