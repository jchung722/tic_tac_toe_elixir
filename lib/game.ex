defmodule Game do
  def play(true, board, _next_player) do
    IO.puts(Board.build(board))
    IO.puts("GAME OVER")
  end

  def play(false, board, player) do
    IO.puts(Board.build(board))

    new_board =
      IO.gets("Enter your move, player #{player}:")
      |> String.trim()
      |> Board.update(board, player)

    next_player = Player.switch(player)
    play(Status.over?(new_board), new_board, next_player)

  end
end
