defmodule ComputerTest do
  use ExUnit.Case

  test "a computer will make a random move from available spots" do
    playerX = %Player{name: "playerX", symbol: "X"}
    playerO = %Player{name: "playerO", symbol: "O"}
    board = [playerX, playerO, playerX,
             playerO, playerX, playerX,
             playerO, playerO, "9"]
    assert Computer.random_move(board) == "9"
  end
end
