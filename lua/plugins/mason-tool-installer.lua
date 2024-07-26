return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },

  config = function()
    local tool_installer = require("mason-tool-installer")

    tool_installer.setup({
      run_on_start = true,
      ensure_installed = {
        -- lsps
        "lua_ls",
        "wgsl_analyzer",
        "rust_analyzer",
        "emmet_ls",
        "volar",
        "astro",
        "tailwindcss",
        "svelte",
        "pyright",
        "html",
        "cssls",
        "clangd",
        "prismals",
        "tsserver",
        "asm_lsp",
        "mdx_analyzer",
        -- daps
        -- formatters
        "prettierd",
        "stylua",
        -- linters
        "eslint_d",
      },
      integrations = {
        ["mason-lspconfig"] = true,
        ["mason-null-ls"] = true,
        ["mason-nvim-dap"] = true,
      },
    })
  end,
}
