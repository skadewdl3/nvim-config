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
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>e",
      function()
        if is_tree_buf(nil) then
          vim.cmd(":Neotree close")
        else
          vim.cmd(":Neotree focus")
        end
      end,
    },
  },
  opts = {
    window = {
      mappings = {
        ["<leader>rc"] = "set_root",
        ["<leader>rp"] = "navigate_up",
        ["o"] = "open",
      },
    },
  },
}
