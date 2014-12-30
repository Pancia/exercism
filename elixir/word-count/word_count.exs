defmodule Words do
  def assoc(key, map, default \\ 0) do
    Map.put(map, key, Map.get(map, key, default) + 1)
  end

  def frequencies(coll) do
    coll |> List.foldr(%{}, &assoc/2)
  end

  @spec count(String.t) :: map()
  def count(sentence) do
    #Could not get \W to work with -
    punc = ~r/[\~\`\!\@\#\$\%\^\&\*
               \(\)\_\+\=\;\'\:\"\{
               \|\;\}\<\>\,\.\/\?\_]/u
    sentence
    |> String.replace(punc, " ")
    |> String.downcase
    |> String.split
    |> frequencies
  end
end
