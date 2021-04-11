defmodule MatchingBrackets do

  @brackets ["[","]"]
  @braces ["{","}"]
  @parentheses ["(",")"]

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    String.graphemes(str) |>
    check_string([])
  end

  def check_string([], acc_list) do
    if acc_list === [] do
      true
    else
      false
    end
  end

  def check_string([head|tail], acc_list) do
    cond do
      head === List.first(@brackets) -> check_string(tail, acc_list ++ [head] )
      head === List.last(@brackets) && List.last(acc_list) === List.first(@brackets) -> check_string(tail, List.delete_at(acc_list, length(acc_list)-1))
      head === List.last(@brackets) && List.last(acc_list) !== List.first(@brackets) -> false

      head === List.first(@braces) -> check_string(tail, acc_list ++ [head] )
      head === List.last(@braces) && List.last(acc_list) === List.first(@braces) -> check_string(tail, List.delete_at(acc_list, length(acc_list)-1))
      head === List.last(@braces) && List.last(acc_list) !== List.first(@braces) -> false

      head === List.first(@parentheses) -> check_string(tail, acc_list ++ [head] )
      head === List.last(@parentheses) && List.last(acc_list) === List.first(@parentheses) -> check_string(tail, List.delete_at(acc_list, length(acc_list)-1))
      head === List.last(@parentheses) && List.last(acc_list) !== List.first(@parentheses) -> false

      true -> check_string(tail, acc_list)
    end
  end

end
