vim.keymap.set("i", "<C-y>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
vim.g.copilot_node_command = "~/.local/share/nvm/v20.18.3/bin/node"

-- Block the normal Copilot suggestions
vim.api.nvim_create_augroup("github_copilot", { clear = true })
vim.api.nvim_create_autocmd({ "FileType", "BufUnload" }, {
	group = "github_copilot",
	callback = function(args)
		vim.fn["copilot#On" .. args.event]()
	end,
})
vim.fn["copilot#OnFileType"]()
