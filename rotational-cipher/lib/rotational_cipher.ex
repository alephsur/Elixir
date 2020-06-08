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
    |> Enum.map(&change_char(&1,rem(shift,26)))
    |> to_string()
  end

  def change_char(char, _) when char < ?A -1 do
    char
  end

  def change_char(char, shift) when char > ?A-1 and char < ?Z+1  do
    if char + shift > ?Z do
      ?A + rem(char + shift,(?Z+1))
    else
      char + shift
    end
  end

  def change_char(char, shift) when char > ?a - 1  do
    if char + shift > ?z do
      ?a + rem(char + shift, (?z+1))
    else
      char + shift
    end
  end

end
