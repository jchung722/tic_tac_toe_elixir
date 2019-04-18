defmodule Player do

  def switch("O"), do: "X"

  def switch("X"), do: "O"

  def switch(_), do: {:error, "players can only be X or O"}

end
