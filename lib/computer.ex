defmodule Computer do
  def random_move(board, seed \\ :rand.seed(:exs1024)) do
    _set_random_seed = seed
    board
    |> Board.available_spots
    |> Enum.random
  end

  def minimax(board, current_player, next_player) do
    untagged_current_player = untag(current_player)
    available_spots = Board.available_spots(board)

    moves = Enum.map(available_spots, fn spot ->
      {:ok, new_board} = spot
                         |> Input.to_board_index
                         |> Board.update(board, untagged_current_player)
      result = Status.result(new_board, next_player, current_player)
      case result do
        {:win, %Player{type: "COMPUTER", level: "HARD", turn: "CURRENT"}, _board} ->
          %{move: spot, score: 10}
        {:win, _opponent, _board} ->
          %{move: spot, score: -10}
        {:tie, _message, _board} ->
          %{move: spot, score: 0}
        {:play, next_player, current_player, _board} ->
          score = minimax(new_board, next_player, current_player).score
          %{move: spot, score: score}
      end
    end)

    case current_player do
      %Player{type: "COMPUTER", level: "HARD", turn: "CURRENT"} ->
        maximizer(moves)
      _opponent ->
        minimizer(moves)
    end

  end

  defp untag(player) do
    %{player | turn: ""}
  end

  defp maximizer(moves) do
    Enum.max_by(moves, fn x -> x.score end)
  end

  defp minimizer(moves) do
    Enum.min_by(moves, fn x -> x.score end)
  end

end
