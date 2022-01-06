defmodule Secrets do
  use Bitwise

  def secret_add(secret) do
    fn (b) -> secret + b end
  end

  def secret_subtract(secret) do
    fn (b) -> b - secret  end
  end

  def secret_multiply(secret) do
    fn (b) -> secret * b end
  end

  def secret_divide(secret) do
    fn (b) -> div(b,secret) end
  end

  def secret_and(secret) do
    fn (b) -> b &&& secret end
  end

  def secret_xor(secret) do
    fn (b) -> bxor(b, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn (b) -> secret_function2.(secret_function1.(b)) end
  end
end
