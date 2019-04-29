defmodule TicTacToeElixir do
  def main(_args) do

    board = %Board{}.spots
    player1 = Player.create("Player1")
    player2 = Player.create("Player2")

    Game.play(Status.result(board, player1, player2))

  end
end
