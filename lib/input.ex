defmodule Input do

  def gets(prompt) do
    IO.gets(prompt) |> String.trim()
  end

  def to_board_index(move) do
    {integer, _} = Integer.parse(move)
    integer - 1
  end

  def validate(move, board, player1, player2) do
    with {_integer, _binary} <- Integer.parse(move),
         :valid <- spot_check(move, board, player1, player2),
         :valid <- boundary_check(move, board)
    do
      :valid
    else
      :invalid -> :invalid
      :error -> :invalid
    end
  end

  def validate(symbol) do
    cond do
      Regex.match?(~r/^[a-zA-Z0-9]$/, symbol) ->
        :valid
      true ->
        :invalid
    end
  end

  defp spot_check(move, board, player1, player2) do
    move_board_index = Input.to_board_index(move)
    spot = Enum.at(board, move_board_index)
    cond do
      spot == player1.symbol || spot == player2.symbol ->
        :invalid
      true ->
        :valid
    end
  end

  defp boundary_check(move, board) do
    move_board_index = Input.to_board_index(move)
    max_boundary = Enum.count(board)
    cond do
      move_board_index < max_boundary && move_board_index >= 0 ->
        :valid
      true ->
        :invalid
    end
  end

end
