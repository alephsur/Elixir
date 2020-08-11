defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    filterKeep(list, fun, [])
  end

  defp filterKeep([], _fun, acc) do
    Enum.reverse(acc)
  end

  defp filterKeep([head|tail], fun, acc) do
    if fun.(head) do
      filterKeep(tail, fun,  [head|acc])
    else
      filterKeep(tail, fun, acc)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    filterDiscard(list, fun, list)
  end

  defp filterDiscard([], _fun, acc) do
    acc
  end

  defp filterDiscard([head|tail], fun, acc) do
    if fun.(head) do
      filterDiscard(tail, fun,  acc -- [head])
    else
      filterDiscard(tail, fun, acc)
    end
  end
end
