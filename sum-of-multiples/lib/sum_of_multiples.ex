defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    #cond do
    #  limit < List.first(factors) -> 0
    #  limit > List.first(factors) -> make_sum(1, limit, factors, 0)
    #end
    get_factor_list(limit, factors, []) |>
      Enum.sort() |>
      Enum.dedup() |>
      Enum.sum()
  end

  def get_factor_list(limit, [], result_list) do
    result_list
  end

  def get_factor_list(limit, [head|tail], result_list) do
    list_products = get_single_list(1, limit, head, [])

    get_factor_list(limit, tail, result_list ++ list_products)
  end

  def get_single_list(value, value, factor, list) do
    list
  end

  def get_single_list(value, limit, factor, list) do
    product = value * factor
    cond do
      product < limit -> get_single_list(value + 1, limit, factor, list ++ [product])
      product >= limit -> get_single_list(value + 1, limit, factor, list)
    end
  end
end
