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

  test "a player can be human" do
    player = %Player{type: "human"}
    assert player.type == "human"
  end

  test "a player can be a computer" do
    player = %Player{type: "computer"}
    assert player.type == "computer"
  end

  describe "player symbol is valid" do
    test "when it is a single alphabetical character" do
      player_symbol = "X"
      assert Player.symbol_validator(player_symbol) == :valid
    end

    test "when it is a single numeric character" do
      player_symbol = "7"
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

  test "human player type is valid" do
    player_type = "Human"
    assert Player.type_validator(player_type) == :valid
  end

  test "computer player type is valid" do
    player_type = "Computer"
    assert Player.type_validator(player_type) == :valid
  end

  test "any player type that is neither human or computer is invalid" do
    player_type = "something_else"
    assert Player.type_validator(player_type) == :invalid
  end

end
