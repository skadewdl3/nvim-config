return {
  'nvimdev/dashboard-nvim',
  lazy = false,
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      hide = {
        statusline = true,
        tabline = true
      }
    }
    vim.cmd(":Dashboard")
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
