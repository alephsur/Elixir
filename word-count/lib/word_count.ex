defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.split(sentence, ~r/[^[:alnum:]-]/u, trim: true)
      |> processWordList(%{})
  end

  defp processWordList([], wordMap) do
    wordMap
  end

  defp processWordList([head|tail], wordMap) do
    processWordList(tail, Map.update(wordMap, String.downcase(head), 1, fn x -> x + 1 end ))
  end

end
