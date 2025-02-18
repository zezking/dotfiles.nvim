-- import nvim-treesitter plugin safely
local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
		-- Disable for now as there are syntax errors. Related issues: https://github.com/camdencheek/tree-sitter-dockerfile/issues/51
		disable = { "dockerfile" },
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- rainbow = {
	-- 	enable = true,
	-- 	extended_mode = true,
	-- 	max_file_lines = nil,
	-- },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json5",
		"json",
		"jsonc",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		-- "markdown",
		-- "svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"gitignore",
		"python",
		--"rust",
		"toml",
	},
	ignore_install = { "dockerfile" },
	-- auto install above language parsers
	auto_install = true,
})
