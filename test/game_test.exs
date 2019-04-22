defmodule GameTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  describe "when game is complete" do

    test "ends game and displays winner" do
      win_board = ["X", "O", "3", "X", "O", "6", "X", "8", "9"]
      player = "O"
      assert capture_io(fn ->
               Game.play(
                 Status.over?(win_board),
                 win_board,
                 player
               )
             end) == " X | O | 3 \n---+---+---\n X | O | 6 \n---+---+---\n X | 8 | 9 \nGAME OVER! Player X WINS!\n"
    end

    test "ends game and displays tie" do
      full_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
      player = "O"
      assert capture_io(fn ->
               Game.play(
                 Status.over?(full_board),
                 full_board,
                 player
               )
             end) == " X | O | X \n---+---+---\n O | X | X \n---+---+---\n O | X | O \nGAME OVER! IT'S A TIE!\n"
    end
  end
end
