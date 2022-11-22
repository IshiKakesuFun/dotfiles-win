require("globals")
require("plugins-setup")

require("core.utils") -- utils before any other settings
require("core.options")
require("core.keymaps")

-- plugins with setup
require("colorscheme.gruvbox")
require("colorscheme.nightfox")
require("colorscheme.nord")

require("plugins.quickscope")
require("plugins.comment")
require("plugins.maximizer")
require("plugins.symlink")
require("plugins.fugitive")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.nvim-cmp")
require("plugins.colorizer")
require("plugins.autopairs")
require("plugins.ts-autotag")
require("plugins.markdown-preview")
-- lsp
require("plugins.lsp.mason")
require("plugins.lsp.lspsaga")
require("plugins.lsp.lspconfig")
require("plugins.lsp.null-ls")
