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
	-- colorschemes
	{
		--"navarasu/onedark.nvim",
		"Shatur/neovim-ayu",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("ayu-dark")
		end,
	},

	-- Basic stuff
	"nvim-lua/popup.nvim", -- an implementation of the popup api from vim in neovim
	"nvim-lua/plenary.nvim", -- useful lua functions used ny lots of plugins

	-- icons
	{
		"nvim-tree/nvim-web-devicons",
		priority = 999,
	},
	--	"adelarsq/vim-devicons-emoji",

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
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
			-- `opts = {}` is the same as calling `require('fidget').setup({})`
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

	-- Layout
	"MunifTanjim/nui.nvim",
	{
		"arsham/arshamiser.nvim",
		dependencies = {
			"arsham/arshlib.nvim",
			"famiu/feline.nvim",
			"rebelot/heirline.nvim",
			-- intalled because checkhealth
			"nanotee/sqls.nvim",
			"arsham/listish.nvim",
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
    }, ]]
	{
		"akinsho/bufferline.nvim",
		dependencies = { "https://github.com/moll/vim-bbye" },
	},
	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			--[[ "nvim-lua/plenary.nvim", ]]
			--[[ "muniftanjim/nui.nvim", ]]
		},
	},
	--[[ {
		"kyazdani42/nvim-tree.lua",
		commit = "9c97e6449b0b0269bd44e1fd4857184dfa57bb4c",
	}, ]]

	-- tagviewer and general overviem
	{
		"sidebar-nvim/sidebar.nvim",
		config = function()
			local sidebar = require("sidebar-nvim")
			local opts = { open = false }
			sidebar.setup(opts)
		end,
		dependencies = { "sidebar-nvim/sections-dap" },
	},
	--this doesn't seem to work, use pacman -S ctags instead
	{ "universal-ctags/ctags", priority = 998 },
	{
		"liuchengxu/vista.vim",
		config = function()
			local g = vim.g
			local cmd = vim.cmd
			g.vista_icon_indent = '["╰─▸ ", "├─▸ "]'
			g.vista_default_executive = "ctags"
			cmd([[let g:vista#renderer#enable_icon = 1]])
			cmd([[let g:vista_default_executive = 'ctags']])
		end,
	},
	-- Lua
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
	},

	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	},
	-- Other plugins
	"norcalli/nvim-colorizer.lua",
	"numtostr/comment.nvim", -- easily comment stuff
	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
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

	-- autopair
	--use "windwp/nvim-autopairs"
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup({})
		end,
	},
	"andymass/vim-matchup",

	-- telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	"nvim-telescope/telescope-symbols.nvim",
	--   "kdheepak/lazygit.nvim",
	"folke/todo-comments.nvim",
	-- vim wiki
	{
		"vimwiki/vimwiki",
		config = function()
			vim.cmd("let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]")
		end,
	},
	{
		"dkarter/bullets.vim",
		config = function()
			vim.cmd("let g:bullets_enabled_file_types = ['markdown','text','gitcommit','scratch']")
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
})
