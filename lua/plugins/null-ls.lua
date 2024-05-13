return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	config = function()
		local null_ls = require("null-ls")

    -- get the mason config
    local mason_config = require("config.mason-config")

    -- create list of sources from the 
    -- formatters and linters in the mason config
		local sources = {}
		local i = 0
    for _, formatter in pairs(mason_config.formatters) do
      i = i + 1
      sources[i] = null_ls.builtins.formatting[formatter]
    end
    for _, linter in pairs(mason_config.linters) do
      i = i + 1
      sources[i] = require("none-ls.diagnostics." .. linter)
    end

    -- setup the sources
		null_ls.setup({
			sources = sources,
		})

		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
	end,
}
