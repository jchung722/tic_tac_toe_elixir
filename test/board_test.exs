defmodule BoardTest do
  use ExUnit.Case
  doctest Board

  describe "in a new game" do
    setup do
      [board: ["1", "2", "3", "4", "5", "6", "7", "8", "9"]]
    end

    test "board should be empty", context do
      board_data = %Board{}
      assert board_data.data == context[:board]
    end

    test "empty board will be printed" do
      board_data = %Board{}
      assert Board.print_board(board_data.data) == "| 1 | 2 | 3 |\n| 4 | 5 | 6 |\n| 7 | 8 | 9 |"
    end
  end

  describe "in a played game" do

    test "currently played board will be printed" do
      board = ["1", "X", "3", "4", "O", "6", "7", "8", "9"]
      assert Board.print_board(board) == "| 1 | X | 3 |\n| 4 | O | 6 |\n| 7 | 8 | 9 |"
    end

  end
end
