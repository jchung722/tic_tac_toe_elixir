defmodule ComputerTest do
  use ExUnit.Case

  test "a computer will make a random move from available spots" do
    board = ["1", "2", "3",
             "4", "5", "6",
             "7", "8", "9"]
    seed = :rand.seed(:exs1024, {1, 2, 3})
    assert Computer.random_move(board, seed) == "4"
  end

  test "a computer will choose the last available spot" do
    playerX = %Player{name: "playerX", symbol: "X"}
    playerO = %Player{name: "playerO", symbol: "O"}
    board = [playerX, playerO, playerX,
             playerO, playerX, playerX,
             playerO, playerO, "9"]
    seed = :rand.seed(:exs1024, {1, 2, 3})
    assert Computer.random_move(board, seed) == "9"
  end

  test "no available spots for computer to choose will raise an error" do
    playerX = %Player{name: "playerX", symbol: "X"}
    playerO = %Player{name: "playerO", symbol: "O"}
    board = [playerX, playerO, playerX,
             playerO, playerX, playerX,
             playerO, playerO, playerX]
    seed = :rand.seed(:exs1024, {1, 2, 3})
    assert_raise(Enum.EmptyError, fn -> Computer.random_move(board, seed) end)
  end
end
