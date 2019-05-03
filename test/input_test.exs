defmodule InputTest do
  use ExUnit.Case

  test "turns integer input into board index" do
    assert Input.to_board_index("1") == 0
  end

  test "an empty input can not be turned into board index" do
    input = ""
    assert Input.to_board_index(input) == -1
  end

  test "a character input can not be turned into board index" do
    input = "e"
    assert Input.to_board_index(input) == -1
  end

  test "a decimal can not be turned into board index" do
    input = "5.2"
    assert Input.to_board_index(input) == -1
  end

end
