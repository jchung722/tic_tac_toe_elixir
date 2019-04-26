defmodule InputTest do
  use ExUnit.Case
  doctest Input

  describe "input is valid" do
    test "and user input is parsed and returned as index of the board" do
      assert Input.to_board_index("1\n") == 0
    end

    test "when it is a numeric represenation of an untaken spot on the board" do
      board = ["1", "X", "3",
               "4", "O", "6",
               "7", "8", "9"]
      assert Input.validate("1", board) == :valid
    end

  end

  describe "input is invalid" do
    test "when it is empty" do
      board = ["1", "X", "3",
               "4", "O", "6",
               "7", "8", "9"]
      assert Input.validate("\n", board) == :invalid
    end

    test "when it is not numeric" do
      board = ["1", "X", "3",
               "4", "O", "6",
               "7", "8", "9"]
      assert Input.validate("invalid\n", board) == :invalid
    end

    test "the spot on the board is already taken" do
      board = ["1", "X", "3",
               "4", "O", "6",
               "7", "8", "9"]
      assert Input.validate("2", board) == :invalid
    end

  end

end
