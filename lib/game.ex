defmodule Game do

  def has_tie?([]), do: true

  def has_tie?([ "X" | tail]), do: has_tie?(tail)

  def has_tie?([ "O" | tail]), do: has_tie?(tail)

  def has_tie?([ _head | _tail]), do: false

  def has_winner?(board) do
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

  def check_row([]), do: false

  def check_row([a, a, a | _tail]), do: true

  def check_row([_, _, _ | tail]), do: check_row(tail)

end
