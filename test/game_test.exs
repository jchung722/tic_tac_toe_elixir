defmodule GameTest do
  use ExUnit.Case
  doctest Game

  import ExUnit.CaptureIO

  describe "when game is almost complete" do
    setup do
      [nearly_full_board: ["X", "O", "3", "X", "O", "6", "7", "8", "9"], player: "O"]
    end

    @tag :skip
    test "a move that makes three in a row ends game", context do
      assert capture_io(fn ->
               Game.play(
                 Status.over?(context[:nearly_full_board]),
                 context[:full_board],
                 context[:player]
               )
             end) == "| X | O | 3 |\n| X | O | 6 |\n| X | 8 | 9 |\nGAME OVER\n"
    end
  end

  describe "when game is complete" do
    setup do
      [full_board: ["X", "O", "3", "X", "O", "6", "X", "8", "9"], player: "O"]
    end

    test "ends game", context do
      assert capture_io(fn ->
               Game.play(
                 Status.over?(context[:full_board]),
                 context[:full_board],
                 context[:player]
               )
             end) == "| X | O | 3 |\n| X | O | 6 |\n| X | 8 | 9 |\nGAME OVER\n"
    end
  end
end
