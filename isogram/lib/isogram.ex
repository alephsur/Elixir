defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do

    list_chars = clean_list_chars(sentence) |> List.to_string()
    list_unique_chars = clean_list_chars(sentence) |> Enum.uniq() |> List.to_string()

    check_len_string(String.length(list_chars), String.length(list_unique_chars))

  end

  defp clean_list_chars(word) do
    String.downcase(word)
    |> String.graphemes()
    |> Enum.filter(fn x -> !Enum.member?(["-"," "], x) end)
  end

  defp check_len_string(string1_len, string2_len) when string1_len == string2_len do
    true
  end

  defp check_len_string(string1, string2) do
    false
  end
end
