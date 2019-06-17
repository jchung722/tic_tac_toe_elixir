defmodule Status do

  def result(board, next_player, current_player) do
    cond do
      win?(board) ->
        winner = current_player
        {:win, winner, board}
      full?(board) ->
        {:tie, "IT'S A TIE!", board}
      true ->
        {:play, next_player, current_player, board}
    end
  end

  def winning_marks(board) do
    index_list = [0, 1, 2, 3, 4, 5, 6 ,7, 8]
    cond do
      check_rows(board) -> get_winners_in_row(board, index_list)
      check_columns(board) -> get_winners_in_column(board, index_list)
      check_diagonals(board) -> get_winners_in_diagonal(board, index_list)
      true -> []
    end

  end

  defp win?(board), do: check_rows(board) ||  check_columns(board) || check_diagonals(board)


  defp full?([]), do: true

  defp full?([ %Player{} | tail]), do: full?(tail)

  defp full?([_head | _tail]), do: false


  defp check_rows([]), do: false

  defp check_rows([mark, mark, mark | _tail]), do: true

  defp check_rows([_, _, _ | tail]), do: check_rows(tail)


  defp check_columns([]), do: false

  defp check_columns([mark, _, _, mark, _, _, mark | _tail]), do: true

  defp check_columns([_head | tail]), do: check_columns(tail)


  defp check_diagonals([mark, _, _, _, mark, _, _, _, mark]), do: true

  defp check_diagonals([_, _, mark, _, mark, _, mark, _, _]), do: true

  defp check_diagonals(_board), do: false


  defp get_winners_in_row([], []), do: []

  defp get_winners_in_row([mark, mark, mark | _board_tail], [index1, index2, index3 | _index_tail]) do
    [index1, index2, index3]
  end

  defp get_winners_in_row([_, _, _ | board_tail], [_index1, _index2, _index3 | index_tail]) do
    get_winners_in_row(board_tail, index_tail)
  end

  defp get_winners_in_column([], []), do: []

  defp get_winners_in_column([mark, _, _, mark, _, _, mark | _board_tail], [index1, _, _, index2, _, _, index3 | _index_tail]) do
    [index1, index2, index3]
  end

  defp get_winners_in_column([_board_head | board_tail], [_index_head | index_tail]) do
    get_winners_in_column(board_tail, index_tail)
  end

  defp get_winners_in_diagonal([mark, _, _, _, mark, _, _, _, mark], [index1, _, _, _, index2, _, _, _, index3]) do
    [index1, index2, index3]
  end

  defp get_winners_in_diagonal([_, _, mark, _, mark, _, mark, _, _], [_, _, index1, _, index2, _, index3, _, _]) do
    [index1, index2, index3]
  end

defp get_winners_in_diagonal(_board), do: []

end
