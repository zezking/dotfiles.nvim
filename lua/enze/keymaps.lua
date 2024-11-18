M = {}

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

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

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

--Bufferline tabs
nnoremap("<leader>1", function()
	require("bufferline").go_to_buffer(1, true)
end, opts)
nnoremap("<leader>2", function()
	require("bufferline").go_to_buffer(2, true)
end, opts)
nnoremap("<leader>3", function()
	require("bufferline").go_to_buffer(3, true)
end, opts)
nnoremap("<leader>4", function()
	require("bufferline").go_to_buffer(4, true)
end, opts)
nnoremap("<leader>5", function()
	require("bufferline").go_to_buffer(5, true)
end, opts)
nnoremap("<leader>6", function()
	require("bufferline").go_to_buffer(6, true)
end, opts)
nnoremap("<leader>7", function()
	require("bufferline").go_to_buffer(7, true)
end, opts)
nnoremap("<leader>8", function()
	require("bufferline").go_to_buffer(8, true)
end, opts)
nnoremap("<leader>9", function()
	require("bufferline").go_to_buffer(9, true)
end, opts)
nnoremap("<leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>")

-- Tabs --
-- keymap("n", "<enter>", ":tabnew %<cr>", opts)
-- keymap("n", "<s-enter>", ":tabclose<cr>", opts)
-- keymap("n", "<m-\\>", ":tabonly<cr>", opts)
-- Change tabs
-- This are configured in the QMK firmware
-- keymap("n", "<S-,>", ":tabnext", opts)
-- keymap("n", "<S-.>", ":tabprevious", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Increase and decrease numbers
keymap("n", "<leader>+", "<C-a>", opts)
keymap("n", "<leader>-", "<C-x>", opts)

-- Naviagate buffers
keymap("n", "<C-k>", ":bnext<CR>", opts)
keymap("n", "<C-j>", ":bprevious<CR>", opts)

-- Splits
-- TODO: Fix Conflits with sessions
keymap("n", "<leader>wv", "<C-w>v", opts)
keymap("n", "<leader>wh", "<C-w>s", opts)
keymap("n", "<leader>we", "<C-w>=", opts)
keymap("n", "<leader>wv", ":close<CR>", opts)

-- Custom
-- Clear searh when esc esc
keymap("n", "<esc><esc>", "<cmd>nohlsearch<cr>", opts)
keymap("n", "<C-p>", "<cmd>Telescope projects<cr>", opts)
keymap("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
keymap("n", "<C-s>", "<cmd>vsplit<cr>", opts)
keymap("n", "<C-z>", "<cmd>ZenMode<cr>", opts)
keymap("n", "<c-n>", ":e ~/Notes/<cr>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Open Documentation in man
vim.api.nvim_set_keymap("n", "K", ":lua require('user.functions').show_documentation()<CR>", opts)

-- Open little window with files
vim.api.nvim_set_keymap(
	"n",
	"<tab>",
	"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	opts
)

return M
