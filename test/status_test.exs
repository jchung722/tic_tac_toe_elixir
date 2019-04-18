defmodule StatusTest do
  use ExUnit.Case

  describe "in a new game" do
    setup do
      [board: ["1", "2", "3", "4", "5", "6", "7", "8", "9"]]
    end

    test "the game has no winner", context do
      assert Status.win?(context[:board]) == false
    end

    test "the game has no adjacent moves in a row", context do
      assert Status.check_row(context[:board]) == false
    end

    test "the game has no tie", context do
      assert Status.tie?(context[:board]) == false
    end

    test "the game is not over", context do
      assert Status.over?(context[:board]) == false
    end
  end

  describe "during game" do
    test "a game with no three adjacent moves from a player has no winner" do
      board = ["X", "2", "X", "O", "5", "6", "O", "8", "9"]
      assert Status.win?(board) == false
    end

    test "a game with no three adjacent moves from a player has no win via rows" do
      board = ["X", "2", "X", "O", "5", "6", "O", "8", "9"]
      assert Status.check_row(board) == false
    end

    test "after one move has been made, the game is not tied" do
      board = ["X", "2", "3", "4", "5", "6", "7", "8", "9"]
      assert Status.tie?(board) == false
    end

    test "if there are any unplayed moves and no winner, the game is not tied" do
      board = ["X", "O", "X", "O", "X", "6", "O", "X", "O"]
      assert Status.tie?(board) == false
    end
  end

  describe "end of game" do
    test "a game with three adjacent moves in a row from a player has a winner" do
      board = ["X", "X", "X", "O", "O", "6", "7", "8", "9"]
      assert Status.win?(board) == true
    end

    test "a game with three adjacent moves in a row from a player has a win via rows" do
      board = ["X", "X", "X", "O", "O", "6", "7", "8", "9"]
      assert Status.check_row(board) == true
    end

    test "a game with three adjacent moves in a column from a player has a winner" do
      board = ["X", "O", "3", "X", "O", "6", "X", "8", "9"]
      assert Status.win?(board) == true
    end

    test "a game with three adjacent moves in a column from a player did not win via rows" do
      board = ["X", "O", "3", "X", "O", "6", "X", "8", "9"]
      assert Status.check_row(board) == false
    end

    test "a game with three adjacent moves in a diagonal from a player has a winner" do
      board = ["O", "X", "3", "X", "O", "6", "X", "8", "O"]
      assert Status.win?(board) == true
    end

    test "if all moves are played and there is no winner, the game is tied" do
      board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
      assert Status.tie?(board) == true
    end

    test "if the game has a winner, the game is over" do
      board = ["X", "X", "X", "O", "O", "6", "7", "8", "9"]
      assert Status.over?(board) == true
    end

    test "if the game has a tie, the game is over" do
      board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
      assert Status.over?(board) == true
    end
  end
end
