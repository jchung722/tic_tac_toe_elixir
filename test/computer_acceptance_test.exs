defmodule ComputerAcceptanceTest do
  use ExUnit.Case

  defp make_move(move, board, %Player{type: "HUMAN"}, computer_player) do
    result = Status.result(board, human_player, computer_player)
    case result do
      {:play, _current_player, _next_player, _board} ->
        Board.update(move, board, human_player)
      _ ->
        board
    end
  end

  defp make_move(move, board, %Player{type: "COMPUTER", level: "HARD", type: "CURRENT"}, human_player) do
    result = Status.result(board, computer_player, human_player)
    case result do
      {:play, }
    end
  end
  test "Unbeatable computer will always win/tie in every possible game" do
    # human_first_winners
    # computer_first_winners
    # all_winners = player_first_winners ++ computer_first_winners

    # refute %Player{type: "HUMAN"} in all_winners
  end

end
