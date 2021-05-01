defmodule Bob do
  def hey(input) do
    cond do
      String.trim(input) == "" -> "Fine. Be that way!"
      screeming?(String.trim(input)) and question?(String.trim(input)) -> "Calm down, I know what I'm doing!"
      screeming?(String.trim(input)) -> "Whoa, chill out!"
      question?(String.trim(input)) -> "Sure."
      true -> "Whatever."
    end
  end

  defp question?(input) do
    String.last(input) == "?"
  end

  defp screeming?(input) do
    input == String.upcase(input) and input != String.downcase(input)
  end

end
