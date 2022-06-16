defmodule SmartCellCommandTest do
  use ExUnit.Case, async: true

  import Kino.Test

  setup :configure_livebook_bridge

  test "greets the world" do
    {_kino, source} = start_smart_cell!(SmartCellCommand, %{
      "command" => """
      elixir -e 'IO.puts("hello")'
      """
    })

    assert source == ~S"""
    "elixir -e 'IO.puts(\"hello\")'\n"
    |> String.split("\n")
    |> Enum.map(fn line ->
      [cmd | args] = line |> String.split(" ")
      {result, _} = System.cmd(cmd, args)
      result |> String.trim()
    end)
    |> Enum.join("\n\n")
    |> IO.puts()
    """ |> String.trim()
  end
end
