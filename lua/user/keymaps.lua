M = {}

-- Choose +ESC option for option key in iterm2 config to allow alt to be mapped
local Remap = require("plugins.configs.keymaps")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)

-- greatest remap ever
xnoremap("<leader>p", '"_dP')

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nmap("<leader>Y", '"+Y')

-- Harpoon
nnoremap("<S-l>", function()
	require("harpoon"):list():add()
end)

nnoremap("<S-u>", function()
	require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end)

nnoremap("<S-m>1", function()
	require("harpoon"):list():select(1)
end)

nnoremap("<S-m>2", function()
	require("harpoon"):list():select(2)
end)

nnoremap("<S-m>3", function()
	require("harpoon"):list():select(3)
end)

nnoremap("<S-m>4", function()
	require("harpoon"):list():select(4)
end)

nnoremap("<S-m>5", function()
	require("harpoon"):list():select(5)
end)

nnoremap("<S-m>6", function()
	require("harpoon"):list():select(6)
end)

nnoremap("<S-m>7", function()
	require("harpoon"):list():select(7)
end)

nnoremap("<S-m>8", function()
	require("harpoon"):list():select(8)
end)

nnoremap("<S-m>9", function()
	require("harpoon"):list():select(9)
end)

nnoremap("<S-m>0", function()
	require("harpoon"):list():select(10)
end)

-- Move lines up and down
nnoremap("<S-Up>", ":m-2<CR>")
nnoremap("<S-Down>", ":m+<CR>")
inoremap("<S-Up>", "<Esc>:m-2<CR>")
inoremap("<S-Down>", "<Esc>:m+<CR>")
inoremap("<C-c>", "<Esc>")

-- Resize with arrows
keymap("n", "+", ":resize -2<CR>", opts)
keymap("n", "_", ":resize +2<CR>", opts)
keymap("n", "=", ":vertical resize -2<CR>", opts)
keymap("n", "-", ":vertical resize +2<CR>", opts)

-- Increase and decrease numbers
keymap("n", "<leader>+", "<C-a>", opts)
keymap("n", "<leader>-", "<C-x>", opts)

-- Naviagate buffers
keymap("n", "]b", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
keymap("n", "[b", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })

-- Splits
keymap("n", "<leader>wv", "<C-w>v", opts)
keymap("n", "<leader>wh", "<C-w>s", opts)

-- Custom
-- Clear searh when esc esc
keymap("n", "<esc><esc>", "<cmd>nohlsearch<cr>", opts)
keymap("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
keymap("n", "<C-s>", "<cmd>vsplit<cr>", opts)

-- Visual
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Open Documentation in man
keymap("n", "K", ":lua require('user.functions').show_documentation()<CR>", opts)

-- Fzf-lua
keymap("n", "<tab>", "<cmd>lua require('fzf-lua').files()<cr>", { desc = "Search file" })
keymap("n", "<leader><leader>", "<cmd>lua require('fzf-lua').resume()<cr>", { desc = "Resume search" })
keymap("n", "<leader>k", "<cmd>lua require('fzf-lua').keymaps()<cr>", { desc = "Key mappings" })
keymap("n", "<leader>t", "<cmd>lua require('fzf-lua').live_grep()<cr>", { desc = "Live grep" })
keymap("n", "<leader>b", "<cmd>lua require('fzf-lua').buffers()<cr>", { desc = "Buffer list" })
keymap("n", "<leader>qf", "<cmd>lua require('fzf-lua').quickfix()<cr>", { desc = "Quickfix list" })

-- Orgnize imports
keymap("n", "<leader>lo", "<cmd>lua require('user.functions').organize_imports()<cr>", { desc = "Organize imports" })
-- Oil
keymap("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Explorer" })

-- Close buffers
keymap("n", "<leader>cab", "<cmd>%bd | e#<cr>", { desc = "Close all buffers but this one" })

-- Select and replace in selection
keymap("v", "<leader>r", ":s/\\%V", { desc = "Replace in selection" })

return M
