defmodule Player do
  defstruct symbol: "", name: "", type: ""

  def create("COMPUTER") do
    player = computer_player()
    player_name = set_name()
    player_symbol = set_symbol()
    %Player{ player | name: player_name, symbol: player_symbol}
  end

  def create("HUMAN") do
    player = human_player()
    player_name = set_name()
    player_symbol = set_symbol()
    %Player{ player | name: player_name, symbol: player_symbol}
  end

  def create(_other) do
    :error
  end

  def human_player(), do: %Player{type: "HUMAN"}

  def computer_player(), do: %Player{type: "COMPUTER"}

  def set_type() do
    player_type = Input.gets("Enter player type (computer/human): ") |> String.upcase
    case type_validator(player_type) do
      :valid ->
        player_type
      :invalid ->
        IO.puts("Invalid type. Must be either computer or human")
        set_type()
    end
  end

  defp set_name() do
    player_name = Input.gets("Enter player name: ")
    case name_validator(player_name) do
      :valid ->
        player_name
      :invalid ->
        IO.puts("Name cannot be empty.")
        set_name()
    end
  end

  defp set_symbol() do
    symbol = Input.gets("Enter player symbol: ")
    case symbol_validator(symbol) do
      :valid ->
        symbol
      :invalid ->
        IO.puts("Invalid symbol. Must be single alphanumeric character.")
        set_symbol()
    end
  end

  def type_validator(type) do
    case type do
      "COMPUTER" -> :valid
      "HUMAN" -> :valid
      _other -> :invalid
    end
  end

  def name_validator(name) do
    if String.trim(name) == "", do: :invalid, else: :valid
  end

  def symbol_validator(symbol) do
    if Regex.match?(~r/^[a-zA-Z0-9]$/, symbol), do: :valid, else: :invalid
  end

end
