return {
  {
    "zbirenbaum/copilot-cmp",
    event = "VeryLazy",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
      require("copilot_cmp").setup()
    end,
  },
}
