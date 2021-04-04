defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @romans %{
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M"
  }

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    convert(number, "")
  end

  def convert(number,string) when number == 0 do string  end

  def convert(number, string) when number >= 1000 do convert(number-1000, string <> Map.fetch!(@romans, 1000))  end
  def convert(number, string) when number >= 900 do convert(number-900, string <> Map.fetch!(@romans, 900))  end
  def convert(number, string) when number >= 500 do convert(number-500, string <> Map.fetch!(@romans, 500))  end
  def convert(number, string) when number >= 400 do convert(number-400, string <> Map.fetch!(@romans, 400))  end
  def convert(number, string) when number >= 100 do convert(number-100, string <> Map.fetch!(@romans, 100))  end
  def convert(number, string) when number >= 90 do convert(number-90, string <> Map.fetch!(@romans, 90))  end
  def convert(number, string) when number >= 50 do convert(number-50, string <> Map.fetch!(@romans, 50))  end
  def convert(number, string) when number >= 40 do convert(number-40, string <> Map.fetch!(@romans, 40))  end
  def convert(number, string) when number >= 10 do convert(number-10, string <> Map.fetch!(@romans, 10))  end
  def convert(number, string) when number >= 9 do convert(number-9, string <> Map.fetch!(@romans, 9))  end
  def convert(number, string) when number >= 5 do convert(number-5, string <> Map.fetch!(@romans, 5))  end
  def convert(number, string) when number >= 4 do convert(number-4, string <> Map.fetch!(@romans, 4))  end
  def convert(number, string) when number < 4 do convert(number-1, string <> Map.fetch!(@romans, 1))  end




end
