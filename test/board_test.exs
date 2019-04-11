defmodule Board do
  use ExUnit.Case
  doctest Board

  describe "in a new game" do
    setup do
      [board: ["1", "2", "3", "4", "5", "6", "7", "8", "9"]]
    end

    test "board should be empty", context do
      board_data = %Board{}
      assert board_data.data == context[:board]
    end
  end
end
