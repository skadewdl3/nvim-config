local linters = {
}

local formatters = {
  "prettierd",
  "stylua"
}

local lsps = {
	-- lsps
	"lua_ls",
	{
		"rust_analyzer",
		on_attach = function(_, bufnr)
			vim.lsp.inlay_hint.enable(bufnr)
		end,
	},
	"volar",
  "astro",
	"tailwindcss",
	"svelte",
	"pyright",
	"tsserver",
	"html",
	"cssls",
	"clangd",
}

return {
	linters = linters,
	formatters = formatters,
	lsps = lsps,
	daps = {},
}
