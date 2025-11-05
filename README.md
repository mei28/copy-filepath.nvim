# copy-filepath.nvim

A simple Neovim plugin to copy file paths to your system clipboard.

## Features

- Copy absolute file paths with `:CopyFilePathAbs` or `<leader>yp`
- Copy relative file paths with `:CopyFilePathRel` or `<leader>yr`
- Visual feedback via notifications
- Handles edge cases (empty buffers, no file)
- Zero dependencies (uses only Neovim built-in APIs)

## Installation

### LazyVim / lazy.nvim

Add this to your plugin configuration (e.g., `~/.config/nvim/lua/plugins/copy-filepath.lua`):

#### From GitHub

```lua
return {
  "mikko-kohtala/copy-filepath.nvim",
  dir = "copy-filepath.nvim",
  -- Load on first keymap use (lazy loading)
  keys = {
    { "<leader>yp", desc = "Yank absolute path" },
    { "<leader>yr", desc = "Yank relative path" },
  },
}
```

#### As a Local Plugin

If you're developing or using this locally:

```lua
return {
  dir = "~/code/neovim-plugins/copy-filepath.nvim",
  name = "copy-filepath",
  keys = {
    { "<leader>yp", desc = "Yank absolute path" },
    { "<leader>yr", desc = "Yank relative path" },
  },
}
```

### Traditional Vim Package Manager

Add to your runtimepath:

```vim
set rtp+=~/code/neovim-plugins/copy-filepath.nvim
```

Or use your preferred plugin manager (vim-plug, packer, etc.).

## Usage

### Commands

- `:CopyFilePathAbs` - Copy the absolute path of the current buffer
- `:CopyFilePathRel` - Copy the relative path of the current buffer

### Default Keymaps

- `<leader>yp` - Yank (copy) absolute path
- `<leader>yr` - Yank (copy) relative path

### Disabling Default Keymaps

If you prefer to set your own keymaps, disable the defaults:

```lua
vim.g.copy_filepath_no_default_keymaps = 1
```

Then add your custom keymaps:

```lua
vim.keymap.set("n", "<your-key>", "<cmd>CopyFilePathAbs<cr>", { desc = "Copy absolute path" })
vim.keymap.set("n", "<your-key>", "<cmd>CopyFilePathRel<cr>", { desc = "Copy relative path" })
```

## API

You can also call the functions directly from Lua:

```lua
local copy_filepath = require("copy-filepath")

-- Copy absolute path
copy_filepath.copy_absolute_path()

-- Copy relative path
copy_filepath.copy_relative_path()

-- Setup function (for future configuration options)
copy_filepath.setup({
  -- Currently no options, but reserved for future extensibility
})
```

## Requirements

- Neovim 0.7.0 or later
- System clipboard support (`+clipboard` feature)

Check clipboard support with:
```vim
:echo has('clipboard')
```

## License

MIT License - see LICENSE file for details
