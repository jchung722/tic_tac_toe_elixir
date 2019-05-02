defmodule Board do
  defstruct spots: ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

  def format(board) do
    as_symbols(board) |>
    arrange_string()
  end

  def display(formatted_board) do
    IO.puts(formatted_board)
  end

  def update(move, board, player) do
    case move_validator(move, board) do
      :valid ->
        new_board = List.replace_at(board, move, player)
        {:ok, new_board}

      :invalid ->
        {:error, "Move is invalid"}
    end
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

  defp move_validator(move, board) do
    with :valid <- range_check(move, board),
         :valid <- spot_check(move, board)
    do
      :valid
    else
      :invalid -> :invalid
      :error -> :invalid
    end
  end

  defp spot_check(move, board) do
    spot = Enum.at(board, move)
    if is_map(spot), do: :invalid, else: :valid
  end

  defp range_check(move, board) do
    max_range = Enum.count(board)
    if move < max_range && move >= 0, do: :valid, else: :invalid
  end

end
