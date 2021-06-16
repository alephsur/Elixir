defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("212-555-0100")
  "2125550100"

  iex> Phone.number("+1 (212) 555-0100")
  "2125550100"

  iex> Phone.number("+1 (212) 055-0100")
  "0000000000"

  iex> Phone.number("(212) 555-0100")
  "2125550100"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t()) :: String.t()
  def number(raw) do
    clean_number(raw)
    |> String.graphemes()
    |> get_number()
  end

  defp clean_number(raw) do
    cond do
      has_characters(String.graphemes(raw)) == true -> "0000000000"
      true -> String.replace(raw, ~r/[^\d]/, "")
    end
  end

  defp has_characters([]) do
    false
  end

  defp has_characters([head|tail]) do
    cond do
      String.match?(head, ~r/^\p{L}$/u) == true -> true
      true -> has_characters(tail)
    end
  end

  defp get_number(number) when length(number) < 10 do
    "0000000000"
  end

  defp get_number(number) when length(number) < 11 do
    cond do
      get_first_number(number) == "1" || get_first_number(number) == "0" -> "0000000000"
      true -> check_exchange_code(number) |> List.to_string()
    end
  end

  defp check_exchange_code(number) do
    cond do
      Enum.at(number, 3) == "1" || Enum.at(number, 3) == "0" -> ["0","0","0","0","0","0","0","0","0","0"]
      true -> number
    end
  end

  defp get_number(number) when length(number) == 11 do
    cond do
      get_first_number(number) == "1" -> get_tail_number(number)
      true -> "0000000000"
    end
  end

  defp get_first_number([head|tail]) do
    head
  end

  defp get_tail_number([head|tail]) do
    List.to_string(tail)
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("212-555-0100")
  "212"

  iex> Phone.area_code("+1 (212) 555-0100")
  "212"

  iex> Phone.area_code("+1 (012) 555-0100")
  "000"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t()) :: String.t()
  def area_code(raw) do
    number(raw)
    |> String.slice(0,3)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("212-555-0100")
  "(212) 555-0100"

  iex> Phone.pretty("212-155-0100")
  "(000) 000-0000"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t()) :: String.t()
  def pretty(raw) do
    number(raw)
    |> pretty_number_string()
  end

  defp pretty_number_string(raw) do
    "(" <> String.slice(raw,0,3) <> ")" <> " " <> String.slice(raw,3,3) <> "-" <> String.slice(raw,6,4)
  end
end
