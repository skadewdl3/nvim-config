return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local neotree_focus = false
    local nvimtree = require("nvim-tree.api")

    local nvim_tree_events = require('nvim-tree.events')
    local barbar = require('barbar.api')


    toggle_nvimtree = function()
      if nvimtree.tree.is_tree_buf(nil) then
        nvimtree.tree.close()
      else
        nvimtree.tree.focus()
      end
    end

    vim.keymap.set('n', '<leader>e', toggle_nvimtree, {})

--[[
    local function open_nvim_tree(data)
      -- buffer is a real file on the disk
      local real_file = vim.fn.filereadable(data.file) == 1

      -- buffer is a [No Name]
      local no_name = data.file == '' and vim.bo[data.buf].buftype == ''

      -- only files please
      if not real_file and not no_name then
        return
      end

      -- open the tree but dont focus it
      nvimtree.tree.toggle({ focus = false })
      vim.api.nvim_exec_autocmds('BufWinEnter', {buffer = require('nvim-tree.view').get_bufnr()})
    end

    vim.api.nvim_create_autocmd({'VimEnter'}, { callback = open_nvim_tree })
    ]]--
    require('nvim-tree').setup()
  end,
}


