defmodule Game do

  def play({:win, winner, board}, _player) do
    Board.display(board)
    IO.puts("GAME OVER! Player #{winner} WINS!")
  end

  def play({:tie, board}, _player) do
    Board.display(board)
    IO.puts("GAME OVER! IT'S A TIE!")
  end

  def play({:play, board}, current_player) do
    Board.display(board)
    move = IO.gets("Enter your move, Player #{current_player}:") |> Input.process

    case move do
      {:ok, processed_move} ->
        new_board = Board.update(processed_move, board, current_player)
        next_player = Player.switch(current_player)
        play(Status.result(new_board, current_player), next_player)

      {:error, error_message} ->
        IO.puts("#{error_message} Enter a valid move.") ; :timer.sleep(1000)
        play(Status.result(board, current_player), current_player)
    end

  end
end
