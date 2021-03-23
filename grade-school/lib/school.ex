defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t(), integer) :: map
  def add(db, name, grade) do
    cond do
      Map.fetch(db, grade) == :error -> Map.put(db,grade, [name])
      true -> Map.put(db,grade, Map.fetch!(db, grade) ++ [name])
    end

  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t()]
  def grade(db, grade) do
    cond do
      Map.fetch(db, grade) == :error -> []
      true -> Map.fetch!(db,grade)
    end
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t()]}]
  def sort(db) do
    get_sorted_list(Map.keys(db), db, [])
  end

  def get_sorted_list([], _, lista) do
    lista
  end

  def get_sorted_list([head | tail], map, lista) do
    get_sorted_list(tail, map, lista ++ [{head, Enum.sort(Map.fetch!(map, head))}])
  end


end
