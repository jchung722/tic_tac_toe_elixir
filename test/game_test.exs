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
             end) == "\e[2J\n \e[32mX\e[0m | \e[32mO\e[0m | 3 \n---+---+---\n \e[32mX\e[0m | \e[32mO\e[0m | 6 \n---+---+---\n \e[32mX\e[0m | 8 | 9 \nGAME OVER! playerX WINS!\n"
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
             end) == "\e[2J\n \e[32mX\e[0m | \e[32mO\e[0m | \e[32mX\e[0m \n---+---+---\n \e[32mO\e[0m | \e[32mX\e[0m | \e[32mX\e[0m \n---+---+---\n \e[32mO\e[0m | \e[32mX\e[0m | \e[32mO\e[0m \nGAME OVER! IT'S A TIE!\n"
    end
  end
end
