defmodule Player do
  defstruct symbol: "", name: ""

  def create(player) do
    player_name = Input.gets("#{player}, Enter your name:")
    player_symbol = get_symbol(player)
    %Player{name: player_name, symbol: player_symbol}
  end

  defp get_symbol(player) do
    symbol = Input.gets("#{player}, Enter your symbol:")
    case Input.validate(symbol) do
      :valid ->
        symbol
      :invalid ->
        IO.puts("Invalid symbol. Must be single alphanumeric character."); :timer.sleep(1000)
        get_symbol(player)
    end
  end

end
