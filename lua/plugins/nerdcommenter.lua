return {
	"preservim/nerdcommenter",
	config = function()
		local map = vim.api.nvim_set_keymap
		map("n", "<leader>kc", ":call NERDComment(0, 'comment')<CR>", { noremap = true, silent = true })
		map("n", "<leader>ku", ":call NERDComment(0, 'uncomment')<CR>", { noremap = true, silent = true })
		map("n", "<leader>kt", ":call NERDComment(0, 'toggle')<CR>", { noremap = true, silent = true })
	end,
}
