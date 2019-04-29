defmodule Input do
  def to_board_index(input) do
    {integer, _} = Integer.parse(input)
    integer - 1
  end

  def validate(input, board) do
    with {_integer, _binary} <- Integer.parse(input),
         :valid <- spot_check(input, board),
         :valid <- boundary_check(input, board)
    do
      :valid
    else
      :invalid -> :invalid
      :error -> :invalid
    end
  end

  defp spot_check(input, board) do
    input_board_index = Input.to_board_index(input)
    spot = Enum.at(board, input_board_index)
    case spot do
      "X" ->
        :invalid
      "O" ->
        :invalid
      _ ->
        :valid
    end
  end

  defp boundary_check(input, board) do
    max_boundary = Enum.count(board)
    input_board_index = Input.to_board_index(input)
    cond do
      input_board_index < max_boundary && input_board_index >= 0 ->
        :valid
      true ->
        :invalid
    end
  end


end
