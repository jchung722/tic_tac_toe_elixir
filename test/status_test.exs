defmodule StatusTest do
  use ExUnit.Case

  describe "in a new game" do
    setup do
      [board: ["1", "2", "3",
               "4", "5", "6",
               "7", "8", "9"],
      playerX: %Player{name: "playerX", symbol: "X"},
      playerO: %Player{name: "playerO", symbol: "O"}]

    end

    test "the game can continue to be played", context do
      assert Status.result(context[:board], context[:playerX], context[:playerO]) == {:play, context[:playerX], context[:playerO], context[:board]}
    end

  end

  describe "during game" do
    test "a game with no three adjacent moves from a player can continue to play" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [ playerX , "2", playerX,
                playerO, "5", "6",
                playerO, "8", "9"]
      assert Status.result(board, playerX, playerO) == {:play, playerX, playerO, board}
    end

    test "if there are any unplayed moves and no winner, game is still in play" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerX, playerO, playerX,
               playerO, playerX, "6",
               playerO, playerX, playerO]
      assert Status.result(board, playerO, playerX) == {:play, playerO, playerX, board}
    end
  end

  describe "end of game" do
    test "a game with three adjacent moves in a row from a player has a winner" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerX, playerX, playerX,
               playerO, playerO, "6",
               "7", "8", "9"]
      assert Status.result(board, playerO, playerX) == {:win, playerX, board}
    end

    test "a game with three adjacent moves in a column from a player has a winner" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerX, playerO, "3",
               playerX, playerO, "6",
               playerX, "8", "9"]
      assert Status.result(board, playerO, playerX) == {:win, playerX, board}
    end

    test "a game with three adjacent moves in a diagonal from a player has a winner" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerO, playerX, "3",
               playerX, playerO, "6",
               playerX, "8", playerO]
      assert Status.result(board, playerX, playerO) == {:win, playerO, board}
    end

    test "if all moves are played and there is no winner, the game is tied" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerX, playerO, playerX,
               playerO, playerX, playerX,
               playerO, playerX, playerO]
      assert Status.result(board, playerO, playerX) == {:tie, "IT'S A TIE!", board}
    end

    test "if all moves are played and there is a winner" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerX, playerO, playerX,
               playerO, playerO, playerX,
               playerO, playerX, playerX]
      assert Status.result(board, playerO, playerX) == {:win, playerX, board}
    end

  end
end
