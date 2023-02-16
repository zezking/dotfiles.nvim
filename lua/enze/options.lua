local options = {
	clipboard = "unnamedplus",
	number = true,
	relativenumber = true,
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

vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
vim.cmd([[autocmd VimEnter * Neotree]])
for k, v in pairs(options) do
	vim.opt[k] = v
end
