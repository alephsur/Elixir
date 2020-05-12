defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    # Enum.map(strand, fn x -> x == nucleotide end)
    counter(strand, nucleotide, 0)
  end

  defp counter([head | tail], head, accumulator) do
    counter(tail, head, accumulator + 1)
  end

  defp counter([_ | tail], nucleotide, accumulator) do
    counter(tail, nucleotide, accumulator)
  end

  defp counter([], _, accumulator) do
    accumulator
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}

  Example found  in the documentation in https://hexdocs.pm/elixir/Map.html
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    Map.new(@nucleotides, fn x -> {x, count(strand, x)} end)
  end
end
