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
	{
		"folke/tokyonight.nvim",
		branch = "main",
		lazy = false,
		priority = 1000,
		config = function()
			require("plugins.configs.tokyonight")
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("plugins.configs.which-key")
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
	-- Snippets
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },

	-- Delete buffers (close files) without closing windows or mesing up layout
	{ "moll/vim-bbye" },
	-- LSP Servers
	{
		"glepnir/lspsaga.nvim",
		config = function()
			require("plugins.configs.lsp.lspsaga")
		end,
	},
	{ "onsails/lspkind.nvim" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lsp.lspconfig")
		end,
	},
	{ "williamboman/mason-lspconfig" },
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins.configs.lsp.mason")
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
	{
		"simrat39/rust-tools.nvim",
	},
	{ "Saecki/crates.nvim" },
}
