--------------------------------------------------------------------------------
-- https://github.com/tpope/vim-fugitive
--------------------------------------------------------------------------------
local status, u = pcall(require, "core.utils")
if not status then
	return
end

u.set_keymap("n", { noremap = true, silent = true }, {
	{ "<leader>hn", "<cmd>Git restore --staged %<cr>" },
})
