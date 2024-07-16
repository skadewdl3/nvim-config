return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>ff",
      ":lua require('telescope.builtin').find_files({hidden=true})<CR>",
    },
    {
      "<leader>rg",
      "<cmd>Telescope live_grep<CR>",
    },
    {
      "<leader>fc",
      "<cmd>Telescope current_buffer_fuzzy_find<CR>",
    },
    {
      "<leader>fg",
      "<cmd>Telescope git_files<CR>",
    },
  },
}
