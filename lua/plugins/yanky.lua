return {
  "gbprod/yanky.nvim",
  opts = {},
  keys = {
    { "p", "<Plug>(YankyPutAfter)" },
    { "y", "<Plug>(YankyYank)" },
    { "<C-c>", "<Plug>(YankyYank)", mode = { "n", "i" } },
    { "<C-v>", "<Plug>(YankyPutAfter)", mode = { "n", "i" } },
    { "P", "<Plug>(YankyPutBefore)" },
    { "<C-S-v>", "<Plug>(YankyPutBefore)", mode = { "n", "i" } },
    { "<C-p>", "<Plug>(YankyPreviousEntry)", mode = { "n", "i" } },
    { "<C-n>", "<Plug>(YankyNextEntry)", mode = { "n", "i" } },
  },
}
