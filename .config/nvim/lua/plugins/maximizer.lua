--------------------------------------------------------------------------------
-- https://github.com/szw/vim-maximizer
--------------------------------------------------------------------------------
-- Whether Maximizer should set default mappings or not
vim.g.maximizer_set_default_mapping = 1

-- Whether Maximizer should set default mappings with banged version or not
vim.g.maximizer_set_mapping_with_bang = 1

-- The default mappings key
vim.g.maximizer_default_mapping_key = "<F11>"

-- import modul safely
local ststus, u = pcall(require, "core.utils")
if not ststus then
	return
end
-- normal
u.set_keymap("n", { noremap = true, silent = true }, {
	{ "sm", ":MaximizerToggle!<CR>" },
})
