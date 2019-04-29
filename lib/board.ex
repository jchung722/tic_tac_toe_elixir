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

  def update(move_as_index, board, player) do
    List.replace_at(board, move_as_index, player)
  end

  def display(formatted_board) do
    IO.puts(formatted_board)
  end
end
