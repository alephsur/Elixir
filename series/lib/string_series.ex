defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) when size <= 0 do
      []
  end

  def slices(s, size) do
    Enum.chunk_every(to_charlist(s), size, 1, :discard) |> Enum.map(&to_string/1)
  end
end
