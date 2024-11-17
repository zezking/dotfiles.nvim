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
	-- Theme tokyonight
	{
		"folke/tokyonight.nvim",
		branch = "main",
		lazy = false,
		priority = 1000,
		config = function()
			require("plugins.configs.tokyonight")
		end,
	},
	-- mini icons
	{ "echasnovski/mini.icons", version = "*" },

	-- which-key
	{
		"folke/which-key.nvim",
		config = function()
			require("plugins.configs.which-key")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		config = function()
			require("plugins.configs.bufferline")
		end,
	},
	-- Telescipe, FzFinder
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("plugins.configs.telescope")
		end,
	},
	{ "nvim-telescope/telescope-media-files.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim" },
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("plugins.configs.project")
		end,
	},
	{ "ibhagwan/fzf-lua" },
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins.configs.toggle-term")
		end,
	},
	-- LSP symbols and tags visualizer
	{ "liuchengxu/vista.vim" },
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

	-- Auto completions
	{ "hrsh7th/cmp-buffer" }, -- buffer completions
	{ "hrsh7th/cmp-path" }, -- path completions
	{ "hrsh7th/cmp-cmdline" }, -- cmdline completions
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-emoji" },
	{ "hrsh7th/cmp-nvim-lua" },
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.configs.cmp")
		end,
	},

	-- Snippet
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("plugins.configs.lua-snip")
		end,
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"saadparwaiz1/cmp_luasnip",
	},
	{ "rafamadriz/friendly-snippets" },

	-- Delete buffers (close files) without closing windows or messing up layout
	{ "moll/vim-bbye" },

	-- Manage and Install LSP servers
	{ "williamboman/mason-lspconfig" },
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins.configs.lsp.mason")
		end,
	},

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
	{ "onsails/lspkind.nvim" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lsp.lspconfig")
		end,
	},

	-- Formatting
	{
		"jayp0521/mason-null-ls.nvim",
		dependencies = {
			-- Dependencies needed because none-ls removed some unmaintained default lsps
			-- Migrate to conform, Look into https://github.com/zapling/mason-conform.nvim
			"nvimtools/none-ls-extras.nvim",
			"gbprod/none-ls-shellcheck.nvim",
		},
	},
	-- none-ls is an active community folk of null-ls.
	-- null-ls is archived
	{
		"nvimtools/none-ls.nvim",
		config = function()
			require("plugins.configs.lsp.null-ls")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "nvim-treesitter/playground" },

	-- Auto closing
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.configs.autopairs")
		end,
	},
	{ "windwp/nvim-ts-autotag" },

	-- UI
	{
		"stevearc/dressing.nvim",
		config = function()
			require("plugins.configs.dressing")
		end,
	},
	{
		"SmiteshP/nvim-navic",
		config = function()
			require("plugins.configs.navic")
		end,
		dependencies = { { "neovim/nvim-lspconfig" } },
	},
	{ "kshenoy/vim-signature" },
	{ "Saecki/crates.nvim" },

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
	-- Surround words with: "({[
	{
		"kylechui/nvim-surround",
		config = function()
			require("plugins.configs.surround")
		end,
	},
	-- Comment stuff
	{
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.configs.comment")
		end,
	}, -- Impatient optimize the startup time
	{ "lewis6991/impatient.nvim" },
	-- Smooth Scrolling
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("plugins.configs.neoscroll")
		end,
	},
	--Dashboard
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("plugins.configs.dashboard")
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	-- AI
	-- Disable for now
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot").setup({})
	-- 	end,
	-- },
	-- {
	-- 	"jackMort/ChatGPT.nvim",
	-- 	config = function()
	-- 		require("plugins.configs.chatgpt")
	-- 	end,
	-- 	dependencies = {
	-- 		{
	-- 			"MunifTanjim/nui.nvim",
	-- 			"nvim-lua/plenary.nvim",
	-- 			"nvim-telescope/telescope.nvim",
	-- 		},
	-- 	},
	-- },
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- },
	{
		"lervag/vimtex",
		lazy = false,
	},
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.configs.git-blame")
		end,
	},
	-- Persistence for session
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		config = function()
			require("plugins.configs.persistence")
		end,
	},
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
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
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
	{
		"ggandor/leap.nvim",
		config = function()
			require("plugins.configs.leap")
		end,
	},
}
