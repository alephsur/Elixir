defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    process_list(list, [])
  end

  defp process_list([], acc_list) do
    acc_list
  end

  defp process_list([head|tail], acc_list) do
    cond do
      is_list(head) -> process_list(head, process_list(tail, acc_list))
      head == nil -> process_list(tail, acc_list)
      true -> [head | process_list(tail, acc_list)]
    end
  end
end
