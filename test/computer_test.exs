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
      playerX = %Player{name: "playerX", symbol: "X", type: "COMPUTER"}
      playerO = %Player{name: "playerO", symbol: "O", type: "HUMAN"}
      board = [playerX, playerO, playerX,
               playerO, playerX, playerX,
               playerO, playerO, "9"]
      assert Computer.minimax(board, playerX, playerO) == %{move: "9", score: 10}
    end

    test "with two choices will choose immediate move that wins the game" do
      playerX = %Player{name: "playerX", symbol: "X", type: "COMPUTER"}
      playerO = %Player{name: "playerO", symbol: "O", type: "HUMAN"}
      board = [playerX, playerO, playerX,
               playerO, playerO, playerX,
               playerO, "8", "9"]
      assert Computer.minimax(board, playerX, playerO) == %{move: "9", score: 10}
    end

    test "with three choices will choose a move that wins the game" do
      playerX = %Player{name: "playerX", symbol: "X", type: "COMPUTER"}
      playerO = %Player{name: "playerO", symbol: "O", type: "HUMAN"}
      board = [playerX, playerO, playerX,
               playerO, playerX, playerO,
               "7", "8", "9"]
      assert Computer.minimax(board, playerX, playerO) == %{move: "7", score: 10}
    end

    test "without move that wins the game, will make move that blocks other player from winning" do
      playerX = %Player{name: "playerX", symbol: "X", type: "COMPUTER"}
      playerO = %Player{name: "playerO", symbol: "O", type: "HUMAN"}
      board = [playerO, playerX, playerO,
               "4", playerO, playerX,
               playerX, "8", "9"]
      assert Computer.minimax(board, playerX, playerO) == %{move: "9", score: 0}
    end

    test "makes first move in best position, 1" do
      playerX = %Player{name: "playerX", symbol: "X", type: "COMPUTER"}
      playerO = %Player{name: "playerO", symbol: "O", type: "HUMAN"}
      board = ["1", "2", "3",
               "4", "5", "6",
               "7", "8", "9"]
      assert Computer.minimax(board, playerX, playerO) == %{move: "1", score: 0}
    end

  end
end
