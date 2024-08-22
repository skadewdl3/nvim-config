return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "wgsl", "prisma", "scss" },
      auto_install = true,
      indent = {
        enable = true,
      },
    },
  },
  {
    {
      "davidmh/mdx.nvim",
      config = true,
      dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
  },
}
