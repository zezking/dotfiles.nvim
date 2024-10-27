local options = {
	clipboard = "unnamedplus",
	backup = false,
	number = true,
	cmdheight = 1,
	relativenumber = true,
	showtabline = 1,
	termguicolors = true,
	updatetime = 50,
	splitbelow = true,
	splitright = true,
	expandtab = true,
	tabstop = 2,
	scrolloff = 8,
	smartindent = true,
	swapfile = false,
	writebackup = false,
	hidden = true,
	signcolumn = "yes",
}

vim.diagnostic.config({
	virtual_text = {
		prefix = "",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "single",
	focusable = false,
	relative = "cursor",
})
-- Disable Netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Set update time
vim.o.updatetime = 1250
-- vim.o.nohidden = true

-- open neo tree by default
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
for k, v in pairs(options) do
	vim.opt[k] = v
end

--default header
vim.g.dashboard_custom_header = {
	[[" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗"]],
	[[" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║"]],
	[[" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║"]],
	[[" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║"]],
	[[" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║"]],
	[[" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝"]],
}
