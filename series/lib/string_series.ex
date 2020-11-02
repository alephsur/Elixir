defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    split(to_charlist(s), size, [])
  end

  defp split([],_,series) do
    Enum.reverse(series)
  end

  defp split([_|_], size, _) when size <= 0 do
    []
  end

  defp split([head|tail], size, series) do
    element = [head|tail] |> Enum.split(size) |> elem(0)

    if length(element) < size do
      split(tail, size,  series)
    else
      split(tail, size,  [to_string(element) | series])
    end
  end
end
