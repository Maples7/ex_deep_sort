defmodule DeepSort do
  @moduledoc """
  A module who does recursive sort over any enumerables.
  """

  @doc """
  Sorting an enumerable based on Enum.sort.

  ## Examples

      iex> DeepSort.sort([4, 2, 3, 1])
      [1, 2, 3, 4]

      iex> DeepSort.sort([4, 2, 3, 1], &>/2)
      [4, 3, 2, 1]

      iex> DeepSort.sort([4, 2, [3, 4, 1, 2], 1, "abc", :abc, [b: 1, a: 2, c: ["world", :hello, %{b: 2, a: 1, foo: "bar", baz: 1..5}, "hello", :bar]]])
      [
        1,
        2,
        4,
        :abc,
        [1, 2, 3, 4],
        [
          a: 2,
          b: 1,
          c: ["world", :hello, %{a: 1, b: 2, baz: 1..5, foo: "bar"}, "hello", :bar]
        ],
        "abc"
      ]

      iex> DeepSort.sort("AsDfdg")
      "AsDfdg"

      iex> DeepSort.sort('AsDfdg')
      'ADdfgs'

      iex> DeepSort.sort({:two, 1, "three"})
      {:two, 1, "three"}

      iex> DeepSort.sort(%{two: 1, one: 1, "3": "three"})
      ["3": "three", one: 1, two: 1]
  """
  def sort(enumerable, sorter \\ &<=/2) when is_function(sorter, 2) do
    if Enumerable.impl_for(enumerable) do
      enumerable
      |> Enum.map(fn item ->
        if Enumerable.impl_for(item), do: sort(item, sorter), else: item
      end)
      |> Enum.sort(sorter)
    else
      enumerable
    end
  end
end
