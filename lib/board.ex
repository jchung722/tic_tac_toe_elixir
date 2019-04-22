defmodule Board do
  defstruct spots: ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

  def format([]), do: ""

  def format([ a, b, c | tail]) do
    cond do
      tail == [] ->
        " #{a} | #{b} | #{c} "
      true ->
        " #{a} | #{b} | #{c} \n---+---+---\n"  <> format(tail)
    end
  end

  def update(move, board, player) do
    move_index = move - 1
    List.replace_at(board, move_index, player)
  end

  def display(board) do
    IO.puts(IO.ANSI.clear())
    IO.puts(Board.format(board))
  end
end
