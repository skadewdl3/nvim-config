return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  event = 'VimEnter',
  config = function ()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.startify")
--[[
    local function get_listed_buffers()
      local buffers = {}
      local len = 0
      for buffer = 1, vim.fn.bufnr('$') do
        if vim.fn.buflisted(buffer) == 1 then
          len = len + 1
          buffers[len] = buffer
        end
      end

      return buffers
    end

    local modifiedBufs = function(bufs)
      local t = 0
      for k,v in pairs(bufs) do
        if v.name:match("NvimTree_") == nil then
          t = t + 1
        end
      end
      return t
    end

    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if #vim.api.nvim_list_wins() == 1 and
          vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
          require('nvim-tree.api').tree.is_tree_buf(nil) and
          modifiedBufs(vim.fn.getbufinfo({bufmodified = 1})) == 0 then
          print('this ran')
        end
      end
    })

    ]]--
    alpha.setup(dashboard.opts)
  end
}
