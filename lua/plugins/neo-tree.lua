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

local do_setcd = function(state)
  local p = state.tree:get_node().path
  print(p) -- show in command line
  vim.cmd(string.format('exec(":lcd %s")', p))
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  keys = {
    {
      "<leader>e",
      function()
        if is_tree_buf(nil) then
          vim.cmd(":Neotree close")
        else
          vim.cmd(":Neotree focus float")
        end
      end,
    },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },

    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function(arg)
          vim.cmd([[
              setlocal relativenumber
            ]])
        end,
      },
    },
    commands = {
      find_files = function(state)
        do_setcd(state)
        require("telescope.builtin").find_files()
      end,
      grep = function(state)
        do_setcd(state)
        require("telescope.builtin").live_grep()
      end,
    },

    window = {
      position = "float",
      mappings = {
        ["<leader>rc"] = "set_root",
        ["<leader>rp"] = "navigate_up",
        ["o"] = "open",
        ["<leader>f"] = "find_files",
        ["<leader>g"] = "grep",
      },
    },
  },
}
