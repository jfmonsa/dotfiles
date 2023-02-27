local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- reload configuracion
keymap('n', '<leader>r', ':source % <CR>', opts)
-- fast saving with <leader> and s
keymap('n', '<leader>s', ':w<CR>', opts)
-- keymap('i', '<leader>s', '<C-c>:w<CR>', opts)

-- don't use arrow keys
keymap('', '<up>', '<nop>', {noremap = true})
keymap('', '<down>', '<nop>', {noremap = true})
keymap('', '<left>', '<nop>', {noremap = true})
keymap('', '<right>', '<nop>', {noremap = true})
keymap('i', '<C-h>', '<left>', opts)
keymap('i', '<C-j>', '<down>', opts)
keymap('i', '<C-k>', '<up>', opts)
keymap('i', '<C-l>', '<right>', opts)
-- Insert --
-- Press jk fast to enter
--  keymap("i", "jk", "<ESC>", opts)
--  keymap("i", "kj", "<ESC>", opts)

-- Buffers & splits
-- close all windows and exit from neovim
keymap('n', '<leader>q', ':quitall<CR>', opts)
-- move around splits using Ctrl + {h,j,k,l}
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)


-- Move text up and down
-- for normal mode
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)
-- for visual mode
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
--for visual block --
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------
-- open terminal
keymap('n', '<C-t>', ':Term<CR>', {noremap = true})
keymap('t', '<C-w>h', '<C-\\><C-n><C-w>h', {noremap = true})
keymap('t', '<C-w>j', '<C-\\><C-n><C-w>j', {noremap = true})
keymap('t', '<C-w>k', '<C-\\><C-n><C-w>k', {noremap = true})
keymap('t', '<C-w>l', '<C-\\><C-n><C-w>l', {noremap = true})
keymap('t', '<C-w><C-w>', '<C-\\><C-n><C-w><C-w>', {noremap = true})

--nvim-lazygit
keymap('n', '<C-g>', ':LazyGit<CR>', opts)       -- open/close

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>t", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>T", "<cmd>Telescope live_grep<cr>", opts)
-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)
keymap("n", "<leader>b", ":NvimTreeToggle<CR>",opts)
keymap('n', '<leader>ts', ':Telescope symbols<CR>', opts)
