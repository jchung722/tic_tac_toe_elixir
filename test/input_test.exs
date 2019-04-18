defmodule InputTest do
  use ExUnit.Case
  doctest Input

  describe "when input is valid" do
    test "user input is returned as integer" do
      assert Input.process("1\n") == {:ok, 1}
    end
  end

  describe "when input is invalid" do
    test "an empty input will trigger an error" do
      assert Input.process("\n") == {:error, "Input is invalid!"}
    end

    test "an invalid input will trigger an error" do
      assert Input.process("invalid\n") == {:error, "Input is invalid!"}
    end
  end
end
