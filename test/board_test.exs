defmodule BoardTest do
  use ExUnit.Case

  describe "in a new game" do

    test "board should be empty", context do
      board = %Board{}
      assert board.spots == ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    end

    test "empty board will be built" do
      board = %Board{}
      assert Board.build(board.spots) == " 1 | 2 | 3 \n--- --- ---\n 4 | 5 | 6 \n--- --- ---\n 7 | 8 | 9 "
    end
  end

  describe "during a game" do

    test "currently played board will be built" do
      board = ["1", "X", "3", "4", "O", "6", "7", "8", "9"]
      assert Board.build(board) == " 1 | X | 3 \n--- --- ---\n 4 | O | 6 \n--- --- ---\n 7 | 8 | 9 "
    end

    test "when a player makes a move, the board will be updated with that move" do
      board = ["1", "X", "3", "4", "O", "6", "7", "8", "9"]
      assert Board.update("3", board, "X") == [ "1", "X", "X", "4", "O", "6", "7", "8", "9"]
    end
  end
end
