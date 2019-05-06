defmodule Computer do
  def random_move(board, seed \\ :rand.seed(:exs1024)) do
    _ = seed
    board
    |> Board.available_spots
    |> Enum.random
  end
end
