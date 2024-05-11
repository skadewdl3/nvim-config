return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    local map = vim.api.nvim_set_keymap
    vim.g.barbar_auto_setup = false
    local opts = { noremap = true, silent = true } 
    map('n', '<leader>x', '<Cmd>BufferClose<CR>', opts)
    map('n', '<C-Right>', '<Cmd>BufferNext<CR>', opts)
    map('n', '<C-Left>', '<Cmd>BufferNext<CR>', opts)



  end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.
    sidebar_filetypes = {
      NvimTree = true,
    }
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
