return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = {
      { "K", vim.lsp.buf.hover },
      { "<leader>ca", vim.lsp.buf.code_action },
      { "<leader>cd", vim.lsp.buf.definition },
      { "<leader>cr", vim.lsp.buf.references },
      { "<leader>cx", vim.lsp.buf.rename },
      { "<leader>cs", vim.lsp.buf.signature_help },
    }
    local mapping = require("lazyvim.plugins.lsp.keymaps").get()
    for _, key in pairs(keys) do
      mapping[#mapping + 1] = key
    end
  end,
  opts = {
    setup = {
      ["*"] = function(server, opts)
        local lspconfig = require("lspconfig")
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        print("Setting up the " .. server .. " server")
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            require("lsp_signature").on_attach()
            require("lsp-status").on_attach(client)
          end,
        })
      end,
    },
  },
}
