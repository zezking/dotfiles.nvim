return {
	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		module = "neo-tree",
		cmd = "Neotree",
		dependencies = {
			{ "MunifTanjim/nui.nvim", module = "nui" },
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugins.configs.neo-tree")
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
	-- AutoSession
	{
		"rmagatti/auto-session",
		lazy = false,
		config = function()
			require("plugins.configs.auto-session")
		end,
		---enables autocomplete for opts
		---@module "auto-session"
		---@type AutoSession.Config
		-- opts = {
		-- 	suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		-- 	-- log_level = 'debug',
		--},
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
		dependencies = { "nvim-lua/plenary.nvim" },
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
	-- Snippetstypescript-language-server --stdio

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
	{ "jayp0521/mason-null-ls.nvim" },
	{
		"jose-elias-alvarez/null-ls.nvim",
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
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.configs.lualine")
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
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
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({})
		end,
	},
	{
		"jackMort/ChatGPT.nvim",
		config = function()
			require("plugins.configs.chatgpt")
		end,
		dependencies = {
			{
				"MunifTanjim/nui.nvim",
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope.nvim",
			},
		},
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
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
}
