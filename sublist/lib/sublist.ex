defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b -> :equal
      a == [] and b==[nil] -> :sublist
      a == [nil] and b==[] -> :superlist
      check_list1_in_list22(a,b) == true -> :sublist
      check_list1_in_list22(b,a) == true -> :superlist
      a != b -> :unequal
    end

  end

  def check_list1_in_list22(a, []) do
    nil
  end

  def check_list1_in_list22(a, [head|tail]) do
    position = Enum.find_index([head|tail], fn x -> x === List.first(a) end)
    if position != nil do
      cond do
        a == Enum.slice([head|tail],position, length(a)) -> true
        true -> check_list1_in_list22(a, tail)
      end
    end
  end

end
