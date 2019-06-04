defmodule Player do
  defstruct symbol: "", name: "", type: "", level: "", turn: ""

  def create("COMPUTER_EASY") do
    %Player{type: "COMPUTER", level: "EASY"}
  end

  def create("COMPUTER_HARD") do
    %Player{type: "COMPUTER", level: "HARD"}
  end

  def create("HUMAN") do
    %Player{type: "HUMAN"}
  end

  def create(_other) do
    IO.puts("Invalid type. Must be either computer or human")
    type_input = Input.get_player_type
    create(type_input)
  end

  def set_name(player) do
    player_name = Input.gets("Enter player name: ")
    case name_validator(player_name) do
      :valid ->
        %{player | name: player_name}
      :invalid ->
        IO.puts("Name cannot be empty.")
        set_name(player)
    end
  end

  def set_symbol(player) do
    symbol = Input.gets("Enter player symbol: ")
    case symbol_validator(symbol) do
      :valid ->
        %{player | symbol: symbol}
      :invalid ->
        IO.puts("Invalid symbol. Must be single alphanumeric character.")
        set_symbol(player)
    end
  end

  def name_validator(name) do
    if String.trim(name) == "", do: :invalid, else: :valid
  end

  def symbol_validator(symbol) do
    if Regex.match?(~r/^[a-zA-Z0-9]$/, symbol), do: :valid, else: :invalid
  end

end
