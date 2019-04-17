defmodule Status do
  def tie?([]), do: true

  def tie?(["X" | tail]), do: tie?(tail)

  def tie?(["O" | tail]), do: tie?(tail)

  def tie?([_head | _tail]), do: false

  def win?(board) do
    cond do
      check_row(board) ->
        true

      Enum.at(board, 0) == Enum.at(board, 3) && Enum.at(board, 3) == Enum.at(board, 6) ->
        true

      Enum.at(board, 1) == Enum.at(board, 4) && Enum.at(board, 4) == Enum.at(board, 7) ->
        true

      Enum.at(board, 2) == Enum.at(board, 5) && Enum.at(board, 5) == Enum.at(board, 8) ->
        true

      Enum.at(board, 0) == Enum.at(board, 4) && Enum.at(board, 4) == Enum.at(board, 8) ->
        true

      Enum.at(board, 2) == Enum.at(board, 4) && Enum.at(board, 4) == Enum.at(board, 6) ->
        true

      true ->
        false
    end
  end

  defp check_row([]), do: false

  defp check_row([a, a, a | _tail]), do: true

  defp check_row([_, _, _ | tail]), do: check_row(tail)

  def over?(board) do
    win?(board) || tie?(board)
  end
end
