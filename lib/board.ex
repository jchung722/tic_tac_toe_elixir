defmodule Board do
  defstruct spots: ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

  def format(board) do
    as_symbols(board) |>
    arrange_string()
  end

  def update(move, board, player) do
    case Input.move_validator(move, board) do
      :valid ->
        move_as_index = Input.to_board_index(move)
        new_board = List.replace_at(board, move_as_index, player)
        {:ok, new_board}

      :invalid ->
        {:error, "Move is invalid"}
    end
  end

  def display(formatted_board) do
    IO.puts(formatted_board)
  end

  defp as_symbols([]), do: []

  defp as_symbols([ %Player{symbol: symbol} | tail]), do: [ symbol |> green() | as_symbols(tail)]

  defp as_symbols([ head | tail ]), do: [head | as_symbols(tail)]


  defp arrange_string([]), do: ""

  defp arrange_string([ a, b, c | tail]) when tail == [], do: " #{a} | #{b} | #{c} "

  defp arrange_string([ a, b, c | tail]), do: " #{a} | #{b} | #{c} \n---+---+---\n"  <> arrange_string(tail)


  defp green(text) do
    IO.ANSI.green() <> text <> IO.ANSI.reset()
  end

end
