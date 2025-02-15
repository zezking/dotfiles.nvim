-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters
-- to setup format on savrstere
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	debug = true,
	sources = {
		-- to disable file types use
		-- "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
		-- formatting.prettier, -- js/ts formatter
		formatting.prettier,
		formatting.stylua, -- lua formatter
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.isort,
		formatting.phpcsfixer,
		-- formatting.jsonls,
		-- Formatters based-off the new none-ls-extras plugin
		require("none-ls.code_actions.eslint_d"),
		require("none-ls.diagnostics.flake8"),
		require("none-ls.diagnostics.eslint_d"),
		require("none-ls.formatting.beautysh"),
		require("none-ls.formatting.eslint_d"),
		--		require("none-ls.formatting.jq"),
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
