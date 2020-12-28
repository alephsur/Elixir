defmodule Scrabble do
  @scrabel_values %{
    "A" => 1,
    "E" => 1,
    "I" => 1,
    "O" => 1,
    "U" => 1,
    "L" => 1,
    "N" => 1,
    "R" => 1,
    "S" => 1,
    "T" => 1,
    "D" => 2,
    "G" => 2,
    "B" => 3,
    "C" => 3,
    "M" => 3,
    "P" => 3,
    "F" => 4,
    "H" => 4,
    "V" => 4,
    "W" => 4,
    "Y" => 4,
    "K" => 5,
    "J" => 8,
    "X" => 8,
    "Q" => 10,
    "Z" => 10
  }

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    get_characters_list(word) |> get_characters_mapped_values(0)
  end

  defp get_characters_list(word) do
    word |> String.upcase() |> String.split("")
  end

  defp get_characters_mapped_values([], acc) do
    acc
  end

  defp get_characters_mapped_values([head|tail], acc) do

    get_characters_mapped_values(tail, acc + get_value_char(head))

  end

  defp get_value_char(char) do

    Map.fetch(@scrabel_values, char) |> get_value_from_map()

  end

  defp get_value_from_map(mapped_value) when mapped_value == :error do
    0
  end

  defp get_value_from_map(mapped_value) do

    elem(mapped_value,1)

  end

end
