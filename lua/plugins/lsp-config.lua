local inspect = function(x)
	print(require("inspect")(x))
end

local language_servers = {
	-- lsps
	{ "lua_ls" },
	{
		"rust_analyzer",
		on_attach = function(_, bufnr)
			vim.lsp.inlay_hint.enable(bufnr)
		end,
	},
	{ "volar" },
	{ "tailwindcss" },
	{ "svelte" },
	{ "pyright" },
	{ "tsserver" },
	{ "html" },
	{ "cssls" },
	{ "clangd" },
}


return {
	{
		"williamboman/mason.nvim",
		config = function()
			local mason = require("mason")
			mason.setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		requires = {
			"williamboman/mason.nvim",
		},
		config = function()
			local lsp_names = {}
			for _, v in pairs(language_servers) do
				table.insert(lsp_names, v[1])
			end

			local mason_lsp = require("mason-lspconfig")
			mason_lsp.setup({
				ensure_installed = lsp_names,
			})
		end,
	},
	{
		"nvim-lua/lsp-status.nvim",
	},
	{
		"neovim/nvim-lspconfig",

		config = function()
			local lspconfig = require("lspconfig")

			local neodev = require("neodev")
			neodev.setup({})

			local lspstatus = require("lsp-status")
			lspstatus.register_progress()


			for _, v in pairs(language_servers) do
				local name = v[1]
				local options = {}
				local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
				options.capabilities = vim.tbl_deep_extend('force', v.capabilities or {}, lspstatus.capabilities, cmp_capabilities)
				options.on_attach = function(client, bufnr)
					v.on_attach(client, bufnr)
					lspstatus.on_attach(client)
				end
				options.handlers = lspstatus.extensions[name] and lspstatus.extensions[name].setup() or nil
				options.settings = v.settings
				lspconfig[name].setup(options)
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
