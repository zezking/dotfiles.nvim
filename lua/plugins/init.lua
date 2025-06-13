return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		config = function()
			require("plugins.configs.oil")
		end,
	},

	-- Theme kanagawa
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("plugins.configs.kanagawa")
		end,
	},

	--	Which key
	{
		"folke/which-key.nvim",
		config = function()
			require("plugins.configs.which-key")
		end,
	},

	-- fzf lua
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = require("plugins.configs.fzf-lua"),
		config = function()
			local config = require("fzf-lua").config
			local actions = require("trouble.sources.fzf").actions
			local setup = require("fzf-lua").setup
			setup({ defaults = { git_icons = false, file_icons = false, color_icons = false } })
			config.defaults.actions.files["ctrl-t"] = actions.open
		end,
	},

	-- Project navigation
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		commit = "e76cb03",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.configs.harpoon")
		end,
	},

	{
		"saghen/blink.cmp",
		build = "cargo +nightly build --release",
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = require("plugins.configs.lsp.cmp"),
		opts_extend = { "sources.default" },
	},

	-- Snippet
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("plugins.configs.lua-snip")
		end,
		dependencies = { "rafamadriz/friendly-snippets" },
	},

	-- Manage and install LSP servers
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = require("plugins.configs.lsp.mason-lspconfig") },
			"neovim/nvim-lspconfig",
		},
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = require("plugins.configs.conform"),
	},
	{ "zapling/mason-conform.nvim" },

	-- Config for LSP Servers
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("plugins.configs.lsp.lspsaga")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	-- Vscode-like pictograms for neovim lsp completion items
	{ "onsails/lspkind.nvim" },
	{ "b0o/schemastore.nvim", lazy = true, version = false },
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lsp.lspconfig")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},
	{ "windwp/nvim-ts-autotag" },
	{
		"SmiteshP/nvim-navic",
		config = function()
			require("plugins.configs.navic")
		end,
		dependencies = { { "neovim/nvim-lspconfig" } },
	},
	--
	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.configs.lualine")
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"Isrothy/lualine-diagnostic-message",
	},

	-- -- Surround words with: "({[
	{
		"kylechui/nvim-surround",
		config = function()
			require("plugins.configs.surround")
		end,
	},
	--
	-- Comment stuff
	{
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.configs.comment")
		end,
		dependencies = { { "JoosepAlviste/nvim-ts-context-commentstring" } },
	},

	-- -- AI
	{
		"github/copilot.vim",
		config = function()
			require("plugins.configs.copilot")
		end,
	},

	-- Git signs
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	--
	-- Persistence for session
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		config = function()
			require("plugins.configs.persistence")
		end,
	},

	-- This plugin is used to navigate between tmux panes and vim splits seamlessly
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	-- Trouble is a plugin that provides a quick way to access and manage the diagnostics list and the quickfix list.
	{
		"folke/trouble.nvim",
		opts = require("plugins.configs.trouble"), -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	-- Neovim's answer to mouse
	{
		"ggandor/leap.nvim",
		config = function()
			require("plugins.configs.leap")
		end,
	},

	-- Leetcode in neovim
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
		dependencies = {
			"ibhagwan/fzf-lua",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			-- configuration goes here
		},
	},
	--Colorizer to display color codes in the file
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	-- {
	-- 	"scalameta/nvim-metals",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	ft = { "scala", "sbt", "java" },
	-- 	opts = function()
	-- 		local metals_config = require("metals").bare_config()
	-- 		metals_config.on_attach = function(client, bufnr)
	-- 			-- your on_attach function
	-- 		end
	--
	-- 		return metals_config
	-- 	end,
	-- 	config = function(self, metals_config)
	-- 		local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
	-- 		vim.api.nvim_create_autocmd("FileType", {
	-- 			pattern = self.ft,
	-- 			callback = function()
	-- 				require("metals").initialize_or_attach(metals_config)
	-- 			end,
	-- 			group = nvim_metals_group,
	-- 		})
	-- 	end,
	-- },
}
