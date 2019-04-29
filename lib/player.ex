defmodule Player do
  defstruct symbol: "", name: ""

  def set_name(player) do
    player_name = Input.gets("#{player}, Enter your name:")
    player_symbol = Input.gets("#{player}, Enter your symbol:")
    %Player{name: player_name, symbol: player_symbol}
  end

  def validate_symbol(symbol) do
    cond do
      String.length(symbol) > 1 ->
        :invalid
      symbol == "" ->
        :invalid
    end
  end

  # def switch("O"), do: "X"

  # def switch("X"), do: "O"

  # def switch(_), do: {:error, "players can only be X or O"}

end
