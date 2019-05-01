defmodule InputTest do
  use ExUnit.Case
  doctest Input

  describe "move is valid" do

    test "when it is a numeric represenfation of an untaken spot on the board" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = ["1", playerX, "3",
               "4", playerO, "6",
               "7", "8", "9"]
      assert Input.move_validator("1", board, playerX, playerO) == :valid
    end
  end

  test "returns the board index from user input" do
    assert Input.to_board_index("1\n") == 0
  end

  describe "move is invalid" do
    test "when it is empty" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = ["1", playerX, "3",
               "4", playerO, "6",
               "7", "8", "9"]
      assert Input.move_validator("\n", board, playerX, playerO) == :invalid
    end

    test "when it is not numeric" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = ["1", playerX, "3",
               "4", playerO, "6",
               "7", "8", "9"]
      assert Input.move_validator("invalid\n", board, playerX, playerO) == :invalid
    end

    test "the spot on the board is already taken" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = ["1", playerX, "3",
               "4", playerO, "6",
               "7", "8", "9"]
      assert Input.move_validator("2", board, playerX, playerO) == :invalid
    end

    test "when the input is outside the range of the board" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = ["1", playerX, "3",
               "4", playerO, "6",
               "7", "8", "9"]
      assert Input.move_validator("10", board, playerX, playerO) == :invalid
    end
  end
end
