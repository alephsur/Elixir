defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do

    String.to_charlist(text)
    |> Enum.map(&changeChar(&1,rem(shift,26)))
    |> to_string()
  end

  def changeChar(char, _) when char < 64 do
    char
  end

  def changeChar(char, shift) when char > 64 and char < 91  do
    if char + shift > 90 do
      65 + rem(char + shift,91)
    else
      char + shift
    end
  end

  def changeChar(char, shift) when char > 96  do
    if char + shift > 122 do
      97 + rem(char + shift,123)
    else
      char + shift
    end
  end

end
