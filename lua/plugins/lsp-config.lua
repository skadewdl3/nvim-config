return {
  {

    "williamboman/mason.nvim",
    config = function()
      local mason = require("mason")
      mason.setup {
      }
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()

      local mason_lsp = require("mason-lspconfig")
      mason_lsp.setup {
        ensure_installed = { "lua_ls", "tsserver" }
      }
    end
  },
  {
    "neovim/nvim-lspconfig",

    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup{}
      lspconfig.tsserver.setup{}
    end
  }
}
