defmodule TicTacToeElixir do
  def main(_args) do
    board = %Board{}
    IO.puts(Board.print_board(board.data))
    _move =IO.gets("Enter your move:")
  end
end
