defmodule Computer do
  def random_move(board) do
    board
    |> Board.available_spots
    |> Enum.random
  end
end
