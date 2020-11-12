defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    Enum.chunk_by(to_charlist(string), fn x -> x end)
      |> Enum.map(fn x -> transalteString(String.first(to_string(x)), Integer.to_string(length(x))) end)
      |> Enum.join
  end

  defp transalteString(character, len) when len == "1" do
    String.first(to_string(character))
  end

  defp transalteString(character, len) do
    len <> character
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    String.split(test, ~r/[A-Z]/, include_captures: true, trim: true)
      |> Enum.chunk_every(2)
      |> Enum.map(fn [x,y] -> String.duplicate(y, String.to_integer(x)) end)
      |> Enum.join
  end
end
