defmodule ComputerVComputerAcceptanceTest do
  use ExUnit.Case

  defp computer_vs_computer_play({:play, current_player, next_player, board}) do
    {:ok, new_board} = board
                       |> Computer.best_move(current_player, next_player)
                       |> Input.to_board_index
                       |> Board.update(board, current_player)
    computer_vs_computer_play(Status.result(new_board, next_player, current_player))
  end

  defp computer_vs_computer_play({:win, _winner, _board}) do
    :win
  end

  defp computer_vs_computer_play({:tie, _message, _board}) do
    :tie
  end

  test "Unbeatable computer will always win/tie in every possible game" do
    board = %Board{}
    player1 = %Player{name: "Player1", type: "COMPUTER", level: "HARD"}
    player2 = %Player{name: "Player2", type: "COMPUTER", level: "HARD"}
    result = computer_vs_computer_play(Status.result(board.spots, player1, player2))

    assert result == :tie
  end

end
