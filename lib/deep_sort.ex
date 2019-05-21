defmodule DeepSort do
  @moduledoc """
  A module who does recursive sort over a nested list.
  """

  @doc """
  Sorting a nested list based on Enum.sort.

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

  """
  def sort(list, sorter \\ &<=/2) when is_list(list) and is_function(sorter, 2) do
    list
    |> Enum.map(fn item ->
      if is_list(item), do: sort(item, sorter), else: item
    end)
    |> Enum.sort(sorter)
  end
end
