defmodule Status do

  def tie?([], _player1, _player2), do: true

  def tie?([head | tail], player1, player2) do
    cond do
      head == player1 || head == player2 ->
        tie?(tail, player1, player2)
      true ->
        false
    end
  end


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

  def result(board, next_player, current_player) do
    cond do
      win?(board) ->
        winner = current_player
        {:win, winner, board}
      tie?(board, next_player, current_player) ->
        {:tie, "IT'S A TIE!", board}
      true ->
        {:play, next_player, current_player, board}
    end
  end
end
