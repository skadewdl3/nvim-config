
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "windwp/nvim-ts-autotag" },
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup {
      ensure_installed = {"lua", "javascript", "c", "typescript", "html", "css", "rust"},
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      autotag = { enable = true }
    }
  end
}

