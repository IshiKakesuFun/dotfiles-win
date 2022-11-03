vim.g.loaded_matchparen = 1
vim.g.cursorhold_updatetime = 100
vim.g.loaded_python3_provider = 0

local o = vim.opt

o.exrc = true
o.autochdir = true
o.updatetime = 50  -- [set updatetime=50] Faster completion
o.timeoutlen = 800 -- By default timeoutlen is 1000 ms

vim.cmd('set exrc')
o.hidden = false -- [set hidden] Required to keep multiple buffers open multiple buffers
o.errorbells = false
o.visualbell = false

-- line numbers
o.relativenumber = true
o.number = true

-- encoding
o.fileencoding = "utf-8"
o.bomb = true

-- undo/swap
o.backup = false   -- [set nobackup] This is recommended by coc, undotree
o.swapfile = false -- [set noswapfile] This is recommended by undotree

-- formating
  -- Helpful related items:
  --   1. :center, :left, :right
  --   2. gw{motion} - Put cursor back after formatting motion.
  --
  -- TODO: w, {v, b, l}
-- o.formatoptions = o.formatoptions
--   - "a" -- Auto formatting is BAD.
--   - "t" -- Don't auto format my code. I got linters for that.
--   + "c" -- In general, I like it when comments respect textwidth
--   + "q" -- Allow formatting comments w/ gq
--   - "o" -- O and o, don't continue comments
--   + "r" -- But do continue when pressing enter.
--   + "n" -- Indent past the formatlistpat, not underneath it.
--   + "j" -- Auto-remove comments if possible.
--   - "2" -- I'm not in gradeschool anymore

-- tabs & indentation
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true

-- line wrapping
o.wrap = false
o.breakindent = true
o.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
o.linebreak = true

-- folding
o.foldmethod = "marker"
o.foldlevel = 0
o.foldenable = true
o.modelines = 1

-- search settings
o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true
o.inccommand = "split"
o.iskeyword:append("-") -- "-" is now part of the word, not a divider
o.shortmess:append("c") -- [+c] Don't pass messages to |ins-completion-menu|.

-- Cursorline highlighting control
--  Only have it on in the active buffer
o.cursorline = true -- Highlight the current line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
      vim.opt_local.colorcolumn = value and "80,120" or ""
    end,
  })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

-- appearance
o.termguicolors = true
o.background = "dark"
o.cursorcolumn = false
o.colorcolumn = "80,120"
o.signcolumn = "yes"
o.list = true
o.listchars = 'tab: ,trail:·,nbsp:‿' -- →»
o.pumheight = 10 -- Makes popup menu smaller
o.cmdheight = 2 -- [set cmdheight=3] More space for displaying messages
o.scrolloff = 8 -- Make it so there are always ten lines below my cursor
o.sidescrolloff = 5
o.guifont = 'JetBrainsMonoNL NFM:h10'

-- backspace
o.backspace = "indent,eol,start"

-- clipboard
o.clipboard:append("unnamedplus")

-- split windows
o.splitright = true
o.splitbelow = true

