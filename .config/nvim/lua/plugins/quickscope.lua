--------------------------------------------------------------------------------
-- https://github.com/unblevable/quick-scope
--------------------------------------------------------------------------------
-- Start plugin as enabled
vim.g.qs_enable = 1

-- Trigger a highlight in the appropriate direction when pressing these keys:
vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }

-- Turn off this plugin when the length of line is longer than
vim.g.qs_max_chars = 150

vim.g.qs_delay = 0

vim.g.qs_buftype_blacklist = { "terminal", "nofile" }
vim.g.qs_filetype_blacklist = { "dashboard", "startify" }
vim.g.qs_lazy_highlight = 0

vim.g.qs_accepted_chars = {
	"a",
	"á",
	"b",
	"c",
	"č",
	"d",
	"ď",
	"e",
	"é",
	"ě",
	"f",
	"g",
	"h",
	"i",
	"í",
	"j",
	"k",
	"l",
	"m",
	"n",
	"ň",
	"o",
	"ó",
	"p",
	"q",
	"r",
	"ř",
	"s",
	"š",
	"t",
	"ť",
	"u",
	"ú",
	"ů",
	"v",
	"w",
	"x",
	"y",
	"ý",
	"z",
	"ž",
	"A",
	"Á",
	"B",
	"C",
	"Č",
	"D",
	"Ď",
	"E",
	"É",
	"Ě",
	"F",
	"G",
	"H",
	"I",
	"Í",
	"J",
	"K",
	"L",
	"M",
	"N",
	"Ň",
	"O",
	"Ó",
	"P",
	"Q",
	"R",
	"Ř",
	"S",
	"Š",
	"T",
	"Ť",
	"U",
	"Ú",
	"Ů",
	"V",
	"W",
	"X",
	"Y",
	"Ý",
	"Z",
	"Ž",
	"0",
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
}

vim.cmd([[augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#0fffff' gui=underline ctermfg=81 cterm=underline
augroup end
]])
