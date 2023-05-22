defmodule LndClient.ListUtils do
  def append_if(list, condition, item) do
    if condition, do: append(list, item), else: list
  end

  def append(list, item) do
    list ++ [item]
  end

  def unique_append(list, item) do
    list
    |> append_if(!Enum.member?(list, item), item)
  end
end
