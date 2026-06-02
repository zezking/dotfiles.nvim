local function chafa_preview(entry)
	local img_exts = { png = true, jpg = true, jpeg = true, gif = true, bmp = true, webp = true, tiff = true, svg = true }
	local ext = entry:match("%.([^%.]+)$")
	if ext and img_exts[ext:lower()] then
		return { "chafa", "--format=symbols", "--polite=on", "--stretch", entry }
	end
	return nil
end

local opts = {
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
				["png"] = chafa_preview,
				["jpg"] = chafa_preview,
				["jpeg"] = chafa_preview,
				["gif"] = chafa_preview,
				["bmp"] = chafa_preview,
				["webp"] = chafa_preview,
				["tiff"] = chafa_preview,
				["svg"] = chafa_preview,
			},
		},
	},
}

return opts
