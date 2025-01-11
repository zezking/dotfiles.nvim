local opts = {}

opts = {
	-- Define your formatters
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		go = { "gopls" },
		json = { "prettierd", "prettier", stop_after_first = true },
		typescript = { { "prettierd", "prettier", stop_after_first = true } },
		typescriptreact = { { "prettierd", "prettier", stop_after_first = true } },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
	},
	-- Set default options
	default_format_opts = {
		lsp_format = "fallback",
	},
	-- Set up format-on-save
	format_on_save = { timeout_ms = 500 },
}

return opts
