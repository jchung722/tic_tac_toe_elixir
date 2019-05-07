defmodule TicTacToeElixir do
  def main(_args) do

    board = %Board{}.spots
    player1_type = Input.gets("Enter player type (computer/human): ") |> String.upcase
    player1 = Player.create(player1_type)
    player2_type = Input.gets("Enter player type (computer/human): ") |> String.upcase
    player2 = Player.create(player2_type)

    Game.play(Status.result(board, player1, player2))

  end
end
