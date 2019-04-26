defmodule Game do

  def play({:win, winner, board}) do
    clear_display()
    Board.display(Board.format(board))
    IO.puts("GAME OVER! Player #{winner} WINS!")
  end

  def play({:tie, message, board}) do
    clear_display()
    Board.display(Board.format(board))
    IO.puts("GAME OVER! #{message}")
  end

  def play({:play, current_player, board}) do
    clear_display()
    Board.display(Board.format(board))
    input = IO.gets("Enter your move, Player #{current_player}:")

    case Input.validate(input, board) do
      :valid ->
        new_board = Input.to_board_index(input) |> Board.update(board, current_player)
        next_player = Player.switch(current_player)
        play(Status.result(new_board, next_player))

      :invalid ->
        IO.puts("Input is invalid. Enter a valid move."); :timer.sleep(1000)
        play(Status.result(board, current_player))
    end

  end

  defp clear_display(), do: IO.puts(IO.ANSI.clear())
end
