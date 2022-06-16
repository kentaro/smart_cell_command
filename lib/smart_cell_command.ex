defmodule SmartCellCommand do
  @moduledoc false

  use Kino.JS
  use Kino.JS.Live
  use Kino.SmartCell, name: "Command"

  @impl true
  def init(attrs, ctx) do
    {:ok, assign(ctx, command: attrs["command"] || ""), editor: [attribute: "command"]}
  end

  @impl true
  def handle_connect(ctx) do
    {:ok, %{}, ctx}
  end

  @impl true
  def to_attrs(_ctx) do
    %{}
  end

  @impl true
  def to_source(attrs) do
    quote do
      unquote(attrs["command"])
      |> String.split("\n")
      |> Enum.map(fn line ->
        [cmd | args] = line |> String.split(" ")
        {result, _} = System.cmd(cmd, args)
        result |> String.trim()
      end)
      |> Enum.join("\n\n")
      |> IO.puts()
    end
    |> Kino.SmartCell.quoted_to_string()
  end

  asset "main.js" do
    """
    export function init(ctx, payload) {
    }
    """
  end
end
