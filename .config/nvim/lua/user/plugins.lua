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

  -- Theme
  {
   -- "lunarvim/darkplus.nvim",
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  -- Basic stuff
  "nvim-lua/popup.nvim", -- an implementation of the popup api from vim in neovim
  "nvim-lua/plenary.nvim", -- useful lua functions used ny lots of plugins
  "windwp/nvim-autopairs", -- autopairs, integrates with both cmp and treesitter
  "numtostr/comment.nvim", -- easily comment stuff
  {
  "akinsho/bufferline.nvim",
  dependencies = {"https://github.com/moll/vim-bbye"}
  },

  -- LSP configuration  
   {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'jose-elias-alvarez/null-ls.nvim', -- lsp diagnostics and code actions
      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },
      -- Additional lua configuration, makes nvim stuff amazing!
      -- 'folke/neodev.nvim',
    },
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-buffer", -- buffer completions
      "hrsh7th/cmp-path", -- path completions
      "hrsh7th/cmp-cmdline", -- cmdline completions
      "saadparwaiz1/cmp_luasnip", -- snippet completions
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
    },
  },

  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append "eol:󰌑"
    end,
  },

  -- Git
  "lewis6991/gitsigns.nvim",

  -- Nvim-tree
  'kyazdani42/nvim-web-devicons',
  'kyazdani42/nvim-tree.lua',


  -- telescope
  "nvim-telescope/telescope.nvim",
  'nvim-telescope/telescope-media-files.nvim',

 -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      "p00f/nvim-ts-rainbow",
      'joosepalviste/nvim-ts-context-commentstring',
      -- "nvim-treesitter/playground" <- see sintax tree
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
})
