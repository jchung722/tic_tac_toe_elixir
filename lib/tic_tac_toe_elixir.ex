defmodule TicTacToeElixir do
  def main(_args) do

    board = %Board{}.spots
    player1_type = Input.gets("Enter player type (computer/human): ") |> String.upcase
    player1 = player1_type
              |> Player.create
              |> Player.set_name
              |> Player.set_symbol
    player2_type = Input.gets("Enter player type (computer/human): ") |> String.upcase
    player2 = player2_type
              |> Player.create
              |> Player.set_name
              |> Player.set_symbol

    Game.play(Status.result(board, player1, player2))

  end
end
