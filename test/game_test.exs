defmodule GameTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  describe "when game is complete" do

    test "ends game and displays winner" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      win_board = [playerX, playerO, "3",
                   playerX, playerO, "6",
                   playerX, "8", "9"]
      assert capture_io(fn ->
               Game.play(
                 Status.result(win_board, playerO, playerX)
               )
             end) == "\e[2J\n X | O | 3 \n---+---+---\n X | O | 6 \n---+---+---\n X | 8 | 9 \nGAME OVER! playerX WINS!\n"
    end

    test "ends game and displays tie" do
      playerX = %Player{name: "playerX", symbol: "X"}
      playerO = %Player{name: "playerO", symbol: "O"}
      full_board = [playerX, playerO, playerX,
                    playerO, playerX, playerX,
                    playerO, playerX, playerO]
      assert capture_io(fn ->
               Game.play(
                 Status.result(full_board, playerO, playerX)
               )
             end) == "\e[2J\n X | O | X \n---+---+---\n O | X | X \n---+---+---\n O | X | O \nGAME OVER! IT'S A TIE!\n"
    end
  end
end
