
return {
  "chrisgrieser/nvim-origami",
	dependencies = { "kevinhwang91/nvim-ufo", "kevinhwang91/promise-async" },
	lazy = false,
	config = function()
		-- configure ufo to get it's folds from treesitter and indent
		require("ufo").setup({
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		})

    require("origami").setup {
      keepFoldsAcrossSessions = true,
      setupFoldKeymaps = false
    }
	end,
} 
