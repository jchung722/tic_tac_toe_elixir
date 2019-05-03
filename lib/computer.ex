defmodule Computer do
  def random_move(board) do
    Board.available_spots(board) |>
    Enum.random()
  end
end
