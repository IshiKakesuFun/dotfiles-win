--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
IS_UNIX = vim.fn.has("macunix")
IS_WIN = vim.fn.has("win32")
PATH_SEPARATOR = IS_WIN and "\\" or "/"

CONFIG_PATH = vim.fn.stdpath("config")
CONFIG_LUA = CONFIG_PATH .. PATH_SEPARATOR .. "lua"
DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")
VIMRUNTIME = vim.fn.expand("$VIMRUNTIME")
VIMRUNTIME_LUA = VIMRUNTIME .. PATH_SEPARATOR .. "lua"
USER = vim.fn.expand("$USERPROFILE")
APPDATA = vim.fn.expand("$APPDATA")
LOCALAPPDATA = vim.fn.expand("$LOCALAPPDATA")
DOCUMENTS = USER .. PATH_SEPARATOR .. "Documents"
REPOS = USER .. PATH_SEPARATOR .. "repos"

ICON = {
  listchars = {
    eol = "﬋", -- 0xfb0b;
    tab = "", -- 0xea9b,0xeaba,0xea9c; must be 2|3 chars
    trail = "▫", -- 0x25ab
    nbsp = "‿", -- 0x203f
  },
	ellipsis = "…", -- 0x2026
	skull = "💀", -- 0x1f480
}
