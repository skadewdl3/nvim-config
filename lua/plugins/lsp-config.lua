return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
	},
	{ "nvim-lua/lsp-status.nvim" },
	{ "folke/neodev.nvim" },
	{
		"neovim/nvim-lspconfig",

		config = function()
			local lspconfig = require("lspconfig")

			-- fix for the vim global variable not being found
			local neodev = require("neodev")
			neodev.setup({})

			-- used to show lsp progress in lualine
			local lspstatus = require("lsp-status")
			lspstatus.register_progress()

			-- get all lsps and configure them
			local lsps = require("config.mason-config").lsps or {}

			for _, lsp in pairs(lsps) do
				-- check if lsp is started in current buffer
				local start_lsp = true

				local bufnr = vim.api.nvim_get_current_buf()
				local servers_attached_to_buf = vim.lsp.get_active_clients({ bufnr = bufnr })
				for _, server in pairs(servers_attached_to_buf) do
					if server.name == lsp[1] then
						start_lsp = false
					end
				end

				if start_lsp then
					-- if lsp is a table, it contains first field as name
					-- if it's a string, then it's just the name
					local name = type(lsp) == "string" and lsp or lsp[1]
					local is_string = type(lsp) == "string"

					-- options for the lsp
					local options = {}

					-- get all capabilities and merge them
					local status_capabilities = require("lsp-status").capabilities
					local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
					local lsp_capabilities = is_string and vim.lsp.protocol.make_client_capabilities() or lsp.capabilities or vim.lsp.protocol.make_client_capabilities()
					options.capabilities =
						vim.tbl_deep_extend("force", lsp_capabilities, status_capabilities, cmp_capabilities)

					-- get all on_attach functions and merge them
					local lsp_on_attach = is_string and nil or lsp.on_attach or nil
					local status_on_attach = lspstatus.on_attach
					options.on_attach = function(client, bufnr)
						if lsp_on_attach then
							lsp_on_attach(client, bufnr)
						end
						status_on_attach(client)
					end

					-- set lspstatus as a handler
					options.handlers = lspstatus.extensions[name] and lspstatus.extensions[name].setup() or nil

					-- set any additional setings specified in the lsp config
					options.settings = is_string and {} or lsp.settings or {}

					-- setup the lsp

					lspconfig[name].setup(options)
				end
			end

			-- keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
