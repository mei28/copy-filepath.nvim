-- copy-filepath.nvim
-- Core functionality for copying file paths to clipboard

local M = {}

-- Copy absolute file path to clipboard
function M.copy_absolute_path()
  local path = vim.fn.expand("%:p")
  if path == "" then
    vim.notify("No file in current buffer", vim.log.levels.WARN)
    return
  end
  vim.fn.setreg("+", path)
  vim.notify("Copied absolute path: " .. path, vim.log.levels.INFO)
end

-- Copy relative file path to clipboard
function M.copy_relative_path()
  local path = vim.fn.expand("%:.")
  if path == "" then
    vim.notify("No file in current buffer", vim.log.levels.WARN)
    return
  end
  vim.fn.setreg("+", path)
  vim.notify("Copied relative path: " .. path, vim.log.levels.INFO)
end

-- Setup function for configuration (future extensibility)
function M.setup(opts)
  opts = opts or {}
  -- Currently no configuration options, but this allows for future expansion
  -- e.g., custom keybindings, clipboard register selection, notification style, etc.
end

return M
