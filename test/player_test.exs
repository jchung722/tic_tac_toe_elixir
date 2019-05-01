defmodule PlayerTest do
  use ExUnit.Case

  test "a player can have a set name" do
    player = %Player{name: "Player1"}
    assert player.name == "Player1"
  end

  test "a player can have a set symbol" do
    player = %Player{symbol: "X"}
    assert player.symbol == "X"
  end

  describe "player symbol is valid" do
    test "when it is a single alphanumeric characters" do
      player_symbol = "X"
      assert Player.symbol_validator(player_symbol) == :valid
    end
  end

  describe "player symbol is invalid" do

    test "when it is empty" do
      player_symbol = ""
      assert Player.symbol_validator(player_symbol) == :invalid
    end

    test "when longer than one character" do
      player_symbol = "OOO"
      assert Player.symbol_validator(player_symbol) == :invalid
    end

    test "when not alphanumeric" do
      player_symbol = "&"
      assert Player.symbol_validator(player_symbol) == :invalid
    end
  end

end
