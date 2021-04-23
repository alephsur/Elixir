defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) do
    cond do
      input == 0 -> raise FunctionClauseError
      is_integer(input) == false -> raise FunctionClauseError
      true -> conjecture_execution(input, 0)
    end
  end

  defp conjecture_execution(1,counter) do
    counter
  end

  defp conjecture_execution(input, counter) when rem(input,2) == 0 do
    conjecture_execution(div(input,2), counter + 1)
  end

  defp conjecture_execution(input, counter) when rem(input,2) == 1 do
    conjecture_execution(input * 3 + 1, counter + 1)
  end
end
