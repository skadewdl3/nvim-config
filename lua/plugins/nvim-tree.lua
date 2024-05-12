return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
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

    vim.keymap.set('n', '<leader>e', toggle_nvimtree, {})
    require('nvim-tree').setup {
    update_focused_file = { enable = true },
    }
  end,
}
--[[
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function ()
    local neotree = require("neo-tree")

    function dump(o)
      if type(o) == 'table' then
        local s = '{ '
        for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
        end
        return s .. '} '
      else
        return tostring(o)
      end
    end

    neotree.setup {
      close_if_last_window = false,
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(args)
            print(vim.fn.bufnr())
          end
        }
      }
    }
  end
}]]--
