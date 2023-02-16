local options = {
	clipboard = "unnamedplus",
	number = true,
	relativenumber = true,
	showtabline = 1,
	termguicolors = true,
	updatetime = 750,
	splitbelow = true,
	splitright = true,
	expandtab = true,
	tabstop = 2,
	scrolloff = 8,
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
vim.o.updatetime = 1250

-- open neo tree by default
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
for k, v in pairs(options) do
	vim.opt[k] = v
end
