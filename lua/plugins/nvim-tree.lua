return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree.api")

    local toggle_nvimtree = function()
      if nvimtree.tree.is_tree_buf(nil) then
        nvimtree.tree.close()
      else
        nvimtree.tree.focus()
      end
    end

    vim.keymap.set("n", "<leader>e", toggle_nvimtree, {})
    require("nvim-tree").setup({
      update_focused_file = { enable = true },
      view = {
        side = "left",
      },
    })

    vim.keymap.set("n", "<leader>rc", nvimtree.tree.change_root_to_node)
    vim.keymap.set("n", "<leader>rp", nvimtree.tree.change_root_to_parent)
  end,
}
