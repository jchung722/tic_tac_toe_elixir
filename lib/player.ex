defmodule Player do
  defstruct symbol: "", name: ""

  def switch("O"), do: "X"

  def switch("X"), do: "O"

  def switch(_), do: {:error, "players can only be X or O"}

end
