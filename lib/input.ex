defmodule Input do
  def to_board_index(input) do
    {integer, _} = Integer.parse(input)
    integer - 1
  end

  def validate(input, board) do
    with {_integer, _binary} <- Integer.parse(input),
         :valid <- spot_check(input,board)
    do
      :valid
    else
      :invalid -> :invalid
      :error -> :invalid
    end
  end

  defp spot_check(input, board) do
    input_board_index = Input.to_board_index(input)
    cond do
      Enum.at(board, input_board_index) == "X" ->
        :invalid
      Enum.at(board, input_board_index) == "O" ->
        :invalid
      true ->
        :valid
    end
  end


end
