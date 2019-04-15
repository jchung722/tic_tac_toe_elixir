defmodule Game do

  def play(true, board) do
    IO.puts(Board.print(board))
    IO.puts("GAME OVER")
  end

  def play(false, board, player) do
    IO.puts(Board.print(board))
    new_board = IO.gets("Enter your move, player #{player}:") |>
    String.trim |>
    Board.update(board, player)

    next_player = Player.switch(player)
    play(Game.is_over?(board), new_board, next_player)
  end

  #checks if game has a tie
  def has_tie?([]), do: true

  def has_tie?([ "X" | tail]), do: has_tie?(tail)

  def has_tie?([ "O" | tail]), do: has_tie?(tail)

  def has_tie?([ _head | _tail]), do: false

  #checks if a player won the game
  def has_winner?(board) do
    cond do
      check_row(board) ->
        true
      Enum.at(board, 0) == Enum.at(board, 3) && Enum.at(board, 3) == Enum.at(board, 6) ->
        true
      Enum.at(board, 1) == Enum.at(board, 4) && Enum.at(board, 4) == Enum.at(board, 7) ->
        true
      Enum.at(board, 2) == Enum.at(board, 5) && Enum.at(board, 5) == Enum.at(board, 8) ->
        true
      Enum.at(board, 0) == Enum.at(board, 4) && Enum.at(board, 4) == Enum.at(board, 8) ->
        true
      Enum.at(board, 2) == Enum.at(board, 4) && Enum.at(board, 4) == Enum.at(board, 6) ->
        true
      true ->
        false
    end
  end

  #helper function for has_winner? - checks if rows have win condition
  def check_row([]), do: false

  def check_row([a, a, a | _tail]), do: true

  def check_row([_, _, _ | tail]), do: check_row(tail)

  #check if game is over
  def is_over?(board) do
    has_winner?(board) || has_tie?(board)
  end

end
