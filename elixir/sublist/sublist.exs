defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    case {a, b} do
      {[], []} -> :equal
      {[], _} -> :sublist
      {_, []} -> :superlist
      {[x|[]], [x|[]]} -> :equal
      {[_|[]], [_|[]]} -> :unequal
      {[x|xs], [x|ys]} -> compare(xs, ys)
      {x, [_|ys]} ->
        case compare(x, ys) do
          :equal     -> :sublist
          :sublist   -> :sublist
          :superlist -> :superlist
          :unequal   -> :unequal
        end
    end
  end
end
