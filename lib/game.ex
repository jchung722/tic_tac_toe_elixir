defmodule Game do

  def play({:win, winner, board}) do
    clear_display()
    Board.display(Board.format(board))
    IO.puts("GAME OVER! #{winner.name} WINS!")
  end

  def play({:tie, message, board}) do
    clear_display()
    Board.display(Board.format(board))
    IO.puts("GAME OVER! #{message}")
  end

  def play({:play, current_player, next_player, board}) do
    clear_display()
    Board.display(Board.format(board))
    input = Input.gets("Enter your move, #{current_player.name}:")

    case Input.validate(input, board, current_player, next_player) do
      :valid ->
        new_board = Input.to_board_index(input) |> Board.update(board, current_player)
        play(Status.result(new_board, next_player, current_player))

      :invalid ->
        IO.puts("Input is invalid. Enter a valid move."); :timer.sleep(1000)
        play(Status.result(board, current_player, next_player))
    end

  end

  defp clear_display(), do: IO.puts(IO.ANSI.clear())
end
