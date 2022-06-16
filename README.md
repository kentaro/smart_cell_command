# SmartCellCommand

A smart cell implementation for Livebook to execute shell commands.

## Installation

Use `Mix.install/2` on your livebook to install this library.

```elixir
Mix.install([
  {:smart_cell_command, github: "kentaro/smart_cell_command"}
])
```

![](images/install.png)

## Usage

Select the `Command` cell from `+ Smart` button:

![](images/select-command-cell.png)

Then you'll see the editor like below:

![](images/editor.png)

### Execute a single command

![](images/single-command.png)

### Execute a command with args

![](images/command-with-args.png)

### Execute multiple commands

![](images/multiple-commands.png)

## Author

Kentaro Kuribayashi <kentarok@gmail.com>
