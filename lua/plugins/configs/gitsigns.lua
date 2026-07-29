local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

gitsigns.setup({
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "" },
		topdelete = { text = "" },
		changedelete = { text = "▎" },
	},
	-- Show inline blame for the current line (virtual text at end of line).
	-- Toggle on/off with <leader>gB.
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
		delay = 300,
		ignore_whitespace = false,
		virt_text_priority = 100,
	},
	current_line_blame_formatter = " <author>, <author_time:%Y-%m-%d> - <summary>",
})
