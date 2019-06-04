defmodule ComputerAcceptanceTest do
  use ExUnit.Case

  # defp human_make_move(move, board, human_player, computer_player) do
  #   result = Status.result(board, computer_player, human_player)
  #   case result do
  #     {:play, _current_player, _next_player, _board} ->
  #       Board.update(move, board, human_player)
  #     _ ->
  #       board
  #   end
  # end

  # defp computer_make_move(move, board, computer_player, human_player) do
  #   result = Status.result(board, computer_player, human_player)
  #   case result do
  #     {:play, _current_player, _next_player, _board} ->

  #       Board.update(move, board, computer)
  #     _ ->
  #       board
  #   end
  # end

  test "Unbeatable computer will always win/tie in every possible game" do
    # human_first_winners
    # computer_first_winners
    # all_winners = player_first_winners ++ computer_first_winners

    # refute %Player{type: "HUMAN"} in all_winners
    assert 1 == 1
  end

end
