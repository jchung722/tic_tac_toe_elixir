defmodule Game do

  def play({:win, winner, board}) do
    clear_display()
    show_board(board)
    IO.puts("GAME OVER! #{winner.name} WINS!")
  end

  def play({:tie, message, board}) do
    clear_display()
    show_board(board)
    IO.puts("GAME OVER! #{message}")
  end

  def play({:play, current_player = %Player{type: "COMPUTER", level: "EASY"}, next_player, board}) do
    {:ok, new_board} = board
                       |> Computer.random_move
                       |> Input.to_board_index
                       |> Board.update(board, current_player)
    play(Status.result(new_board, next_player, current_player))
  end

  def play({:play, current_player = %Player{type: "COMPUTER", level: "HARD"}, next_player, board}) do
    {:ok, new_board} = board
                       |> Computer.best_move(current_player, next_player)
                       |> Input.to_board_index
                       |> Board.update(board, current_player)
    play(Status.result(new_board, next_player, current_player))
  end

  def play({:play, current_player, next_player, board}) do
    clear_display()
    show_board(board)
    board_update = Input.gets("Enter your move, #{current_player.name}:")
                   |> Input.to_board_index
                   |> Board.update(board, current_player)

    case board_update do
      {:ok, new_board} ->
        play(Status.result(new_board, next_player, current_player))

      {:error, message} ->
        IO.puts("#{message}. Enter a valid move."); :timer.sleep(1000)
        play(Status.result(board, current_player, next_player))
    end
  end

  defp clear_display(), do: IO.puts(IO.ANSI.clear())

  defp show_board(board) do
    board
    |> Board.format
    |> Board.display
  end
end
