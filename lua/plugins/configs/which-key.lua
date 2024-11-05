local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	preset = "modern",
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
		width = 0.5,
		col = 0.5,
	},
	layout = {
		spacing = 3, -- spacing between columns
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

which_key.setup(setup)

-- Navigation
which_key.add({
	mode = { "n" },
	-- TODO: enze.bfs are broken. Need to fix
	{ "<leader>b", "<cmd>lua require('enze.bfs').open()<cr>", desc = "Buffers" },
	{ "<leader>e", "<cmd>Oil<cr>", icon = " ", desc = "Explorer" },
	{ "<leader>gy", desc = "Open code in Browser" },
	-- Hide comment
	{ "<leader>/", "<Plug>(comment_toggle_linewise_current)", hidden = true, desc = "Comment" },
	-- Hide bufferline keymaps
	{ "<leader>1", hidden = true },
	{ "<leader>2", hidden = true },
	{ "<leader>3", hidden = true },
	{ "<leader>4", hidden = true },
	{ "<leader>5", hidden = true },
	{ "<leader>6", hidden = true },
	{ "<leader>7", hidden = true },
	{ "<leader>8", hidden = true },
	{ "<leader>9", hidden = true },
	{ "<leader>$", hidden = true },
	{ "<leader>r", hidden = true },
	-- Hide lspsaga keymappings
	{ "<leader>a", hidden = true },
	{ "<leader>d", hidden = true },
	{ "<leader>o", hidden = true },
	-- Hide default keymappings
	{ "<leader>y", hidden = true },
	{ "<leader>Y", hidden = true },
	{ "<leader>w", hidden = true },
	{ "<leader>+", hidden = true },
	{ "<leader>-", hidden = true },
	-- { "<leader>.", desc = "Goto prev harpoon" },
	-- { "<leader>,", desc = "Goto next harpoon" },
})

-- Harpoon
which_key.add({
	{ mode = { "n" } },
	{ "<leader>h", group = "Harpoon", desc = "Harpoon" },
	{ "<leader>ha", "<cmd>lua require('harpoon'):list():add()<cr>", desc = "Add to list" },
})
-- Buffers
which_key.add({
	mode = { "n" },
	{ "<leader>b", group = "Buffers", desc = "Buffers" },
	{ "<leader>bp", "<cmd>BufferLinePick<cr>" },
	{ "<leader>bb", "<cmd>lua require('enze.bfs').open()<cr>", desc = "Buffers open" },
})

-- LSP
which_key.add({
	mode = { "n" },
	{ "<leader>l", group = "LSP", icon = "󰿘" },
	{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>" },
	{ "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format" },
	{ "<leader>lF", "<cmd>LspToggleAutoFormat<cr>", desc = "Toggle autoformat" },
	{ "<leader>ld", "<cmd>Lspsaga goto_definition<cr>", desc = "Go to definition" },
	{ "<leader>lt", '<cmd>lua require("enze.functions").toggle_diagnostics()<cr>', desc = "Toggle Diagnostics" },
	{ "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "Workspace diagnostics" },
	{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
	{ "<leader>lh", "<cmd>IlluminationToggle<cr>", desc = "Toggle Doc HL" },
	{ "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
	{ "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", desc = "Next diagnostic" },
	{ "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", desc = "Prev diagnostic" },
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
-- Use Tmux for session management for now
-- which_key.add({
-- 	mode = { "n" },
-- 	{ "<leader>s", group = "Session" },
-- 	{ "<leader>ss", "<cmd>SessionSave<cr>", desc = "Save" },
-- 	{ "<leader>sr", "<cmd>SessionRestore<cr>", desc = "Restore" },
-- 	{ "<leader>sf", "<cmd>Autosession search<cr>", desc = "Find" },
-- 	{ "<leader>sd", "<cmd>Autosession delete<cr>", desc = "Find Delete" },
-- })

-- Close buffers
which_key.add({
	mode = { "n" },
	{ "<leader>c", group = "Close buffers" },
	{ "<leader>cc", "<cmd>Bdelete!<CR>", desc = "Close buffer" },
	{ "<leader>cl", "<cmd>BufferLineCloseLeft<CR>", desc = "Close all buffers to the left" },
	{ "<leader>cr", "<cmd>BufferLineCloseRight<CR>", desc = "Close all buffers to the right" },
	{ "<leader>co", "<cmd>BufferLineCloseOthers<CR>", desc = "Close all other buffers" },
	{ "<leader>cp", "<cmd>BufferLinePickClose<CR>", desc = "Close by pick" },
})
-- Find
which_key.add({
	mode = { "n" },
	{ "<leader>f", group = "Find" },
	{ "<leader>fb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
	{ "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
	{ "<leader>ft", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text" },
	{ "<leader>fs", "<cmd>Telescope grep_string theme=ivy<cr>", desc = "Find String" },
	{ "<leader>fh", "<cmd>Telecope help_tags<cr>", desc = "Help" },
	{ "<leader>fi", "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", desc = "Media" },
	{ "<leader>fl", "<cmd>Telescope resume<cr>", desc = "Last Search" },
	{ "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent File" },
	{ "<leader>fR", "<cmd>Telescope registers<cr>", desc = "Registers" },
	{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
	{ "<leader>fC", "<cmd>Telescope commands<cr>", desc = "Commands" },
	{
		"<leader>fp",
		"<cmd>lua require('telescope').extensions.projects.projects()<cr>",
		icon = " ",
		desc = "Projects",
	},
})
-- Git
which_key.add({
	mode = { "n" },
	{ "<leader>g", group = "Git" },
	{ "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit" },
	{ "<leader>gl", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
	{ "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
	{ "<leader>gl", "<cmd>GitBlameToggle<cr>", desc = "Blame" },
	{ "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
	{ "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
	{ "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
	{ "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
	{ "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
	{ "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
	{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
	{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
	{ "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
})

--local mappings = {
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
-- }

-- local vopts = {
-- 	mode = "v", -- VISUAL mode
-- 	--  prefix = "<leader>",
-- 	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
-- 	silent = true, -- use `silent` when creating keymaps
-- 	noremap = true, -- use `noremap` when creating keymaps
-- 	nowait = true, -- use `nowait` when creating keymaps
-- }
-- local vmappings = {
-- 	mode = { "v" },
-- 	{ "<leader>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment toggle linewise (visual)" },
-- 	{ "<leader>s", "<esc><cmd>'<,'>SnipRun<cr>", desc = "Run range" },
-- }

-- which_key.add(vmappings, vopts)
