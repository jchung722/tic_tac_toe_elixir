defmodule Game do
  def play(true, board, player) do
    IO.puts(Board.format(board))
    cond do
      Status.win?(board) ->
        last_player = Player.switch(player)
        IO.puts("GAME OVER! Player #{last_player} WINS!")
      Status.tie?(board) ->
        IO.puts("GAME OVER! IT'S A TIE!")
    end
  end

  def play(false, board, player) do
    IO.puts(Board.format(board))
    move = IO.gets("Enter your move, player #{player}:") |> Input.process

    case move do
      {:ok, processed_move} ->
        new_board = Board.update(processed_move, board, player)
        next_player = Player.switch(player)
        play(Status.over?(new_board), new_board, next_player)

      {:error, error_message} ->
        IO.puts("#{error_message} Enter a valid move.")
        play(Status.over?(board), board, player)
    end

  end
end
