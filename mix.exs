defmodule DeepSort.MixProject do
  @moduledoc """
  Project file for DeepSort module
  """
  use Mix.Project

  @version File.cwd!() |> Path.join("version") |> File.read!() |> String.trim()

  def project do
    [
      app: :deep_sort,
      version: @version,
      elixir: "~> 1.8",
      description: "A hex module who does recursive quick sort over a nested list.",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/Maples7/ex_deep_sort",
      homepage_url: "https://hex.pm/packages/deep_sort",
      package: [
        licenses: ["MIT"],
        links: %{
          "GitHub" => "https://github.com/Maples7/ex_deep_sort",
          "Docs" => "https://hex.pm/packages/deep_sort",
          "Author" => "http://maples7.com/about/"
        },
        maintainers: ["Maples7"]
      ],
      docs: [
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:pre_commit_hook, ">= 1.2.0", only: :dev, runtime: false},
      {:credo, ">= 1.0.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end
end
