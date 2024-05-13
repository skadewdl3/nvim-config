-- function to merge all the tools into one table
local function table_concat(t1, ...)
  -- loop over tables in ... and concat each to t1
  for i = 1, select("#", ...) do
    local t2 = select(i, ...)
    for j = 1, #t2 do
      t1[#t1 + 1] = t2[j]
    end
  end
  return t1
end

return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local tool_installer = require("mason-tool-installer")
    local temp = require("config.mason-config")

    local mason_config = {}

    -- if the tool is a table, then it is a tool with options
    -- so we need to extract the tool name from the table
    for i, category in pairs(temp) do
      mason_config[i] = {}
      for j, tool in pairs(category) do
        if type(tool) == "table" then
          mason_config[i][j] = tool[1]
        else
          mason_config[i][j] = tool
        end
      end
    end

    -- setup mason-tool-installer to install all the tools
    tool_installer.setup({
      run_on_start = true,
      ensure_installed = table_concat(
        mason_config.formatters,
        mason_config.linters,
        mason_config.lsps,
        mason_config.daps
      ),
      integrations = {
        ["mason-lspconfig"] = true,
        ["mason-null-ls"] = true,
        ["mason-nvim-dap"] = true,
      },
    })

    -- setup autocommands to print messages when mason-tool-installer is running
    vim.api.nvim_create_autocmd("User", {
      pattern = "MasonToolsStartingInstall",
      callback = function()
        vim.schedule(function()
          print("mason-tool-installer is starting")
        end)
      end,
    })

    -- setup autocommands to print messages when mason-tool-installer is done
    vim.api.nvim_create_autocmd("User", {
      pattern = "MasonToolsUpdateCompleted",
      callback = function(e)
        print(vim.inspect(e.data))
      end,
    })
  end,
}
