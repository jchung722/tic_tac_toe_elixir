defmodule Input do

  def gets(prompt) do
    IO.gets(prompt) |> String.trim()
  end

  def to_board_index(move) do
    case Integer.parse(move) do
      {integer, ""} -> integer - 1
      _ -> -1
    end
  end

end
