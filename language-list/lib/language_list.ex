defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    [_|tail] = list
    tail
  end

  def first(list) do
    [head|_] = list
    head
  end

  def count(list) do
    length(list)
  end

  def exciting_list?([]) do false end
  def exciting_list?([head|tail]) do
    cond do
      head == "Elixir" -> True
      true -> exciting_list?(tail)
    end
  end
end
