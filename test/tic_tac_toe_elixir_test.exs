defmodule TicTacToeElixirTest do
  use ExUnit.Case
  doctest TicTacToeElixir

  test "greets the world" do
    assert TicTacToeElixir.hello() == :world
  end
end
