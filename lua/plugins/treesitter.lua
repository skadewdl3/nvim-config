return {
  "nvim-treesitter/nvim-treesitter",

  init = function()
    local configs = require("nvim-treesitter.parsers").get_parser_configs()
    --[[
    configs.wgsl = {
      install_info = {
        url = "https://github.com/szebniok/tree-sitter-wgsl",
        files = { "src/parser.c" },
      },
    }
    configs.prisma = {
      url = "https://github.com/victorhqc/tree-sitter-prisma",
      files = { "src/parser.c" },
    }
    ]]
    --
  end,
  opts = {
    ensure_installed = { "wgsl", "prisma" },
    auto_install = true,
  },
}
