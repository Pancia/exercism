defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    case l do
      []     -> 0
      [_|xs] -> 1 + ListOps.count(xs)
    end
  end

  @spec reverse(list) :: list
  def reverse(l) do
    ListOps.reduce(l, [], &([&1|&2]))
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    case l do
      [] -> []
      [x|xs] -> [f.(x) | ListOps.map(xs, f)]
    end
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, p) do
    case l do
      [] -> []
      [x|xs]
        -> case p.(x) do
          true -> [x | filter(xs, p)]
          false -> filter(xs, p)
        end
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    case l do
      [] -> acc
      [x|xs] -> ListOps.reduce(xs, f.(x, acc), f)
    end
  end

  def flatten_first(list) do
    case list do
      []     -> []
      [x|xs] -> ListOps.concat([x, xs])
    end
  end

  @spec append(list, list) :: list
  def append(a, b) do
    [a|b]
      |> ListOps.flatten_first()
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    fun = &[&1|&2]
    ListOps.reduce(ll, [], &ListOps.reduce(&1, &2, fun))
      |> ListOps.reverse
  end
end
