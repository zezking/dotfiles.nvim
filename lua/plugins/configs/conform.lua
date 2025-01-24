local opts = {}

opts = {
	-- Define your formatters
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		go = { "gopls" },
		-- prettier infers config.json as jsonc
		jsonc = { "prettierd", "prettier" },
		json = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
		typescriptreact = { "prettierd", "prettier" },
		javascript = { "prettierd", "prettier" },
		javascriptreact = { "prettierd", "prettier" },
	},
	-- Set default options
	default_format_opts = {
		lsp_format = "fallback",
	},
	-- Set up format-on-save
	stop_after_first = true,
	format_on_save = { timeout_ms = 10000 },
}

return opts
