defmodule ComputerTest do
  use ExUnit.Case

  describe "simple computer" do

    test "will make a random move from available spots" do
      board = ["1", "2", "3",
               "4", "5", "6",
               "7", "8", "9"]
      seed = :rand.seed(:exs1024, {1, 2, 3})
      assert Computer.random_move(board, seed) == "4"
    end

    test "will choose the last available spot" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerX, playerO, playerX,
               playerO, playerX, playerX,
               playerO, playerO, "9"]
      seed = :rand.seed(:exs1024, {1, 2, 3})
      assert Computer.random_move(board, seed) == "9"
    end

    test "will raise an error if no available spots are left to choose " do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      board = [playerX, playerO, playerX,
               playerO, playerX, playerX,
               playerO, playerO, playerX]
      seed = :rand.seed(:exs1024, {1, 2, 3})
      assert_raise(Enum.EmptyError, fn -> Computer.random_move(board, seed) end)
    end
  end

  describe "unbeatable computer" do

    test "will choose the last available spot" do
      playerX = %Player{name: "playerX", symbol: "X", type: "COMPUTER", level: "HARD"}
      playerO = %Player{name: "playerO", symbol: "O", type: "HUMAN"}
      board = [playerX, playerO, playerX,
               playerO, playerX, playerX,
               playerO, playerO, "9"]
      assert Computer.best_move(board, playerX, playerO) == "9"
    end

    test "with two choices will choose immediate move that wins the game" do
      playerX = %Player{name: "playerX", symbol: "X", type: "COMPUTER", level: "HARD"}
      playerO = %Player{name: "playerO", symbol: "O", type: "HUMAN"}
      board = [playerX, playerO, playerX,
               playerO, playerO, playerX,
               playerO, "8", "9"]
      assert Computer.best_move(board, playerX, playerO) == "9"
    end

    test "with three choices will choose first available move that wins the game" do
      playerX = %Player{name: "playerX", symbol: "X", type: "COMPUTER", level: "HARD"}
      playerO = %Player{name: "playerO", symbol: "O", type: "HUMAN"}
      board = [playerX, playerO, playerX,
               playerO, playerX, playerO,
               "7", "8", "9"]
      assert Computer.best_move(board, playerX, playerO) == "7"
    end

    test "without immediate winning move will make move that blocks opponent from winning" do
      playerX = %Player{name: "playerX", symbol: "X", type: "COMPUTER", level: "HARD"}
      playerO = %Player{name: "playerO", symbol: "O", type: "HUMAN"}
      board = ["1", playerX, playerO,
               "4", playerO, playerX,
               playerX, "8", playerO]
      assert Computer.best_move(board, playerX, playerO) == "1"
    end

    test "makes first move in best position, 1" do
      playerX = %Player{name: "playerX", symbol: "X", type: "COMPUTER", level: "HARD"}
      playerO = %Player{name: "playerO", symbol: "O", type: "HUMAN"}
      board = ["1", "2", "3",
               "4", "5", "6",
               "7", "8", "9"]
      assert Computer.best_move(board, playerX, playerO) == "1"
    end

    test "with three choices will choose first available move that wins the game against easy computer" do
      playerX = %Player{name: "playerX", symbol: "X", type: "COMPUTER", level: "HARD"}
      playerO = %Player{name: "playerO", symbol: "O", type: "COMPUTER", level: "EASY"}
      board = [playerX, playerO, playerX,
               playerO, playerX, playerO,
               "7", "8", "9"]
      assert Computer.best_move(board, playerX, playerO) == "7"
    end

    test "with three choices will choose first available move that wins the game against unbeatable computer" do
      playerX = %Player{name: "playerX", symbol: "X", type: "COMPUTER", level: "HARD"}
      playerO = %Player{name: "playerO", symbol: "O", type: "COMPUTER", level: "HARD"}
      board = [playerX, playerO, playerX,
               playerO, playerX, playerO,
               "7", "8", "9"]
      assert Computer.best_move(board, playerX, playerO) == "7"
    end
  end
end
