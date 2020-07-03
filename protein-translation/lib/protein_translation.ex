defmodule ProteinTranslation do
  @codonMap %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    do_of_rna(rna, [])
  end

  def do_of_rna(strand, result) do

    {codon, rest} = String.split_at(strand, 3)
    codon_proteine = of_codon(codon)

    case codon_proteine do
      {:error, _} ->
        {:error, "invalid RNA"}
      {:ok, "STOP"} ->
        {:ok, result}
      {:ok, trans} ->
        if rest === "" do
          {:ok, result ++ [trans]}
        else
          do_of_rna(rest, result ++ [trans])
        end
    end
  end

  def do_of_rna(trans, result) when trans === "" do
    {:ok, result}
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """

  @codons @codonMap |> Map.keys

  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) when codon in @codons do
    {:ok, @codonMap[codon]}
  end

  def of_codon(_) do
    {:error, "invalid codon"}
  end
end
