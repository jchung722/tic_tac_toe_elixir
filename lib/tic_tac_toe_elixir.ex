defmodule TicTacToeElixir do
  def main(_args) do

    board = %Board{}.spots
    player1_type = Input.get_player_type
    player1 = player1_type
              |> Player.create
              |> Player.set_name
              |> Player.set_symbol
    player2_type = Input.get_player_type
    player2 = player2_type
              |> Player.create
              |> Player.set_name
              |> Player.set_symbol

    Game.play(Status.result(board, player1, player2))

  end
end
