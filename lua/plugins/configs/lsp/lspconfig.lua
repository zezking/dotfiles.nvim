local navic_lsp_status_ok, navic = pcall(require, "nvim-navic")
if not navic_lsp_status_ok then
	return
end

local keymap = vim.keymap

local functions = require("user.functions")

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }
	-- Navic
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
	-- set keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gD", "<Cmd>Lspsaga goto_definition<CR>", opts) -- got to declaration
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts) -- open diagnostics in float window
	keymap.set("n", "<leader>a", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart renamp
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
end

local lspconfig = vim.lsp.config
-- Change the Diagnostic symbols in the sign column (gutter)
local capabilities = require("blink.cmp").get_lsp_capabilities()
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure clangd server
lspconfig("clangd", {
	capabilities = capabilities,
	on_attach = on_attach,
})
--
-- -- configure pyright server
-- lspconfig["pyright"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

-- configure gopls
lspconfig("gopls", {
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure jdtls server
lspconfig("jdtls", {
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure gradle_ls server
lspconfig("gradle_ls", {
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure html-lsp server
lspconfig("html", {
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html" },
})

-- configure typescript-language-server (ts_ls)
lspconfig("ts_ls", {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	cmd = { "typescript-language-server", "--stdio" },
	commands = {
		OrganizeImports = {
			functions.OrganizeImports,
			description = "Organize Imports",
		},
	},

	settings = {
		typescript = {
			preferences = {
				includeCompletionsForModuleExports = true,
				includeCompletionsForImportStatements = true,
				importModuleSpecifier = "relative",
			},
		},
	},
})

-- configure jsonls server
lspconfig("jsonls", {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			format = {
				enable = true,
			},
			validate = { enable = true },
		},
	},
})

-- configure lua server (with special settings)
lspconfig("lua_ls", {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
