local status_ok, kanagawa = pcall(require, "kanagawa")

if not status_ok then
	print("Failed to load kanagawa")
end

kanagawa.setup({
	theme = "dragon",
})
vim.cmd("colorscheme kanagawa")
