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

    test "the game has no winner", context do
      assert Status.win?(context[:board]) == false
    end

    test "the game has no tie", context do
      assert Status.tie?(context[:board], context[:playerX], context[:playerO]) == false
    end

  end

  describe "during game" do
    test "a game with no three adjacent moves from a player has no winner" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [ playerX , "2", playerX,
                playerO, "5", "6",
                playerO, "8", "9"]
      assert Status.win?(board) == false
    end

    test "after one move has been made, the game is not tied" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerX, "2", "3",
               "4", "5", "6",
               "7", "8", "9"]
      assert Status.tie?(board, playerX, playerO) == false
    end

    test "if there are any unplayed moves and no winner, the game is not tied" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerX, playerO, playerX,
               playerO, playerX, "6",
               playerO, playerX, playerO]
      assert Status.tie?(board, playerX, playerO) == false
    end

    test "if there are any unplayed moves and no winner, game is still in play" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerX, playerO, playerX,
               playerO, playerX, "6",
               playerO, playerX, playerO]
      assert Status.result(board, playerO, playerX) == {:play, playerO, playerX, [playerX, playerO, playerX,
                                                                                  playerO, playerX, "6",
                                                                                  playerO, playerX, playerO]}
    end
  end

  describe "end of game" do
    test "a game with three adjacent moves in a row from a player has a winner" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerX, playerX, playerX,
               playerO, playerO, "6",
               "7", "8", "9"]
      assert Status.win?(board) == true
    end

    test "a game with three adjacent moves in a column from a player has a winner" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerX, playerO, "3",
               playerX, playerO, "6",
               playerX, "8", "9"]
      assert Status.win?(board) == true
    end

    test "a game with three adjacent moves in a diagonal from a player has a winner" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerO, playerX, "3",
               playerX, playerO, "6",
               playerX, "8", playerO]
      assert Status.win?(board) == true
    end

    test "if all moves are played and there is no winner, the game is tied" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerX, playerO, playerX,
               playerO, playerX, playerX,
               playerO, playerX, playerO]
      assert Status.tie?(board, playerX, playerO) == true
    end

    test "there is a winner" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerX, playerX, playerX,
               playerO, playerO, "6",
               "7", "8", "9"]
      assert Status.result(board, playerO, playerX) == {:win, playerX, [playerX, playerX, playerX,
                                                                        playerO, playerO, "6",
                                                                        "7", "8", "9"]}
    end

    test "there is a tie" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerX, playerO, playerX,
               playerO, playerX, playerX,
               playerO, playerX, playerO]
      assert Status.result(board, playerO, playerX) == {:tie, "IT'S A TIE!", [playerX, playerO, playerX,
                                                                            playerO, playerX, playerX,
                                                                            playerO, playerX, playerO]}
    end
  end
end
