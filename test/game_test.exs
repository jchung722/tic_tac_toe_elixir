defmodule GameTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

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
             end) == " X | O | 3 \n---+---+---\n X | O | 6 \n---+---+---\n X | 8 | 9 \nGAME OVER\n"
    end
  end
end
