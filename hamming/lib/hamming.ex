defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) do
    calculate_diferences(strand1, strand2, 0)
  end

  defp calculate_diferences([], [], acc) do
    {:ok, acc}
  end

  defp calculate_diferences([h1|t1], [h2|t2], acc) do
    cond do
      length(t1) != length(t2) -> {:error,  "Lists must be the same length"}
      h1 != h2 -> calculate_diferences(t1, t2, acc + 1)
      true -> calculate_diferences(t1, t2, acc)
    end
  end
end
