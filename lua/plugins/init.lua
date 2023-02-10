return {
	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		module = "neo-tree",
		cmd = "Neotree",
		dependencies = { { "MunifTanjim/nui.nvim", module = "nui" }, "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons"},
		config = function()
			require("plugins.configs.neo-tree")
		end,
	},
	{
		"folke/tokyonight.nvim",
		branch = 'main',
		lazy = false,
		priority = 1000,
		config=function()
			require("plugins.configs.tokyonight")
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("plugins.configs.which-key")
		end,
	},
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies ={{'nvim-lua/plenary.nvim'}},
		config = function()
			require("plugins.configs.telescope")
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
}
