defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do

    firstChar = fn w -> String.at(w, 0) end

    String.replace(string, ~r/[A-Z]+[a-z]/, " \\0")
      |> String.split([" ", "-", "_"], trim: true)
      |> Enum.map(firstChar)
      |> to_string()
      |> String.upcase()
  end
end
