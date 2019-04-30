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
      assert Input.validate("1", board, playerX, playerO) == :valid
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
      assert Input.validate("\n", board, playerX, playerO) == :invalid
    end

    test "when it is not numeric" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = ["1", playerX, "3",
               "4", playerO, "6",
               "7", "8", "9"]
      assert Input.validate("invalid\n", board, playerX, playerO) == :invalid
    end

    test "the spot on the board is already taken" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = ["1", playerX, "3",
               "4", playerO, "6",
               "7", "8", "9"]
      assert Input.validate("2", board, playerX, playerO) == :invalid
    end

    test "when the input is outside the range of the board" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = ["1", playerX, "3",
               "4", playerO, "6",
               "7", "8", "9"]
      assert Input.validate("10", board, playerX, playerO) == :invalid
    end

  end

  describe "player symbol is valid" do
    test "when it is a single alphanumeric characters" do
      player_symbol = "X"
      assert Input.validate(player_symbol) == :valid
    end
  end

  describe "player symbol is invalid" do

    test "when it is empty" do
      player_symbol = ""
      assert Input.validate(player_symbol) == :invalid
    end

    test "when longer than one character" do
      player_symbol = "OOO"
      assert Input.validate(player_symbol) == :invalid
    end

    test "when not alphanumeric" do
      player_symbol = "&"
      assert Input.validate(player_symbol) == :invalid
    end
  end

end
