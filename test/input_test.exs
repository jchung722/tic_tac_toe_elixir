defmodule InputTest do
  use ExUnit.Case
  doctest Input

  describe "when input is valid" do
    test "user input is stripped of trailing new line" do
      assert Input.trim("1\n") == "1"
    end
  end

  describe "when input is invalid" do
    test "an empty input will be stripped of new  line and be empty" do
      assert Input.trim("\n") == ""
    end

    test "an invalid input will be stripped of trailing new line" do
      assert Input.trim("invalid\n") == "invalid"
    end
  end
end
