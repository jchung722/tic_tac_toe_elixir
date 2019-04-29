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

end
