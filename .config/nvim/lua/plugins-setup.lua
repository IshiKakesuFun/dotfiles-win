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

  -- essential plugins

  -- add, delete, change surroundings (it's awesome)
  use("tpope/vim-surround") 
  -- commenting with gc, gb
  use("numToStr/Comment.nvim")
  -- quick scope navigation
  use("unblevable/quick-scope")
  -- window maximizer
  use("szw/vim-maximizer")

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
  use ({
    "nvim-telescope/telescope-fzf-native.nvim", 
    run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
  })
  use ({
    "nvim-telescope/telescope.nvim", 
    branch = '0.1.x',
    requires = { 
      "nvim-lua/plenary.nvim" 
    },
  })
  use({
    "iamcco/markdown-preview.nvim",
    run = function() 
      vim.fn["mkdp#util#install"]() 
    end,
})

  if packer_bootstrap then
    require("packer").sync()
  end
end)
