defmodule Status do
  def tie?([]), do: true

  def tie?(["X" | tail]), do: tie?(tail)

  def tie?(["O" | tail]), do: tie?(tail)

  def tie?([_head | _tail]), do: false


  def win?(board), do: check_rows(board) ||  check_columns(board) || check_diagonals(board)


  defp check_rows([]), do: false

  defp check_rows([mark, mark, mark | _tail]), do: true

  defp check_rows([_, _, _ | tail]), do: check_rows(tail)


  defp check_columns([]), do: false

  defp check_columns([mark, _, _, mark, _, _, mark | _tail]), do: true

  defp check_columns([_head | tail]), do: check_columns(tail)


  defp check_diagonals([mark, _, _, _, mark, _, _, _, mark]), do: true

  defp check_diagonals([_, _, mark, _, mark, _, mark, _, _]), do: true

  defp check_diagonals(_board), do: false


  def over?(board) do
    win?(board) || tie?(board)
  end

  def result(board, next_player) do
    cond do
      win?(board) ->
        winner = Player.switch(next_player)
        {:win, winner, board}
      tie?(board) ->
        {:tie, "IT'S A TIE!", board}
      true ->
        {:play, next_player, board}
    end
  end
end
