local harpoon = require("harpoon")

return {
	harpoon = {
		{
			mode = "n",
			keystroke = "<leader>a",
			callback = function()
				harpoon:list():add()
			end,
		},
		{
			mode = "n",
			keystroke = "<leader>r",
			callback = function()
				harpoon:list():remove()
			end,
		},
		{
			mode = "n",
			keystroke = "<C-Left>",
			callback = function()
				harpoon:list():next()
			end,
		},
		{
			mode = "n",
			keystroke = "<C-Right>",
			callback = function()
				harpoon:list():prev()
			end,
		},
		unpack(((function()
			local temp = {}
			for i = 1, 9 do
				table.insert(temp, {
					mode = "n",
					keystroke = "<leader>" .. tostring(i),
					callback = function()
						harpoon:list():select(i)
					end,
				})
			end
			return temp
		end)())),
	},
	nvim_tree = {},
	telescope = {},
	completions = {},
	formatter = {},
}
