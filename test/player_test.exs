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
    assert Player.human_player() == %Player{type: "HUMAN"}
  end

  test "a player can be a computer" do
    assert Player.computer_player() == %Player{type: "COMPUTER"}
  end

  test "a computer player type input is valid" do
    type_input = "COMPUTER"
    assert Player.type_validator(type_input) == :valid
  end

  test "a human player type input is valid" do
    type_input = "HUMAN"
    assert Player.type_validator(type_input) == :valid
  end

  test "a player type input that is not a computer or human is invalid" do
    type_input = "WIZARD"
    assert Player.type_validator(type_input) == :invalid
  end

  test "a player name cannot be empty" do
    name_input = ""
    assert Player.name_validator(name_input) == :invalid
  end

  test "any non empty player name is valid" do
    name_input = "Jane"
    assert Player.name_validator(name_input) == :valid
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

end
