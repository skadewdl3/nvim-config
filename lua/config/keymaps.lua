return {
	harpoon = {
		{
			mode = "n",
			keystroke = "<leader>a",
			callback = function(harpoon)
				harpoon:list():add()
			end,
		},
		{
			mode = "n",
			keystroke = "<leader>r",
			callback = function(harpoon)
				harpoon:list():remove()
			end,
		},
		{
			mode = "n",
			keystroke = "<C-Left>",
			callback = function(harpoon)
				harpoon:list():next()
			end,
		},
		{
			mode = "n",
			keystroke = "<C-Right>",
			callback = function(harpoon)
				harpoon:list():prev()
			end,
		},
		unpack(((function()
			local temp = {}
			for i = 1, 9 do
				table.insert(temp, {
					mode = "n",
					keystroke = "<leader>" .. tostring(i),
					callback = function(harpoon)
						harpoon:list():select(i)
					end,
				})
			end
			return temp
		end)())),
	},
	nvim_tree = {
		{
			mode = "n",
			keystroke = "<leader>e",
			callback = function(nvim_tree)
				if nvim_tree.tree.is_tree_buf(nil) then
					nvim_tree.tree.close()
				else
					nvim_tree.tree.focus()
				end
			end,
		},
		{
			mode = "n",
			keystroke = "<leader>rc",
			callback = function(nvim_tree)
				nvim_tree.tree.change_root_to_node()
			end,
		},
		{
			mode = "n",
			keystroke = "<leader>rp",
			callback = function(nvim_tree)
				nvim_tree.tree.change_root_to_parent()
			end,
		},
	},
	telescope = {},
	completions = {},
	formatter = {},
}
