local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	return
end

local lsp_status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not lsp_status_ok then
	return
end

local config = {
	--Turn off virtual_text
	virtual_text = false,
	update_in_insert = true,
	underline = true,
	severity_sor = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		-- width = 40,
	},
}

vim.diagnostic.config(config)
mason.setup()

mason_lsp.setup({
	-- list of servers for mason to install
	ensure_installed = { "vtsls" },
	-- auto-install configured servers (with lspconfig)
})
