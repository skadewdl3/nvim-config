local cmp = require("cmp")

return {
  "hrsh7th/nvim-cmp",
  opts = {
    mapping = {
      ["<C-a>"] = cmp.mapping.confirm({ select = true }),
      ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select, count = 1 }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select, count = 1 }),
      ["<C-Space>"] = cmp.mapping.complete(),
    },
    sources = cmp.config.sources({
      { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "luasnip" }, -- For luasnip users.
    }, {
      { name = "buffer" },
    }),
  },
}
