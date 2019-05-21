defmodule DeepSortTest do
  @moduledoc """
  Unit tests for DeepSort
  """
  use ExUnit.Case
  doctest DeepSort

  test "sort a complex nested list with a sorter function" do
    assert DeepSort.sort(
             [
               4,
               2,
               [3, 4, 1, 2],
               1,
               "abc",
               :abc,
               [
                 b: 1,
                 a: 2,
                 c: ["world", :hello, %{b: 2, a: 1, foo: "bar", baz: 1..5}, "hello", :bar]
               ]
             ],
             &>=/2
           ) == [
             "abc",
             [
               c: ["world", :hello, %{a: 1, b: 2, baz: 1..5, foo: "bar"}, "hello", :bar],
               b: 1,
               a: 2
             ],
             [4, 3, 2, 1],
             :abc,
             4,
             2,
             1
           ]
  end
end
