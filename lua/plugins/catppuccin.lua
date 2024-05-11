return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  name = 'catppuccin',
  config = function()
    vim.cmd.colorscheme "catppuccin"
  end
}

