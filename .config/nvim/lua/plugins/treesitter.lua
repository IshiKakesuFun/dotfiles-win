--------------------------------------------------------------------------------
-- https://github.com/nvim-treesitter/nvim-treesitter
--------------------------------------------------------------------------------
-- import plugin safely
local setup, plugin = pcall(require, "nvim-treesitter.configs")
if not setup then
	return
end

plugin.setup({
  -- A list of parser names, or "all"
  ensure_installed = { 
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "css",
    "dockerfile",
    "gitignore",
    "go",
    "graphql",
    "html",
    "java",
    "javascript",
    "json",
    "lua",
    "markdown",
    "prisma",
    "regex",
    "rust",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- enable indentation
  indent = { 
    enable = true 
  },

  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { 
    enable = true 
  },
})
