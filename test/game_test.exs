defmodule GameTest do
  use ExUnit.Case
  doctest Game

  import ExUnit.CaptureIO

  describe "when game is almost complete" do

    @tag :skip
    test "a move that makes three in a row ends game" do
      nearly_full_board = ["X", "O", "3", "X", "O", "6", "7", "8", "9"]
      player = "O"
      assert capture_io(fn ->
               Game.play(
                 Status.over?(nearly_full_board),
                 nearly_full_board,
                 player
               )
             end) == " X | O | 3 \n--- --- ---\n X | O | 6 \n--- --- ---\n X | 8 | 9 \nGAME OVER\n"
    end
  end

  describe "when game is complete" do

    test "ends game" do
      full_board = ["X", "O", "3", "X", "O", "6", "X", "8", "9"]
      player = "O"
      assert capture_io(fn ->
               Game.play(
                 Status.over?(full_board),
                 full_board,
                 player
               )
             end) == " X | O | 3 \n--- --- ---\n X | O | 6 \n--- --- ---\n X | 8 | 9 \nGAME OVER\n"
    end
  end
end
