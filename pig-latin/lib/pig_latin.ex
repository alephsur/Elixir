defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()

  def translate(phrase) do
    phrase
      |> String.split()
      |> Enum.map_join(" ",&translate_word/1)
  end

  defp translate_word(word) do

    charlist = to_charlist(word)

    if List.first(charlist) in [?a, ?e, ?i, ?o, ?u ] do
      change_start_vowel(word)
    else
      change_char_list(word, charlist, 0)
    end
  end

  defp change_start_vowel(phrase) do
    phrase <> "ay"
  end

  defp change_char_list(phrase, [head|tail], acc) when head in  [?x, ?y] do
    cond do
      check_netx_char_consonant_char(tail) and acc == 0 -> phrase <> "ay"
      check_netx_char_consonant_char(tail) == false -> change_char_list(phrase, tail, acc + 1)
      head == ?y -> String.slice(phrase,acc,String.length(phrase)) <> String.slice(phrase,0,acc) <> "ay"
    end
  end


  defp change_char_list(phrase, [head|_], acc) when head in  [?a, ?e, ?i, ?o, ?u, ?y ] do
    String.slice(phrase,acc,String.length(phrase)) <> String.slice(phrase,0,acc) <> "ay"
  end

  defp change_char_list(phrase, [?q|tail], acc) do
    if check_q_char(tail) == true do
      change_char_list(phrase, tail, acc + 2)
    else
      change_char_list(phrase, tail, acc + 1)
    end
  end

  defp change_char_list(phrase, [_head|tail], acc) do
    change_char_list(phrase, tail, acc + 1)
  end

  defp check_q_char([?u|_]) do
    true
  end

  defp check_q_char([_head|_]) do
    false
  end

  defp check_netx_char_consonant_char([head|_]) when head not in  [?a, ?e, ?i, ?o, ?u ] do
    true
  end

  defp check_netx_char_consonant_char([_head|_]) do
    false
  end

  defp check_netx_char_consonant_char([]) do
    true
  end
end
