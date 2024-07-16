local function is_tree_buf(bufnr)
  if bufnr == nil then
    bufnr = 0
  end
  if vim.api.nvim_buf_is_valid(bufnr) then
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if vim.fn.fnamemodify(bufname, ":t"):match("^NvimTree_[0-9]+$") then
      if vim.bo[bufnr].filetype == "NvimTree" then
        return true
      elseif vim.fn.filereadable(bufname) == 0 then
        return true
      end
    end
  end
  return false
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        float = {
          enable = true,
        },
      },
    })
  end,
  keys = {
    {
      "<leader>e",
      function()
        if is_tree_buf(nil) then
          require("nvim-tree.api").tree.close()
        else
          require("nvim-tree.api").tree.toggle()
        end
      end,
    },
    {
      "<leader>rp",
      function()
        require("nvim-tree.api").tree.change_root_to_parent()
      end,
    },
    {
      "<leader>rc",
      function()
        require("nvim-tree.api").tree.change_root_to_node()
      end,
    },
  },
}
