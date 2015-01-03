defmodule Words do
  def inc_freq(key, map) do
    Map.update(map, key, 1, &(&1+1))
  end

  def frequencies(coll) do
    coll |> List.foldr(%{}, &inc_freq/2)
  end

  @spec count(String.t) :: map()
  def count(sentence) do
    unclean = ~r/[^\w-]|_/u
    sentence
      |> String.downcase
      |> String.replace(unclean, " ")
      |> String.split
      |> frequencies
  end
end
