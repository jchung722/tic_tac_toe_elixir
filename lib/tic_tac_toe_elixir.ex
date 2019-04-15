defmodule TicTacToeElixir do
  def main(_args) do
    #Initializes empty board and starts with player X
    board = %Board{}
    board_data = board.data
    player = "X"

    IO.puts(Board.print(board_data))
    move = String.trim(IO.gets("Enter your move player #{player}:"))
    board_data = Board.update(move, board_data)
    player = Player.switch(player)
    IO.puts("Time for player #{player}")
    IO.puts(Board.print(board_data))
  end
end
