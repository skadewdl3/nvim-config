return {
	"kevinhwang91/nvim-ufo",
	lazy = false,
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		-- configure ufo to get it's folds from treesitter and indent
		require("ufo").setup({
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		})
	end,
}
