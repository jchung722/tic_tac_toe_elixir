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
    move = Input.gets("Enter your move, #{current_player.name}:") |> Input.to_board_index()

    case Board.update(move, board, current_player) do
      {:ok, new_board} ->
        play(Status.result(new_board, next_player, current_player))

      {:error, message} ->
        IO.puts("#{message}. Enter a valid move."); :timer.sleep(1000)
        play(Status.result(board, current_player, next_player))
    end
  end

  defp clear_display(), do: IO.puts(IO.ANSI.clear())
end
