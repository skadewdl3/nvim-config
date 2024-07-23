return {
  "gbprod/yanky.nvim",
  opts = {
    system_clipboard = {
      sync_with_ring = true,
    },
  },
  keys = {
    { "y", "<Plug>(YankyYank)" },
    { "p", "<Plug>(YankyPutAfter)" },
    { "P", "<Plug>(YankyPutBefore)" },
    { "<C-p>", "<Plug>(YankyPreviousEntry)", mode = { "n", "i" } },
    { "<C-n>", "<Plug>(YankyNextEntry)", mode = { "n", "i" } },
  },
}
