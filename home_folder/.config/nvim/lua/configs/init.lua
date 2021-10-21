local utils = require("utils")
local execute = vim.api.nvim_command
local cmd = vim.cmd
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

-- Only required if you have packer in your `opt` pack
cmd([[packadd packer.nvim]])

-- Configure Neovim to automatically run :PackerCompile whenever configs.lua is updated with an autocommand:
utils.au("BufWritePost", "**/nvim/lua/configs.*.lua", "PackerCompile")

require("packer").startup({
	function(use)
		-- Packer can manage itself as an optional plugin
		use({ "wbthomason/packer.nvim", opt = true, config = require("configs.packer-nvim") })

		-- UI
		use({ "mhinz/vim-startify", config = require("configs.vim-startify") })
		-- color scheme
		use("arcticicestudio/nord-vim")
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = require("configs.telescope"),
		})
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use 'pangloss/vim-javascript'
		use {'heavenshell/vim-jsdoc', run = 'make install'}
		use 'hashivim/vim-vagrant'
		-- use 'isobit/vim-caddyfile'
		use("glepnir/indent-guides.nvim")
		use({ "itchyny/lightline.vim", config = require("configs.lightline") }) -- Fancier statusline
		use({ "chrisbra/csv.vim", ft = { "csv" } })

		use({
			"pearofducks/ansible-vim",
			config = function()
				require("utils").au("BufRead,BufNewFile", "*/ansible/*.yml", "set filetype=yaml.ansible")
			end,
		})

		-- Treesitter
		use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter", branch = "0.5-compat" })
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = require("configs.nvim-treesitter"),
			branch = "0.5-compat",
		})

		-- Collection of configurations for built-in LSP client
		use({ "neovim/nvim-lspconfig", config = require("configs.lspconfig") })

		use({ "hrsh7th/nvim-cmp", config = require("configs.nvim_cpm") }) -- Autocompletion plugin
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-buffer")
		use("saadparwaiz1/cmp_luasnip")
		use({ "L3MON4D3/LuaSnip", config = require("configs.luasnip") }) -- Snippets plugin

		use("mbbill/undotree")

		use({
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				local null_ls = require("null-ls")
				null_ls.config({
					sources = {
						null_ls.builtins.formatting.stylua,
						null_ls.builtins.formatting.terraform_fmt,
						null_ls.builtins.diagnostics.luacheck,
						null_ls.builtins.diagnostics.write_good,
						null_ls.builtins.diagnostics.misspell,
						null_ls.builtins.diagnostics.misspell,
            null_ls.builtins.diagnostics.codespell,
					},
				})
			end,
			requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		})

		use {'npxbr/glow.nvim', run = ':GlowInstall', branch = 'main'}

		-- Git
		use({ "tpope/vim-fugitive" })

		use({ "wfxr/minimap.vim" })

		-- File browser
		use({ "scrooloose/nerdtree", config = require("configs.nerdtree") })
		use("Xuyuanp/nerdtree-git-plugin")

		-- Improve text objects for arguments, brackets etc
		-- Add various text objects
		use("tpope/vim-sensible")
		use("wellle/targets.vim")
		-- add bunch of mappings like ]p ]e ]<space> etc.
		use("tpope/vim-unimpaired")
		-- allows repeat via dot for some configs.like surround
		use("tpope/vim-repeat")
		-- add\update\remove surround stuff like '"{}"'
		use("tpope/vim-surround")
		-- auto placing paired signs like {} [] '' "" etc
		use("cohama/lexima.vim")
		-- plugin for vim-tmux interactions
		use({ "christoomey/vim-tmux-navigator" })
		-- add commenting for different langs via gcc
		use("tpope/vim-commentary")
		-- plugin which allows vim to work with common editorconfig
		use("editorconfig/editorconfig-vim")
		use("kyazdani42/nvim-web-devicons")
		-- smooth screen scrolling
		use("psliwka/vim-smoothie")
	end,

	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
