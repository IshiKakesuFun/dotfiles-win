require("globals")
require("plugins-setup")

require("core.utils") -- utils before any other settings
require("core.options")
require("core.keymaps")
-- require("core.colorscheme")

-- plugins with setup
require("plugins.gruvbox")
require("plugins.quickscope")
require("plugins.comment")
require("plugins.maximizer")
require("plugins.lualine")
