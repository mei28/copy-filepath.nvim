-- copy-filepath.nvim
-- Plugin initialization: creates user commands and default keymaps
-- This file is automatically loaded by Neovim on startup

-- Prevent loading the plugin twice
if vim.g.loaded_copy_filepath then
  return
end
vim.g.loaded_copy_filepath = 1

local copy_filepath = require("copy-filepath")

-- Create user commands
vim.api.nvim_create_user_command("CopyFilePathAbs", function()
  copy_filepath.copy_absolute_path()
end, { desc = "Copy absolute file path to clipboard" })

vim.api.nvim_create_user_command("CopyFilePathRel", function()
  copy_filepath.copy_relative_path()
end, { desc = "Copy relative file path to clipboard" })

-- Set up default keymaps
-- Users can disable these by setting vim.g.copy_filepath_no_default_keymaps = 1
if not vim.g.copy_filepath_no_default_keymaps then
  vim.keymap.set("n", "<leader>yp", "<cmd>CopyFilePathAbs<cr>", { desc = "Yank absolute path" })
  vim.keymap.set("n", "<leader>yr", "<cmd>CopyFilePathRel<cr>", { desc = "Yank relative path" })
end
