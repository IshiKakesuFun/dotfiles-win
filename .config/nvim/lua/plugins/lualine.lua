--------------------------------------------------------------------------------
-- https://github.com/nvim-lualine/lualine.nvim
--------------------------------------------------------------------------------
-- import plugin safely
local setup, plugin = pcall(require, "lualine")
if not setup then
	return
end

-- get lualine gruvbox theme
local lualine_gruvbox = require("lualine.themes.gruvbox")

local mode = { 'mode', upper = true }
local branch = { 'branch', icon = '' }
local fileformat = {
  'fileformat',
  symbols = {
    unix = '', -- e712
    dos = '',  -- e70f
    mac = '',  -- e711
  },
}


-- call plugin setup
plugin.setup({
  options = {
    icons_enabled = true,
    theme = lualine_gruvbox,
    -- component_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  },
  -- extensions = { 'fugitive', 'nvim-tree' },
  -- extensions = { 'fugitive', 'fzf', 'nvim-tree' },
  tabline = {
    lualine_a = {  },
    lualine_b = { branch },
    lualine_c = { 'filename', 'diff' },
    lualine_x = {  },
    lualine_y = {  },
    lualine_z = {  },
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch, 'diagnostics' },
    lualine_c = { { 'filename', file_status = true }, 'diff' },
    lualine_x = { 'encoding', fileformat, 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {  },
    lualine_b = {  },
    lualine_c = { 'filename', 'diff' },
    lualine_x = { 'location' },
    lualine_y = {  },
    lualine_z = {  },
  },
})

