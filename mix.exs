defmodule TicTacToeElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :tic_tac_toe_elixir,
      version: "1.2.0",
      description: "Logic for a game of TicTacToe",
      elixir: "~> 1.8",
      escript: [main_module: TicTacToeElixir],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      source_url: "https://github.com/jchung722/tic_tac_toe_elixir",
      homepage_url: "https://github.com/jchung722/tic_tac_toe_elixir"
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
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package() do
    [
      name: "tictactoe",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/jchung722/tic_tac_toe_elixir"}
    ]
  end
end
