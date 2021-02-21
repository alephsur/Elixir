defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    lista = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    String.downcase(sentence)
      |> String.graphemes()
      |> Enum.uniq()
      |> Enum.filter(fn x-> Enum.member?(lista ,x) end)
      |> List.to_string()
      |> String.length()
      |> response_value()
  end

  defp response_value(value) when value == 26 do
    true
  end

  defp response_value(_) do
    false
  end
end
