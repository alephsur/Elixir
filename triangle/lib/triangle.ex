defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    cond do
      a <= 0 || b <= 0 || c <= 0 -> {:error, "all side lengths must be positive"}
      !check_legal_triangle(a,b,c) -> {:error, "side lengths violate triangle inequality"}
      check_sides_equality(a, b) && check_sides_equality(a,c) -> {:ok, :equilateral}
      !check_sides_equality(a, b) && check_sides_equality(b,c) -> {:ok, :isosceles}
      !check_sides_equality(a, b) && check_sides_equality(a,c) -> {:ok, :isosceles}
      check_sides_equality(a, b) && !check_sides_equality(a, c) -> {:ok, :isosceles}
      !check_sides_equality(a,b) && !check_sides_equality(a,c) && !check_sides_equality(b,c) -> {:ok, :scalene}
    end
  end

  defp check_sides_equality(a, b) do
    a == b
  end

  defp check_legal_triangle(a,b,c) do
    cond do
      a + b < c -> false
      a + c < b -> false
      b + c < a -> false
      true -> true
    end
  end

end
