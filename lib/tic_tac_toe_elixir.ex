defmodule TicTacToeElixir do
  def main(_args) do
    board = %Board{}
    board_data = board.data
    IO.puts(Board.print(board_data))
    move = String.trim(IO.gets("Enter your move:"))
    board_data = Board.update(move, board_data)
    IO.puts(Board.print(board_data))
  end
end
