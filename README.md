# DeepSort

[![Build Status](https://travis-ci.org/Maples7/ex_deep_sort.svg?branch=master)](https://travis-ci.org/Maples7/ex_deep_sort)
[![Coverage Status](https://coveralls.io/repos/github/Maples7/ex_deep_sort/badge.svg?branch=master)](https://coveralls.io/github/Maples7/ex_deep_sort?branch=master)
[![hex.pm version](https://img.shields.io/hexpm/v/deep_sort.svg)](https://hex.pm/packages/deep_sort)
[![hex.pm downloads](https://img.shields.io/hexpm/dt/deep_sort.svg)](https://hex.pm/packages/deep_sort)

A hex module who does recursive sort over a nested list.

## why?

As we all know, different data types in Elixir can be compared using comparison operators so we don't need to worry about different data types in order to sort. The overall sorting order is defined below:

> number < atom < reference < function < port < pid < tuple < map < list < bitstring

By this way, `Enum.sort` can do flat sorting jobs over enumerables. This package steps forward and it does recursive sort over a nested list.

## Examples

```shell
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
```

The function is based on [`Enum.sort/2`](https://hexdocs.pm/elixir/Enum.html#sort/2) but aims to do a recursive sort over a nested list.

## Docs

The docs can be found at [https://hexdocs.pm/deep_sort](https://hexdocs.pm/deep_sort).

## Installation

The package can be installed
by adding `deep_sort` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:deep_sort, "~> 0.3.0"} # change version to newest
  ]
end
```

## License

[MIT](./LICENSE)

## ChangeLog

[CHANGELOG](./CHANGELOG.md)
