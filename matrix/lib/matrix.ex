defmodule Matrix do
  defstruct matrix: nil

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `Matrix` struct.
  """
  @spec from_string(input :: String.t()) :: %Matrix{}
  def from_string(input) do
    generate_matrix(String.graphemes(input), [])
  end


  defp generate_matrix(input, matrix) do
    generate_vector(input, [], matrix)
  end

  defp generate_vector([],vector ,matrix) do
    List.insert_at(matrix, length(matrix), vector)
  end

  defp generate_vector([head|tail], vector, matrix) do
    cond do
      head == " " -> generate_vector(tail, vector, matrix)
      head == "\n" -> generate_vector(tail, [], List.insert_at(matrix, length(matrix), vector))
      true -> generate_vector(tail, vector ++ [String.to_integer(head) ], matrix)
    end
  end

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  @spec to_string(matrix :: %Matrix{}) :: String.t()
  def to_string(matrix) do
    read_matrix(matrix, "")
  end

  defp read_matrix([], string) do
    String.slice(string, 0, String.length(string) -1 )
  end

  defp read_matrix([head|tail], string) do
    read_matrix(tail, string <> read_vector(head, ""))
  end


  defp read_vector([], string) do
    string <> "\n"
  end

  defp read_vector([head|tail], string) do
    cond do
      length(tail) > 0 -> read_vector(tail, string <> Integer.to_string(head) <> " ")
      true -> read_vector(tail, string <> Integer.to_string(head))
    end
  end

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: %Matrix{}) :: list(list(integer))
  def rows(matrix) do
    matrix
  end

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def row(matrix, index) do
    Enum.at(matrix, index)
  end

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: %Matrix{}) :: list(list(integer))
  def columns(matrix) do
    transpose_matrix(matrix, 0, [])
  end

  defp transpose_matrix(matrix, position, matrix_result) do
    cond do
      length(matrix) == position -> matrix_result
      true -> transpose_matrix(matrix, (position+1), matrix_result ++ [analize_vectors(matrix, position, []) ])
    end
  end

  defp analize_vectors([], position, vector) do
    vector
  end

  defp analize_vectors([head|tail], position, vector) do
    valueFromVector = get_vector_position(head, position)
    analize_vectors(tail, position, vector ++ [valueFromVector])
  end

  defp get_vector_position(vector, position) do
    Enum.at(vector, position)
  end

  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def column(matrix, index) do
    transpose_matrix(matrix, 0, [])
    |> Enum.at(index)
  end
end
