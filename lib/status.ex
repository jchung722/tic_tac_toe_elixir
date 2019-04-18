defmodule Status do
  def tie?([]), do: true

  def tie?(["X" | tail]), do: tie?(tail)

  def tie?(["O" | tail]), do: tie?(tail)

  def tie?([_head | _tail]), do: false


  def win?(board), do: check_rows(board) ||  check_columns(board) || check_diagonals(board)


  defp check_rows([]), do: false

  defp check_rows([a, a, a | _tail]), do: true

  defp check_rows([_, _, _ | tail]), do: check_rows(tail)


  defp check_columns([]), do: false

  defp check_columns([a, _, _, a, _, _, a | _tail]), do: true

  defp check_columns([_head | tail]), do: check_columns(tail)


  defp check_diagonals([a, _, _, _, a, _, _, _, a]), do: true

  defp check_diagonals([_, _, a, _, a, _, a, _, _]), do: true

  defp check_diagonals(_board), do: false


  def over?(board) do
    win?(board) || tie?(board)
  end
end
