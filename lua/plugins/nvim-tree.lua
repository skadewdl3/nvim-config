return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree.api")

    require("nvim-tree").setup({
      update_focused_file = { enable = true },
      view = {
        side = "left",
      },
    })

    local keymaps = require("config.keymaps").nvim_tree
    for _, keymap in ipairs(keymaps) do
      vim.keymap.set(keymap.mode, keymap.keystroke, function () keymap.callback(nvimtree) end)
    end
  end,
}
