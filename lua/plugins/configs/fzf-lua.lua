local M = {}

M.chafa_cmd = { "chafa", "-f", "symbols", "-c", "full", "--symbols", "ascii" }

M.opts = {
	keymap = {
		builtin = { true, ["<Esc>"] = "hide" },
		actions = {
			files = {
				["ctrl-x"] = "split",
				["ctrl-v"] = "vsplit",
			},
		},
	},
	defaults = {
		git_icons = false,
		file_icons = false,
		color_icons = false,
	},
	previewers = {
		builtin = {
			extensions = {
				["png"] = M.chafa_cmd,
				["jpg"] = M.chafa_cmd,
				["jpeg"] = M.chafa_cmd,
				["gif"] = M.chafa_cmd,
				["bmp"] = M.chafa_cmd,
				["webp"] = M.chafa_cmd,
				["tiff"] = M.chafa_cmd,
				["svg"] = M.chafa_cmd,
			},
		},
	},
}

return M
