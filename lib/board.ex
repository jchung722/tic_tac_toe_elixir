defmodule Board do
  defstruct spots: ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

  def format(board) do
    as_symbols(board) |>
    arrange_string()
  end

  def update(move_as_index, board, player) do
    List.replace_at(board, move_as_index, player)
  end

  def display(formatted_board) do
    IO.puts(formatted_board)
  end

  defp as_symbols([]), do: []

  defp as_symbols([head | tail]) do
    cond do
      is_map(head) ->
        [ head.symbol | as_symbols(tail)]
      true ->
        [head | as_symbols(tail)]
    end
  end

  defp arrange_string([]), do: ""

  defp arrange_string([ a, b, c | tail]) do

    cond do
      tail == [] ->
        " #{a} | #{b} | #{c} "
      true ->
        " #{a} | #{b} | #{c} \n---+---+---\n"  <> format(tail)
    end
  end

end
