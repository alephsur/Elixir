defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0) do raise ArgumentError, :error end
  def nth(count) do
    get_position(count, 4, [2,3])
  end

  defp get_position(1,_, _) do 2 end
  defp get_position(2, _, _) do 3 end
  defp get_position(limit, number, list_result) do
    cond do
      length(list_result) == limit -> number-1
      check_prime_number(number, list_result) == 0 -> get_position(limit, number+1 , list_result)
      true -> get_position(limit, number+1 , list_result ++ [number])
    end
  end

  defp check_prime_number(number, []) do number end
  defp check_prime_number(number, [head|tail]) do
    cond do
      rem(number,head) == 0-> 0
      true -> check_prime_number(number, tail)
    end
  end
end
