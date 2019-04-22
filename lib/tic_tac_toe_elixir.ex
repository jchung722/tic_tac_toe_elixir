defmodule TicTacToeElixir do
  def main(_args) do

    board = %Board{}.spots
    player = "X"

    Game.play(Status.result(board, player), player)

  end
end
