return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup{}
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end)
    vim.keymap.set("n", "<leader>ra", function()
      for i = 1, harpoon:list():length() do
        harpoon:list():remove()
      end
    end
  )

    for i = 1, 9 do
      vim.keymap.set("n", "<leader>" .. tostring(i), function() harpoon:list():select(i) end)
    end

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-l>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-j>", function() harpoon:list():next() end)

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for i, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, tostring(i) .. ": " .. tostring(item.value))
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    vim.keymap.set("n", "<leader>l", function() toggle_telescope(harpoon:list()) end,
      { desc = "Open harpoon window" })
  end
}
