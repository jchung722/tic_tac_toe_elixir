defmodule PlayerTest do
  use ExUnit.Case
  doctest Player

  test "a current player X will switch to player O" do
    current_player = "X"
    assert Player.switch(current_player) == "O"
  end

  test "a current player O wills switch to player X" do
    current_player = "O"
    assert Player.switch(current_player) == "X"
  end

end
