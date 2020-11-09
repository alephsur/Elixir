defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    lista = [{3,'Pling'}, {5,'Plang'},{7,'Plong'}]
    getFactorString(lista, number, '')
  end

  defp getFactorString([], number, string) when length(string) == 0 do
    Integer.to_string(number)
  end

  defp getFactorString([], _, string) when length(string) > 0 do
    to_string(string)
  end

  defp getFactorString([head|tail], number, string) do
    cond do
      rem(number, elem(head, 0)) == 0 -> getFactorString(tail, number, string ++ elem(head, 1))
      rem(number, elem(head, 0)) != 0 -> getFactorString(tail, number, string)
    end
  end
end
