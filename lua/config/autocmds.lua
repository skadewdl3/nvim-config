-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Prevents auto-continuation of comments
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- Runs mason tool installer on startup
vim.api.nvim_create_autocmd("User", {
  pattern = "MasonToolsStartingInstall",
  callback = function()
    vim.schedule(function()
      print("mason-tool-installer is starting")
    end)
  end,
})

-- setup autocommands to print messages when mason-tool-installer is done
vim.api.nvim_create_autocmd("User", {
  pattern = "MasonToolsUpdateCompleted",
  callback = function(e)
    if e.data ~= {} then
      print(vim.inspect(e.data))
    end
  end,
})
