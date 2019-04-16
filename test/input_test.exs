defmodule InputTest do
  use ExUnit.Case
  doctest Input

  describe "when input is valid" do
    test "user input is stripped of trailing newline" do
      assert Input.trim("1\n") == "1"
    end
  end
end
