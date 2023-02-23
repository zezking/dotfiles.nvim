M = {}

local ui = vim.api.nvim_list_uis()[1]

M.user_config = {
	width = 40,
	height = 10,
	style = "minimal",
	border = "rounded",
	row = (ui.height / 2) - (10 / 2),
	col = (ui.width / 2) - (40 / 2),
}

M.openOptions = {
	window = "b %s",
	vsplit = "vert sb %s",
	hsplit = "sb %s",
}

return M
