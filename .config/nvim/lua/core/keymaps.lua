-- set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- import modul safely
local state, u = pcall(require, "core.utils")
if not state then
	return
end
---------------------
-- General Keymaps
---------------------

-- normal
u.set_keymap('n', { noremap = true, silent = true }, {
  -- remap leader keys to noop
  { ' ', '' },
  { '\\', '' },

  -- window management
  { "sv", "<cmd>vsplit<CR><C-w>l" }, -- split window vertically, move to new
  { "ss", "<cmd>split<CR><C-w>j" }, -- split window horizontally, move to new
  { "se", "<C-w>=" }, -- make split windows equal width & height
  { "sc", ":close<CR>" }, -- close current split window
  { "sx", "<C-w>x" }, -- exchange splited windows

  -- Smart way to move between windows
  { 'sh', '<C-w>h' },
  { 'sj', '<C-w>j' },
  { 'sk', '<C-w>k' },
  { 'sl', '<C-w>l' },
  { 's<Left>', '<C-w>h' },
  { 's<Down>', '<C-w>j' },
  { 's<Up>', '<C-w>k' },
  { 's<Right>', '<C-w>l' },

  -- tabs manegement
  { 'te', ':tabedit<CR>' },

  -- Smart way to move between tabs
  -- { '<A-h>', 'gT' },
  -- { '<A-l>', 'gt' },

    -- Resize split
  { '<C-Up>', ':resize +2<CR>' },
  { '<C-Down>', ':resize -2<CR>' },
  { '<C-Left>', ':vertical resize +2<CR>' },
  { '<C-Right>', ':vertical resize -2<CR>' },

  -- Navigate buffers
  -- { '<Tab>', ':bnext<CR>' },
  -- { '<S-Tab>', ':bprevious<CR>' },

  -- Move across wrapped lines like regular lines
  { '0', '^' },
  { '^', '0' },

  -- select all
  { '<C-a>', 'ggVG' },

  -- delete single character without copying into register
  { "x", '"_x' },

  -- pwd
  { '<leader>cd', ':cd %:p:h<CR>:pwd<CR>' },
  { '<leader>lcd', ':lcd %:p:h<CR>:pwd<CR>' },
  { '<leader>tcd', ':tcd %:p:h<CR>:pwd<CR>' },
  
  -- increment/decrement
  { '+', '<C-a>' },
  { '-', '<C-x>' },

  -- conversion unicode
  -- { '<leader>2uc', ':lua require("utils.unicode").replace_hex_to_char()<CR>' },
  -- { '<leader>2ux', ':lua require("utils.unicode").replace_char_to_hex()<CR>' },

  { '<Leader>e', ':NvimTreeToggle<CR>' }
})

-- normal non-silent
u.set_keymap('n', { noremap = true, silent = false }, {
  -- source lua files
  { '<leader>.<CR>', ':luafile ' .. CONFIG_PATH .. '\\init.lua<CR>' },
  {  '<leader><CR>', ':luafile %<CR>' },
  -- greatest remap ever
  { '<leader>y', '"+y' },
  { '<leader>Y', 'ggVG"+y' },
  { '<leader>d', '"_d' },
  { '<leader>D', '"_D' },
})

-- visual
u.set_keymap('x', { noremap = true, silent = true }, {
  -- move selected line(s)
  { 'K', ':move \'<-2<CR>gv-gv' },
  { 'J', ':move \'>+1<CR>gv-gv' },
})

--visual non-silent
u.set_keymap('v', { noremap = true, silent = false }, {
  -- greatest remap ever
  { '<leader>p', '"_dP' },
  { '<leader>y', '"+y' },
  { '<leader>d', '"_d' },
})

-- insert
u.set_keymap('i', { noremap = true, silent = true }, {
  -- Smart way to move between tabs
  -- { '<A-h>', [[<C-\><C-n>gT]] },
  -- { '<A-l>', [[<C-\><C-n>gt]] },

  -- insert special carachters
  -- { '<C-b>', '<C-k>' },
  
  -- use jk to exit insert mode
  { "jk", "<ESC>" },
})
