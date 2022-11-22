--------------------------------------------------------------------------------
-- https://github.com/nvim-lualine/lualine.nvim
--------------------------------------------------------------------------------
-- import plugin safely
local status, plugin = pcall(require, "lualine")
if not status then
	return
end

-- get lualine theme
if not DEFAULT_COLOR_THEME then
	DEFAULT_COLOR_THEME = "nightfox"
	vim.cmd("colorscheme " .. DEFAULT_COLOR_THEME)
end
local lualine_theme = require("lualine.themes." .. vim.g.colors_name)

local mode = { "mode", upper = true }
local branch = {
	"branch",
	icon = "", -- 0xea68
}
local filename = { "filename", file_status = true, path = 0 }
local filetype = { "filetype", icon_only = false }
local fileformat = {
	"fileformat",
	symbols = {
		unix = "", -- 0xe712
		dos = "", -- 0xe70f
		mac = "", -- 0xe711
	},
}
local diagnostics = {
	"diagnostics",
	-- Table of diagnostic sources, available sources are:
	--   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
	-- or a function that returns a table as such:
	--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
	sources = {
		-- "nvim_lsp",
		"nvim_diagnostic",
	},
	-- Displays diagnostics for the defined severity types
	sections = { "error", "warn", "info", "hint" },
	--[[
  diagnostics_color = {
    -- Same values as the general color option can be used here.
    error = 'DiagnosticError', -- Changes diagnostics' error color.
    warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
    info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
    hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
  },]]
	symbols = {
		error = "", -- 0xf188
		warn = "", -- 0xf421
		info = "", -- 0xf41b
		hint = "", -- 0xf400
	},
	colored = true, -- Displays diagnostics status in color if set to true.
	update_in_insert = false, -- Update diagnostics in insert mode.
	always_visible = false, -- Show diagnostics even if there are none.
}

-- call plugin setup
plugin.setup({
	options = {
		globalstatus = false,
		icons_enabled = true,
		theme = lualine_theme,
		-- component_separators = {
		--   left = '', -- 0xe0b1
		--   right = '' -- 0xe0b3
		-- },
		-- section_separators = {
		--   left = '', -- 0xe0b0
		--   right = '' -- 0xe0b2
		-- },
		section_separators = {
			left = "", -- 0xe0bc
			right = "", -- 0xe0ba
		},
		component_separators = {
			left = "", -- 0xe0bd
			right = "", -- 0xe0bb
		},
	},
	extensions = { "fugitive", "fzf", "nvim-tree" },
	tabline = {
		lualine_a = {},
		lualine_b = { filename },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = { filename, "diff" },
		lualine_x = { diagnostics },
		lualine_y = { "encoding", fileformat, filetype },
		lualine_z = { "progress", "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", file_status = true, path = 1 } },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
