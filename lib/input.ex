defmodule Input do

  def gets(prompt) do
    IO.gets(prompt) |> String.trim()
  end

  def to_board_index(move) do
    {integer, _} = Integer.parse(move)
    integer - 1
  end

  def move_validator(move, board) do
    with {_integer, _binary} <- Integer.parse(move),
         :valid <- range_check(move, board),
         :valid <- spot_check(move, board)
    do
      :valid
    else
      :invalid -> :invalid
      :error -> :invalid
    end
  end

  defp spot_check(move, board) do
    move_board_index = Input.to_board_index(move)
    spot = Enum.at(board, move_board_index)
    if is_map(spot), do: :invalid, else: :valid
  end

  defp range_check(move, board) do
    move_board_index = Input.to_board_index(move)
    max_range = Enum.count(board)
    if move_board_index < max_range && move_board_index >= 0, do: :valid, else: :invalid
  end

end
