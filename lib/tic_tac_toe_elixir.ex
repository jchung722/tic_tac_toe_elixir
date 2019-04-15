defmodule TicTacToeElixir do
  def main(_args) do
    #Initializes empty board and starts with player X
    board = %Board{}
    board_data = board.data
    player = "X"

    Game.play(false, board_data, player)
  end
end
