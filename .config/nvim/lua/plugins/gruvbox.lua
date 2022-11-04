--------------------------------------------------------------------------------
-- https://github.com/ellisonleao/gruvbox.nvim
--------------------------------------------------------------------------------
-- import plugin safely
local setup, plugin = pcall(require, "gruvbox")
if not setup then
	return
end

-- setup must be called before loading the colorscheme
-- Default options:
plugin.setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = false, -- default: true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

-- set colorscheme to gruvbox with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
