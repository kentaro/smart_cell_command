defmodule SmartCellCommandTest do
  use ExUnit.Case
  doctest SmartCellCommand

  test "greets the world" do
    assert SmartCellCommand.hello() == :world
  end
end
