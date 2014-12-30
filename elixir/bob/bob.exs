defmodule Teenager do
  alias String, as: S
  def hey(input) do
    cond do
      S.match?(input, ~r/^\s*$/u)
        -> "Fine. Be that way!"

      "?" == S.last(input)
        -> "Sure."

      input == S.upcase(input) and
      S.match?(input, ~r/\p{L}/u)
        -> "Whoa, chill out!"

      true
        -> "Whatever."
    end
  end
end
