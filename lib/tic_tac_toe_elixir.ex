defmodule TicTacToeElixir do
  def main(_args) do
    #Initializes empty board and starts with player X
    board = %Board{}.spots
    player = "X"

    Game.play(false, board, player)
  end
end
