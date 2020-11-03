defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    slice_list(s, size)
  end

  defp slice_list(_, size) when size <= 0 do
    []
  end

  defp slice_list(s, size) do
    Enum.chunk_every(to_charlist(s), size, 1, :discard) |> Enum.map(fn v-> to_string(v) end)
  end

end
