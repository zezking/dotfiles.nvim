require("oil").setup({
	keymaps = {
		["<C-h>"] = false,
		["<S-h>"] = {
			"actions.select",
			opts = { horizontal = true },
			desc = "Open the entry in a horizontal split",
		},
	},
	view_options = {
		-- Show files and directories that start with "."
		-- ["g."] = { "actions.toggle_hidden", mode = "n" },
		show_hidden = false,
	},
})
