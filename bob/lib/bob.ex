defmodule Bob do
  def hey(input) do
    cond do
      String.trim(input) == "" -> "Fine. Be that way!"
      is_screeming(String.trim(input)) and is_question(String.trim(input)) -> "Calm down, I know what I'm doing!"
      is_screeming(String.trim(input)) -> "Whoa, chill out!"
      is_question(String.trim(input)) -> "Sure."
      true -> "Whatever."
    end
  end

  defp is_question(input) do
    String.graphemes(input) |> List.last() == "?"
  end

  defp is_screeming(input) do
    input == String.upcase(input) and input != String.downcase(input)
  end

end
