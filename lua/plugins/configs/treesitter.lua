-- nvim-treesitter (main branch) configuration.
--
-- NOTE: The `main` branch is a full, incompatible rewrite of the plugin and is
-- required for Neovim 0.11+. It drops the old module-based API
-- (highlight/indent/autotag/ensure_installed/auto_install). Treesitter
-- highlighting is now provided by Neovim's built-in engine, started here for
-- every buffer that has a parser installed (except the filetypes below).
--
-- The deprecated `master` branch is frozen and ships query predicates
-- (`lua/nvim-treesitter/query_predicates.lua`) that are incompatible with the
-- Neovim 0.12 query engine, which crashed when opening markdown files during
-- markdown_inline injection processing.

local ok, ts = pcall(require, "nvim-treesitter")
if not ok then
	return
end

-- Languages nvim-treesitter knows about. Filetypes absent from this table
-- (e.g. the lazy.nvim UI: `lazy` / `lazy_backdrop`) are not real languages and
-- would trigger "skipping unsupported language" warnings if we tried to
-- install a parser for them.
local parsers = require("nvim-treesitter.parsers")

-- Filetypes where treesitter should NOT be started (buggy/undesired parser).
local disabled_filetypes = { dockerfile = true }

-- Parsers to keep installed. `main` exposes no `ensure_installed` option, so we
-- install any that are missing on startup (best-effort, non-blocking).
local ensure_installed = {
	"json5",
	"json",
	"jsonc",
	"javascript",
	"typescript",
	"tsx",
	"yaml",
	"html",
	"css",
	"markdown",
	"markdown_inline",
	"graphql",
	"bash",
	"lua",
	"vim",
	"gitignore",
	"python",
	"toml",
	"swift",
}

ts.setup({})

-- Returns true if a parser is loadable for the given language.
local function has_parser(lang)
	return pcall(vim.treesitter.language.add, lang)
end

-- Start treesitter highlighting + indentation for buffers that have a parser.
-- Replaces the removed `highlight`/`indent` modules and replicates the old
-- `auto_install` behaviour by installing a missing parser on first encounter.
local auto_installed = {}
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("NvimTreesitterMain", { clear = true }),
	callback = function(ev)
		local buf = ev.buf
		local ft = vim.bo[buf].filetype
		if ft == "" or disabled_filetypes[ft] then
			return
		end

		local started = pcall(vim.treesitter.start, buf)
		if started then
			vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			return
		end

		-- Parser missing: install it once (best-effort), non-blocking, but only
		-- for languages nvim-treesitter actually supports.
		if parsers[ft] ~= nil and not auto_installed[ft] then
			auto_installed[ft] = true
			pcall(ts.install, { ft })
		end
	end,
})

-- Install any ensure_installed parsers that are not yet available.
local missing = vim.tbl_filter(function(lang)
	return not has_parser(lang)
end, ensure_installed)
if #missing > 0 then
	vim.notify("nvim-treesitter: installing missing parsers: " .. table.concat(missing, ", "))
	pcall(ts.install, missing)
end
