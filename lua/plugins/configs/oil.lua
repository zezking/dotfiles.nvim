require("oil").setup({
	keymaps = {
		["<C-h>"] = false,
		["<S-h>"] = {
			"actions.select",
			opts = { horizontal = true },
			desc = "Open the entry in a horizontal split",
		},
	},
})
