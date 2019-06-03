defmodule Computer do
  def random_move(board, seed \\ :rand.seed(:exs1024)) do
    _set_random_seed = seed
    board
    |> Board.available_spots
    |> Enum.random
  end

  def minimax(board, current_player, next_player) do
    available_spots = Board.available_spots(board)
    moves = Enum.map(available_spots, fn spot ->
      {:ok, new_board} = Input.to_board_index(spot) |> Board.update(board, current_player)
      result = Status.result(new_board, next_player, current_player)
      case result do
        {:win, %Player{type: "COMPUTER", level: "HARD"}, _board} ->
          %{move: spot, score: 10}
        {:win, _beatable_player, _board} ->
          %{move: spot, score: -10}
        {:tie, _message, _board} ->
          %{move: spot, score: 0}
        {:play, next_player, current_player, _board} ->
          score = minimax(new_board, next_player, current_player).score
          %{move: spot, score: score}
      end
    end)

    case current_player do
      %Player{type: "COMPUTER", level: "HARD"} ->
        maximizer(moves)
      _beatable_player ->
        minimizer(moves)
    end

  end

  defp maximizer(moves) do
    Enum.max_by(moves, fn x -> x.score end)
  end

  defp minimizer(moves) do
    Enum.min_by(moves, fn x -> x.score end)
  end

end
