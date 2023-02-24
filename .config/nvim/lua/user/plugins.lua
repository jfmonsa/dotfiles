local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- install your plugins here
  "wbthomason/packer.nvim", -- have packer manage itself
  "nvim-lua/popup.nvim", -- an implementation of the popup api from vim in neovim
  "nvim-lua/plenary.nvim", -- useful lua functions used ny lots of plugins
  "windwp/nvim-autopairs", -- autopairs, integrates with both cmp and treesitter
  "numtostr/comment.nvim", -- easily comment stuff

  -- Tabs (Buffers)
  "akinsho/bufferline.nvim",
  "moll/vim-bbye",

  -- Git
  "lewis6991/gitsigns.nvim",

  -- Nvim-tree
  'kyazdani42/nvim-web-devicons',
  'kyazdani42/nvim-tree.lua',

  -- colorschemes
  --use "https://github.com/folke/tokyonight.nvim"
  -- use "lunarvim/colorschemes" -- a bunch of colorschemes you can try out
  "lunarvim/darkplus.nvim",

  -- telescope
  "nvim-telescope/telescope.nvim",
  'nvim-telescope/telescope-media-files.nvim',

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':tsupdate'
  },
  "p00f/nvim-ts-rainbow",
  'joosepalviste/nvim-ts-context-commentstring',
  -- use "nvim-treesitter/playground" <- see sintax tree

  -- cmp plugins
  "hrsh7th/nvim-cmp", -- the completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  -- snippets
  "l3mon4d3/luasnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -- lsp
  "neovim/nvim-lspconfig", -- enable lsp
  "williamboman/mason.nvim", -- simple to use language server installer
  "williamboman/mason-lspconfig.nvim", -- simple to use language server installer
  'jose-elias-alvarez/null-ls.nvim', -- lsp diagnostics and code actions
})
