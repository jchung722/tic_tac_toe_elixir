defmodule BoardTest do
  use ExUnit.Case

  describe "in a new game" do

    test "board should be empty of player moves" do
      board = %Board{}
      assert board.spots == ["1", "2", "3",
                             "4", "5", "6",
                             "7", "8", "9"]
    end

    test "empty board will be formatted to string" do
      board = %Board{}
      assert Board.format(board.spots) == " 1 | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 "
    end
  end

  describe "during a game" do

    test "currently played board will be formatted to string" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = ["1", playerX, "3",
               "4", playerO, "6",
               "7", "8", "9"]
      assert Board.format(board) == " 1 | \e[32mX\e[0m | 3 \n---+---+---\n 4 | \e[32mO\e[0m | 6 \n---+---+---\n 7 | 8 | 9 "
    end

    test "when a player makes a valid move, the board will be updated with that move" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = ["1", playerX, "3",
               "4", playerO, "6",
               "7", "8", "9"]
      assert Board.update(2, board, playerX) == {:ok, [ "1", playerX, playerX, "4", playerO, "6", "7", "8", "9"]}
    end

    test "when a player makes a move for a taken spot, an error will be raised" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = ["1", playerX, "3",
               "4", playerO, "6",
               "7", "8", "9"]
      assert Board.update(1, board, playerX) == {:error, "Move is invalid"}
    end

    test "when a player makes a move for a spot outside the board range, an error will be raised" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = ["1", playerX, "3",
               "4", playerO, "6",
               "7", "8", "9"]
      assert Board.update(9, board, playerX) == {:error, "Move is invalid"}
    end

  end

end
