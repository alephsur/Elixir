defmodule SecretHandshake do
  use Bitwise;

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    list = handshake(code, 0b1)
    list = list ++ handshake(code, 0b10)
    list = list ++ handshake(code, 0b100)
    list = list ++ handshake(code, 0b1000)
    if (code &&& 0b10000) == 0b10000, do: Enum.reverse(list), else: list
  end

  def handshake(code, _) when code == 0 do [] end

  def handshake(code, check) when check == 0b1 do
    if (code &&& check) == check do
      ["wink"]
    else
      []
    end
  end

  def handshake(code, check) when check == 0b10 do
    if (code &&& check) == check do
      ["double blink"]
    else
      []
    end
  end

  def handshake(code, check) when check == 0b100 do
    if (code &&& check) == check do
      ["close your eyes"]
    else
      []
    end
  end

  def handshake(code, check) when check == 0b1000 do
    if (code &&& check) == check do
      ["jump"]
    else
      []
    end
  end

end
