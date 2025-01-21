local opts = {}

opts = {
	{ keymap = { builtin = { true, ["<Esc>"] = "hide" } } },
	defaults = { git_icons = false, file_icons = false, color_icons = false },
}
return opts
