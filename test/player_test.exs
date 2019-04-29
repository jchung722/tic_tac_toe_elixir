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

end
