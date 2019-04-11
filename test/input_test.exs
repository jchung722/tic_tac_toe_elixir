defmodule Input_test do
  use ExUnit.Case
  doctest Input
  import ExUnit.CaptureIO

  test "Prompts user for input" do
    assert capture_io(fn -> Input.move() end) == "Enter a move!!!!!!!!"
  end
end
