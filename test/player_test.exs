defmodule PlayerTest do
  use ExUnit.Case

  test "a player can have a set name" do
    player = %Player{name: "Player1"}
    assert player.name == "Player1"
  end

  test "a player can have a set symbol" do
    player = %Player{symbol: "*"}
    assert player.symbol == "*"
  end

  test "a current player X will switch to player O" do
    current_player = "X"
    assert Player.switch(current_player) == "O"
  end

  test "a current player O will switch to player X" do
    current_player = "O"
    assert Player.switch(current_player) == "X"
  end

  test "if the player is not X or O, switching players will create an error" do
    current_player = "A"
    assert Player.switch(current_player) == {:error, "players can only be X or O"}
  end

end
