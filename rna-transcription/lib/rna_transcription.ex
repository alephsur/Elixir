defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    change_char = fn(nucleotide)->
        case nucleotide do
          ?A -> ?U
          ?T -> ?A
          ?G -> ?C
          ?C -> ?G
        end
    end

    Enum.map(dna, change_char);
  end
end
