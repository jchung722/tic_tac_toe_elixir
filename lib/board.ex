defmodule Board do
  defstruct data: ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

  def build([]), do: ""

  def build([ a, b, c | tail]) do
    cond do
      tail == [] ->
        " #{a} | #{b} | #{c} "
      true ->
        " #{a} | #{b} | #{c} \n--- --- ---\n"  <> build(tail)
    end
  end

  def update(move, board_data, player) do
    move_index = String.to_integer(move) - 1
    List.replace_at(board_data, move_index, player)
  end
end
