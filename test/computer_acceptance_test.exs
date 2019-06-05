defmodule ComputerAcceptanceTest do
  use ExUnit.Case

  defp human_make_move(move, board, human_player, computer_player) do
    result = Status.result(board, computer_player, human_player)
    case result do
      {:play, _current_player, _next_player, _board} ->
        {:ok, board} = move
                       |> Input.to_board_index
                       |> Board.update(board, human_player)
        board
      _ ->
        board
    end
  end

  defp computer_make_move(board, computer_player, human_player) do
    result = Status.result(board, computer_player, human_player)
    case result do
      {:play, _current_player, _next_player, _board} ->
        {:ok, board} = board
                       |> Computer.best_move(computer_player, human_player)
                       |> Input.to_board_index
                       |> Board.update(board, computer_player)
        board
      _ ->
        board
    end
  end

  defp human_moves_from_one_board(board) do
    Enum.map(Board.available_spots(board), &human_make_move(&1, board, %Player{type: "HUMAN"}, %Player{type: "COMPUTER", level: "HARD"}))
  end

  defp human_moves_from_all_boards(boards) do
    Enum.map(boards, &human_moves_from_one_board(&1))
    |> join_elements
  end

  defp computer_moves_from_all_boards(boards) do
    Enum.map(boards, &computer_make_move(&1, %Player{type: "COMPUTER", level: "HARD"}, %Player{type: "HUMAN"}))
  end

  defp one_round_human_first(boards) do
    human_moves_from_all_boards(boards)
    |> computer_moves_from_all_boards
  end

  defp one_round_computer_first(boards) do
    computer_moves_from_all_boards(boards)
    |> human_moves_from_all_boards
  end

  defp human_makes_first_move do
    [%Board{}.spots]
    |> one_round_human_first
    |> one_round_human_first
    |> one_round_human_first
    |> one_round_human_first
    |> one_round_human_first
  end

  defp computer_makes_first_move do
    [%Board{}.spots]
    |> one_round_computer_first
    |> one_round_computer_first
    |> one_round_computer_first
    |> one_round_computer_first
    |> one_round_computer_first
  end

  defp all_possible_boards do
    human_makes_first_move() ++ computer_makes_first_move()
  end

  defp all_outcomes do
    Enum.map(all_possible_boards(), &winner(&1))
  end

  defp join_elements([]), do: []

  defp join_elements([head | tail]), do: head ++ join_elements(tail)

  defp winner(board) do
    cond do
      row_winner(board) != "none" ->
        row_winner(board)
      column_winner(board) != "none" ->
        column_winner(board)
      diagonal_winner(board) != "none" ->
        diagonal_winner(board)
      true ->
        "draw"
    end

  end

  defp row_winner([]), do: "none"

  defp row_winner([mark, mark, mark | _tail]), do: mark

  defp row_winner([_, _, _ | tail]), do: row_winner(tail)


  defp column_winner([]), do: "none"

  defp column_winner([mark, _, _, mark, _, _, mark | _tail]), do: mark

  defp column_winner([_head | tail]), do: column_winner(tail)


  defp diagonal_winner([mark, _, _, _, mark, _, _, _, mark]), do: mark

  defp diagonal_winner([_, _, mark, _, mark, _, mark, _, _]), do: mark

  defp diagonal_winner(_board), do: "none"


  test "Unbeatable computer will always win/tie in every possible game" do
    human_player = %Player{type: "HUMAN"}
    all_outcomes = all_outcomes()

    refute human_player in all_outcomes
  end

end
