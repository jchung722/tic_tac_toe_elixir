defmodule Player do
  defstruct symbol: "", name: ""

  def create(player) do
    player_name = console_input_name(player)
    player_symbol = console_input_symbol(player)
    %Player{name: player_name, symbol: player_symbol}
  end

  defp console_input_name(player) do
    player_name = Input.gets("#{player}, Enter your name:")
    cond do
      String.trim(player_name) == "" ->
        player
      true ->
        player_name
    end
  end

  defp console_input_symbol(player) do
    symbol = Input.gets("#{player}, Enter your symbol:")
    case Input.validate(symbol) do
      :valid ->
        symbol
      :invalid ->
        IO.puts("Invalid symbol. Must be single alphanumeric character.")
        console_input_symbol(player)
    end
  end

end
