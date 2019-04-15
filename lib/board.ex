defmodule Board do
  defstruct data: ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

  def print_board(board_data) do
    "| #{Enum.at(board_data, 0)} | #{Enum.at(board_data, 1)} | #{Enum.at(board_data, 2)} |\n| #{Enum.at(board_data, 3)} | #{Enum.at(board_data, 4)} | #{Enum.at(board_data, 5)} |\n| #{Enum.at(board_data, 6)} | #{Enum.at(board_data, 7)} | #{Enum.at(board_data, 8)} |"
  end
end
