defmodule InputTest do
  use ExUnit.Case
  doctest Input

  describe "move is valid" do

    test "when it is a numeric represenfation of an untaken spot on the board" do
      board = ["1", "X", "3",
               "4", "O", "6",
               "7", "8", "9"]
      player1 = %Player{name: "player1", symbol: "X"}
      player2 = %Player{name: "player2", symbol: "O"}
      assert Input.validate("1", board, player1, player2) == :valid
    end

  end

  test "returns the board index from user input" do
    assert Input.to_board_index("1\n") == 0
  end

  describe "move is invalid" do
    test "when it is empty" do
      board = ["1", "X", "3",
               "4", "O", "6",
               "7", "8", "9"]
      player1 = %Player{name: "player1", symbol: "X"}
      player2 = %Player{name: "player2", symbol: "O"}
      assert Input.validate("\n", board, player1, player2) == :invalid
    end

    test "when it is not numeric" do
      board = ["1", "X", "3",
               "4", "O", "6",
               "7", "8", "9"]
      player1 = %Player{name: "player1", symbol: "X"}
      player2 = %Player{name: "player2", symbol: "O"}
      assert Input.validate("invalid\n", board, player1, player2) == :invalid
    end

    test "the spot on the board is already taken" do
      board = ["1", "X", "3",
               "4", "O", "6",
               "7", "8", "9"]
      player1 = %Player{name: "player1", symbol: "X"}
      player2 = %Player{name: "player2", symbol: "O"}
      assert Input.validate("2", board, player1, player2) == :invalid
    end

    test "when the input is outside the range of the board" do
      board = ["1", "X", "3",
               "4", "O", "6",
               "7", "8", "9"]
      player1 = %Player{name: "player1", symbol: "X"}
      player2 = %Player{name: "player2", symbol: "O"}
      assert Input.validate("10", board, player1, player2) == :invalid
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
