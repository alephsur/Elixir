defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
      match_list(base, candidates, [])
  end

  defp match_list(_, [], anagrams) do
    anagrams
  end

  defp match_list(base, [head|tail], anagrams) do
    cond do
      String.upcase(base) |> String.graphemes() == String.upcase(head) |> String.graphemes() -> match_list(base, tail, anagrams)

      check_chars(
          String.upcase(base) |> String.graphemes(),
          String.upcase(head) |> String.graphemes()
        ) == true -> match_list(base, tail, anagrams ++ [head])

      true -> match_list(base, tail, anagrams)
    end
  end

  defp  check_chars([], []) do true end

  defp  check_chars(_, []) do false end

  defp check_chars(base_chars, [head|tail]) do
    cond do
      Enum.find(base_chars, fn x -> x == head end) == nil -> false
      true -> check_chars(base_chars -- [head], tail)
    end
  end

end
