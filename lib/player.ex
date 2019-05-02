defmodule Player do
  defstruct symbol: "", name: "", type: ""

  def create(player) do
    player_type = console_input_type(player)
    player_name =
      case player_type do
        "COMPUTER" -> player_type
        "HUMAN" -> console_input_name(player)
      end
    player_symbol = console_input_symbol(player_name)
    %Player{name: player_name, symbol: player_symbol, type: player_type}
  end

  defp console_input_type(player) do
    player_type = Input.gets("Enter #{player} type (computer/human): ")
    case type_validator(player_type) do
      :valid ->
        String.upcase(player_type)
      :invalid ->
        IO.puts("Invalid type. Must be either computer or human")
        console_input_type(player)
    end
  end

  defp console_input_name(player) do
    player_name = Input.gets("#{player}, Enter your name: ")
    if String.trim(player_name) == "", do: player, else: player_name
  end

  defp console_input_symbol(player) do
    symbol = Input.gets("#{player}, Enter your symbol: ")
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

  def type_validator(type) do
    type = String.upcase(type)
    case type do
      "COMPUTER" -> :valid
      "HUMAN" -> :valid
      _ -> :invalid
    end
  end

end
