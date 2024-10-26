local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- defer = { gc = "Comments" },
	replace = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	keys = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	win = {
		border = "rounded", -- none, single, double, shadow
		wo = {
			winblend = 0,
		},
	},
	layout = {
		height = { min = 4, max = 20 }, -- min and max height of the columns
		width = { min = 20, max = 30 }, -- min and max width of the columns
		spacing = 1, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	filter = function(mapping)
		return true
	end,
	-- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	-- triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		{ "<leader>", mode = { "n", "v" } },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local m_opts = {
	mode = "n", -- NORMAL mode
	prefix = "m",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

-- Navigation
which_key.add({
	mode = { "n" },
	{ "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment" },
	{ "<leader>b", "<cmd>lua require('enze.bfs').open()<cr>", desc = "Buffers" },
	{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
	{ "<leader>q", '<cmd>lua require("enze.functions").smart_quit()<CR>', desc = "Quit" },
	{ "<leader>P", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },
	{ "<leader>gy", desc = "Open code in Browser" },
	{ "<leader>.", desc = "Goto prev harpoon" },
	{ "<leader>,", desc = "Goto next harpoon" },
})

-- LSP
which_key.add({
	mode = { "n" },
	{ "<leader>l", group = "LSP" },
	{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>" },
	{ "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format" },
	{ "<leader>lF", "<cmd>LspToggleAutoFormat<cr>", desc = "Toggle autoformat" },
	{ "<leader>ld", "<cmd>TroubleToggle<cr>", desc = "Diagnostics" },
	{ "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "Workspace diagnostics" },
	{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
	{ "<leader>lh", "<cmd>IlluminationToggle<cr>", desc = "Toggle Doc HL" },
	{ "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
	{ "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", desc = "Next diagnostic" },
})

-- Terminal
which_key.add({
	mode = { "n" },
	{ "<leader>t", group = "Terminal" },
	{ "<leader>t1", ":1ToggleTerm<cr>", desc = "1" },
	{ "<leader>t2", ":2ToggleTerm<cr>", desc = "2" },
	{ "<leader>t3", ":3ToggleTerm<cr>", desc = "3" },
	{ "<leader>t4", ":4ToggleTerm<cr>", desc = "4" },
	{ "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node" },
	{ "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python" },
	{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float" },
	{ "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal" },
	{ "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical" },
})
-- Session
which_key.add({
	mode = { "n" },
	{ "<leader>s", group = "Session" },
	{ "<leader>ss", "<cmd>SessionSave<cr>", desc = "Save" },
	{ "<leader>sr", "<cmd>SessionRestore<cr>", desc = "Restore" },
	{ "<leader>sf", "<cmd>Autosession search<cr>", desc = "Find" },
	{ "<leader>sd", "<cmd>Autosession delete<cr>", desc = "Find Delete" },
})
-- Close buffers
which_key.add({
	mode = { "n" },
	{ "<leader>c", group = "Close buffers" },
	{ "<leader>cc", "<cmd>Bdelete!<CR>", desc = "Close buffer" },
	{ "<leader>cl", "<cmd>BufferLineCloseLeft<CR>", desc = "Close all buffers to the left" },
	{ "<leader>cr", "<cmd>BufferLineCloseRight<CR>", desc = "Close all buffers to the right" },
})
local mappings = {
	-- u = {
	-- 	name = "TodoComments",
	-- 	["t"] = { "<cmd>TodoTelescope<CR>", "Show Comments" },
	-- 	["q"] = { "<cmd>TodoQuickFix<CR>", "Quick Fix" },
	-- 	["l"] = { "<cmd>TodoLocList<CR>", "List Comments" },
	-- },
	--
	-- B = {
	-- 	name = "Bookmarks",
	-- 	a = { "<cmd>silent BookmarkAnnotate<cr>", "Annotate" },
	-- 	c = { "<cmd>silent BookmarkClear<cr>", "Clear" },
	-- 	t = { "<cmd>silent BookmarkToggle<cr>", "Toggle" },
	-- 	m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
	-- 	n = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon Toggle" },
	-- 	l = { "<cmd>lua require('enze.bfs').open()<cr>", "Buffers" },
	-- 	j = { "<cmd>silent BookmarkNext<cr>", "Next" },
	-- 	s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
	-- 	k = { "<cmd>silent BookmarkPrev<cr>", "Prev" },
	-- 	S = { "<cmd>silent BookmarkShowAll<cr>", "Prev" },
	-- 	x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
	-- },
	--
	-- p = {
	-- 	name = "Lazy",
	-- 	c = { "<cmd>Lazy check<cr>", "Check" },
	-- 	C = { "<cmd>Lazy clean<cr>", "Clean" },
	-- 	i = { "<cmd>Lazy install<cr>", "Install" },
	-- 	s = { "<cmd>Lazy sync<cr>", "Sync" },
	-- 	u = { "<cmd>Lazy update<cr>", "Update" },
	-- 	r = { "<cmd>Lazy restore<cr>", "Restore" },
	-- 	l = { "<cmd>Lazy<cr>", "Lazy" },
	-- },
	--
	-- o = {
	-- 	name = "Options",
	-- 	w = { '<cmd>lua require("enze.functions").toggle_option("wrap")<cr>', "Wrap" },
	-- 	r = { '<cmd>lua require("enze.functions").toggle_option("relativenumber")<cr>', "Relative" },
	-- 	l = { '<cmd>lua require("enze.functions").toggle_option("cursorline")<cr>', "Cursorline" },
	-- 	s = { '<cmd>lua require("enze.functions").toggle_option("spell")<cr>', "Spell" },
	-- 	t = { '<cmd>lua require("enze.functions").toggle_tabline()<cr>', "Tabline" },
	-- },
	--
	--
	--
	-- r = {
	-- 	name = "Replace",
	-- 	r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
	-- 	w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
	-- 	f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
	-- },
	--
	-- d = {
	-- 	name = "Debug",
	-- 	b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
	-- 	c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
	-- 	i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
	-- 	o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
	-- 	O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
	-- 	r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
	-- 	l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
	-- 	u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
	-- 	x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
	-- },
	--
	-- f = {
	-- 	name = "Find",
	-- 	b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	-- 	c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
	-- 	f = { "<cmd>Telescope find_files<cr>", "Find File" },
	-- 	t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
	-- 	s = { "<cmd>Telescope grep_string theme=ivy<cr>", "Find String" },
	-- 	h = { "<cmd>Telescope help_tags<cr>", "Help" },
	-- 	i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
	-- 	l = { "<cmd>Telescope resume<cr>", "Last Search" },
	-- 	M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
	-- 	r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
	-- 	R = { "<cmd>Telescope registers<cr>", "Registers" },
	-- 	k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	-- 	C = { "<cmd>Telescope commands<cr>", "Commands" },
	-- },
	--
	-- g = {
	-- 	name = "Git",
	-- 	g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
	-- 	j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
	-- 	k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
	-- 	l = { "<cmd>GitBlameToggle<cr>", "Blame" },
	-- 	p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
	-- 	r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
	-- 	R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
	-- 	s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
	-- 	u = {
	-- 		"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
	-- 		"Undo Stage Hunk",
	-- 	},
	-- 	o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
	-- 	b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	-- 	c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
	-- 	d = {
	-- 		"<cmd>Gitsigns diffthis HEAD<cr>",
	-- 		"Diff",
	-- 	},
	--
	-- 	G = {
	-- 		name = "Gist",
	-- 		a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
	-- 		d = { "<cmd>Gist -d<cr>", "Delete" },
	-- 		f = { "<cmd>Gist -f<cr>", "Fork" },
	-- 		g = { "<cmd>Gist -b<cr>", "Create" },
	-- 		l = { "<cmd>Gist -l<cr>", "List" },
	-- 		p = { "<cmd>Gist -b -p<cr>", "Create Private" },
	-- 	},
	-- },
	--
	-- 	k = {
	-- 		"<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
	-- 		"Prev Diagnostic",
	-- 	},
	-- 	l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
	-- 	o = { "<cmd>SymbolsOutline<cr>", "Outline" },
	-- 	q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
	-- 	r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
	-- 	R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
	-- 	s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
	-- 	S = {
	-- 		"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
	-- 		"Workspace Symbols",
	-- 	},
	-- 	t = { '<cmd>lua require("enze.functions").toggle_diagnostics()<cr>', "Toggle Diagnostics" },
	-- 	u = { "<cmd>LuaSnipUnlinkCurrent<cr>", "Unlink Snippet" },
	-- },
	--
	-- S = {
	-- 	name = "SnipRun",
	-- 	c = { "<cmd>SnipClose<cr>", "Close" },
	-- 	f = { "<cmd>%SnipRun<cr>", "Run File" },
	-- 	i = { "<cmd>SnipInfo<cr>", "Info" },
	-- 	m = { "<cmd>SnipReplMemoryClean<cr>", "Mem Clean" },
	-- 	r = { "<cmd>SnipReset<cr>", "Reset" },
	-- 	t = { "<cmd>SnipRunToggle<cr>", "Toggle" },
	-- 	x = { "<cmd>SnipTerminate<cr>", "Terminate" },
	-- },
	--
	--
	-- T = {
	-- 	name = "Treesitter",
	-- 	h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
	-- 	p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
	-- 	r = { "<cmd>TSToggle rainbow<cr>", "Rainbow" },
	-- },
}

local vopts = {
	mode = "v", -- VISUAL mode
	--  prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
	mode = { "v" },
	{ "<leader>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment toggle linewise (visual)" },
	{ "<leader>s", "<esc><cmd>'<,'>SnipRun<cr>", desc = "Run range" },
}

which_key.setup(setup)
-- which_key.add(mappings, opts)
which_key.add(vmappings, vopts)
