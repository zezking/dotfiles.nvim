local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
	print("dashboard not loaded")
	return
end

local header = {
	"███╗   ██╗██╗   ██╗██╗███╗   ███╗",
	"████╗  ██║██║   ██║██║████╗ ████║",
	"██╔██╗ ██║██║   ██║██║██╔████╔██║",
	"██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
	"██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
	"╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
}
dashboard.setup({
	config = {
		header = header,
		shortcut = {
			{ desc = " Update", group = "@property", action = "Lazy update", key = "u" },
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = "󱁴 Search text",
				group = "Label",
				action = "Telescope live_grep",
				key = "d",
			},
			{
				desc = "󰚋 Check health",
				group = "DashboardShortCut",
				action = "checkhealth",
				key = "a",
			},
		},
	},
})
