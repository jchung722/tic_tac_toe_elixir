defmodule TicTacToeElixir do
  def main(_args) do
    #Initializes empty board and starts with player X
    board = %Board{}
    board_data = board.data
    player = "X"
    IO.puts(Board.print(board_data))

    IO.gets("Enter your move, player #{player}:") |>
    String.trim |>
    Board.update(board_data) |>
    Board.print |>
    IO.puts()

    player = Player.switch(player)
    IO.puts("Time for player #{player}")
  end
end
