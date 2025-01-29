local opts = {}

opts = {
	{
		keymap = {
			builtin = { true, ["<Esc>"] = "hide" },
			actions = {
				files = {
					["ctrl-x"] = "split",
					["ctrl-v"] = "vsplit",
				},
			},
		},
	},
	defaults = { git_icons = false, file_icons = false, color_icons = false },
}
return opts
