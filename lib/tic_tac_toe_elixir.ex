defmodule TicTacToeElixir do
  def main(_args) do

    board = %Board{}.spots
    player1_type = Player.set_type()
    player1 = Player.create(player1_type)
    player2_type = Player.set_type()
    player2 = Player.create(player2_type)

    Game.play(Status.result(board, player1, player2))

  end
end
