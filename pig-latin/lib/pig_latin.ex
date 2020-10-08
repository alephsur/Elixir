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
    phrase |> String.split() |> Enum.map(fn x -> translate_word(x) end) |> Enum.join(" ")
  end

  def translate_word(word) do

    charlist = to_charlist(word)

    if List.first(charlist) in [?a, ?e, ?i, ?o, ?u ] do
      changeStartVowel(word)
    else
      changeCharList(word, charlist, 0)
    end
  end

  defp changeStartVowel(phrase) do
    phrase <> "ay"
  end

  defp changeCharList(phrase, [head|tail], acc) when head in  [?x, ?y] do
    if checkNetxCharConsonant(tail) do
      phrase <> "ay"
    else
      changeCharList(phrase, tail, acc + 1)
    end
  end

  defp changeCharList(phrase, [head|_], acc) when head in  [?a, ?e, ?i, ?o, ?u ] do
    String.slice(phrase,acc,String.length(phrase)) <> String.slice(phrase,0,acc) <> "ay"
  end

  defp changeCharList(phrase, [head|tail], acc) when head in [?q] do
    if checkQchar(tail) == true do
      changeCharList(phrase, tail, acc + 2)
    else
      changeCharList(phrase, tail, acc + 1)
    end
  end

  defp changeCharList(phrase, [_head|tail], acc) do
    changeCharList(phrase, tail, acc + 1)
  end

  defp checkQchar([head|_]) when head in [?u] do
    true
  end

  defp checkQchar([_head|_]) do
    false
  end

  defp checkNetxCharConsonant([head|_]) when head not in  [?a, ?e, ?i, ?o, ?u ] do
    true
  end

  defp checkNetxCharConsonant([_head|_]) do
    false
  end

end
