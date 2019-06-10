defmodule Input do

  def gets(prompt) do
    IO.gets(prompt)
    |> String.trim()
  end

  def get_player_type() do
    gets("Enter player type (computer/human): ")
    |> String.upcase
    |> get_player_type
  end

  def get_player_type("COMPUTER") do
    level = gets("Choose computer level (easy/hard): ")
            |> String.upcase

    if level != "HARD" && level != "EASY" do
      IO.puts("Invalid computer level.")
      get_player_type("COMPUTER")
    else
      get_player_type("COMPUTER_#{level}")
    end
  end

  def get_player_type(type) do
    type
  end

  def to_board_index(move) do
    case Integer.parse(move) do
      {integer, ""} -> integer - 1
      _ -> -1
    end
  end

end
