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

	-- Basic stuff
	"nvim-lua/popup.nvim", -- an implementation of the popup api from vim in neovim
	"nvim-lua/plenary.nvim", -- useful lua functions used ny lots of plugins
	"numtostr/comment.nvim", -- easily comment stuff
	-- colorschemes
	{
		--"navarasu/onedark.nvim",
		"Shatur/neovim-ayu",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("ayu-dark")
		end,
	},

	-- autopair
	--use "windwp/nvim-autopairs"
	-- autoclose.
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup({})
		end,
	},

	-- icons
	"kyazdani42/nvim-web-devicons",
	"adelarsq/vim-devicons-emoji",
	-- tagviewer
	--[[ {
        "liuchengxu/vista.vim",
        config = function()
                    require("config.vista")
        end,
    }, ]]

	-- highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"p00f/nvim-ts-rainbow",
			"joosepalviste/nvim-ts-context-commentstring",
			-- "nvim-treesitter/playground" <- see sintax tree
		},
		config = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},

	-- File explorer
	--[[ {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      -- "nvim-lua/plenary.nvim",
      --"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      -- "muniftanjim/nui.nvim"
    },
  }, ]]
	{ -- not strictly required, but recommended
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		commit = "9c97e6449b0b0269bd44e1fd4857184dfa57bb4c",
	},
	-- status bar
	--[[{
		"feline-nvim/feline.nvim",
		dependencies = {
			"gitsigns.nvim",
			"nvim-web-devicons",
		},
	},
  ]]

	{
		"arsham/arshamiser.nvim",
		dependencies = {
			"arsham/arshlib.nvim",
			"famiu/feline.nvim",
			"rebelot/heirline.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			-- ignore any parts you don't want to use
			vim.cmd.colorscheme("arshamiser_light")
			require("arshamiser.feliniser")
			-- or:
			-- require("arshamiser.heirliniser")

			_G.custom_foldtext = require("arshamiser.folding").foldtext
			vim.opt.foldtext = "v:lua.custom_foldtext()"
			-- if you want to draw a tabline:
			vim.api.nvim_set_option("tabline", [[%{%v:lua.require("arshamiser.tabline").draw()%}]])
		end,
	},
	-- tabs
	--[[ {
        "noib3/nvim-cokeline",
        config = function()
            require("config.cokeline")
        end,
        dependencies = "kyazdani42/nvim-web-devicons",
    }, ]]
	{
		"akinsho/bufferline.nvim",
		dependencies = { "https://github.com/moll/vim-bbye" },
	},

	-- LSP configuration
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/null-ls.nvim", -- lsp diagnostics and code actions
			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },
			-- Additional lua configuration, makes nvim stuff amazing!
			-- 'folke/neodev.nvim',
		},
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
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
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help indent_blankline.txt`
		opts = {
			char = "┊",
			show_trailing_blankline_indent = false,
		},
		config = function()
			-- vim.opt.list = true
			-- vim.opt.listchars:append "eol:󰌑"
		end,
	},

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	--   "kdheepak/lazygit.nvim",

	-- telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	"nvim-telescope/telescope-symbols.nvim",

	"norcalli/nvim-colorizer.lua",
})
