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
		width = 0.4,
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
	{ "<leader>we", hidden = true },
	{ "<leader>q", hidden = true },
	-- Hide Fzf lua
	{ "<leader>k", hidden = true },
	{ "<leader>t", hidden = true },
	{ "<leader><leader>", hidden = true },
	-- Hide explorer
	{ "<leader>e", hidden = true },
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
	{ "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format" },
	{ "<leader>lF", "<cmd>LspToggleAutoFormat<cr>", desc = "Toggle autoformat" },
	{ "<leader>ld", "<cmd>Lspsaga goto_definition<cr>", desc = "Go to definition" },
	{ "<leader>lt", '<cmd>lua require("enze.functions").toggle_diagnostics()<cr>', desc = "Toggle Diagnostics" },
	{ "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "Workspace diagnostics" },
	{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
	{ "<leader>lh", "<cmd>IlluminationToggle<cr>", desc = "Toggle Doc HL" },
	{ "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", desc = "Next diagnostic" },
	{ "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", desc = "Prev diagnostic" },
})

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
	{ "<leader>fb", "<cmd>FzfLua git_branches<cr>", desc = "Checkout branch" },
	{ "<leader>fc", "<cmd>FzfLua colorschemes<cr>", desc = "Colorscheme" },
	{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find File" },
	{ "<leader>ft", "<cmd>FzfLua live_grep<cr>", desc = "Find Text" },
	{ "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
	{ "<leader>fC", "<cmd>FzfLua commands<cr>", desc = "Commands" },
})

-- Git
which_key.add({
	mode = { "n" },
	{ "<leader>g", group = "Git" },
	{ "<leader>gl", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
	{ "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
	{ "<leader>gl", "<cmd>GitBlameToggle<cr>", desc = "Blame" },
	{ "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
	{ "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
	{ "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
	{ "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
	{ "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
	{ "<leader>go", "<cmd>FzfLua git_status<cr>", desc = "Open changed file" },
	{ "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "Checkout branch" },
	{ "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "Checkout commit" },
	{ "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
})

-- Trouble
which_key.add({
	mode = { "n" },
	{ "<leader>x", group = "Trouble", icon = "" },
})
