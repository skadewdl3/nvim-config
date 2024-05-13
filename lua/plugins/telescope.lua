return  {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      for _, keymap in ipairs(require("config.keymaps").telescope) do
        vim.keymap.set(keymap.mode, keymap.keystroke, function() keymap.callback(builtin) end, {})
      end
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()

      local telescope = require("telescope")
      telescope.setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }

      telescope.load_extension("ui-select")
    end
  },
}
