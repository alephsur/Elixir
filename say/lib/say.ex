defmodule Say do

  @hundred  100
  @thousand 1_000
  @million  @thousand * @thousand
  @billion  @million  * @thousand
  @trillion @billion  * @thousand

  @range    0..@trillion-1

  @simple_numbers %{
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety",
    }


  @doc """
  Translate a positive integer into English.
  """
  @spec in_english(integer) :: {atom, String.t()}
  def in_english(number) when number not in @range, do: {:error, "number is out of range"}
  def in_english(0), do: {:ok, "zero"}
  def in_english(number), do: {:ok, say(number)}

  defp say(number) when number <= 20 do
    @simple_numbers[number]
  end

  defp say(number) when number < 100 do
    case rem(number, 10) do
      0 -> @simple_numbers[number]
      mod-> @simple_numbers[number - mod] <> "-" <> @simple_numbers[mod]
    end
  end

  defp say(number) when number < 1000 do
    say_complex(number, @hundred, "hundred")
  end

  defp say(number) when number < 1000000 do
    say_complex(number, @thousand, "thousand")
  end

  defp say(number) when number < 1000000000 do
    say_complex(number, @million, "million")
  end

  defp say(number) when number < 1000000000000 do
    say_complex(number, @billion, "billion")
  end

  defp say_complex(number, base, suffix) do
    units = div(number, base)
    words = say(units) <> " " <> suffix

    case rem(number, base) do
      0 -> words
      mod -> words <> " " <> say(mod)
    end
  end

end
