defmodule TicTacToeElixir do
  def main(_args) do
    move =IO.gets("Enter your move:")
    IO.puts("Your move was #{move}")
  end
end
