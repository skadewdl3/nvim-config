return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      theme = 'dracula',
      sections = {
        lualine_c = {
          function()
            return require("lsp-status").status()
          end
        },
      }
    }

    vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      group = "lualine_augroup",
      pattern = {"LspProgressStatusUpdated", "BufEnter", "BufLeave"},
      callback = require("lualine").refresh,
    })
  end
}
