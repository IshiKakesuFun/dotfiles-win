-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = DATA_PATH .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- collection of lua functions that many plugins use
	use({
		"nvim-lua/popup.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- color scheme
	use("ellisonleao/gruvbox.nvim")
	use("EdenEast/nightfox.nvim")
	use("arcticicestudio/nord-vim")

	-- essential plugins

	-- add, delete, change surroundings (it's awesome)
	use("tpope/vim-surround")
	-- commenting with gc, gb
	use("numToStr/Comment.nvim")
	-- quick scope navigation
	use("unblevable/quick-scope")
	-- window maximizer
	use("szw/vim-maximizer")
	-- symlinks resolver makes vim-fugitive behave properly with linked files
	use({
		"aymericbeaumet/vim-symlink",
		requires = { "moll/vim-bbye" },
	})

	-- git
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- vs-code like icons
	use("kyazdani42/nvim-web-devicons")

	-- File/project explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- Telescope
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("nvim-telescope/telescope-file-browser.nvim")

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing and installing LSP servers, linters and formaters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuration of LSP servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	})

	-- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- Tools
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("norcalli/nvim-colorizer.lua")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
