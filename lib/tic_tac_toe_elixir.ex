defmodule TicTacToeElixir do
  def main(_args) do

    board = %Board{}.spots
    player = "X"

    Game.play(false, board, player)

  end
end
