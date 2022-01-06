defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    [head|tail] = list
    tail
  end

  def first(list) do
    [head|tail] = list
    head
  end

  def count(list) do
    length(list)
  end

  def exciting_list?(list) do
    cond do
      Enum.member?(list,"Elixir") -> true
      true -> false
    end
  end
end
