defmodule Player do
  defstruct symbol: "", name: ""

  def create(player) do
    player_name = console_input_name(player)
    player_symbol = console_input_symbol(player)
    %Player{name: player_name, symbol: player_symbol}
  end

  defp console_input_name(player) do
    player_name = Input.gets("#{player}, Enter your name:")
    if String.trim(player_name) == "", do: player, else: player_name
  end

  defp console_input_symbol(player) do
    symbol = Input.gets("#{player}, Enter your symbol:")
    case symbol_validator(symbol) do
      :valid ->
        symbol
      :invalid ->
        IO.puts("Invalid symbol. Must be single alphanumeric character.")
        console_input_symbol(player)
    end
  end

  def symbol_validator(symbol) do
    if Regex.match?(~r/^[a-zA-Z0-9]$/, symbol), do: :valid, else: :invalid
  end

end
