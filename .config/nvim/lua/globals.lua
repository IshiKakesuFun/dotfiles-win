--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
CONFIG_PATH = vim.fn.stdpath('config')
CONFIG_LUA = CONFIG_PATH .. '\\lua'
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
VIMRUNTIME = vim.fn.expand('$VIMRUNTIME')
VIMRUNTIME_LUA = VIMRUNTIME .. '\\lua'
USER = vim.fn.expand('$USERPROFILE')
APPDATA = vim.fn.expand('$APPDATA')
LOCALAPPDATA = vim.fn.expand('$LOCALAPPDATA')
DOCUMENTS = USER .. '\\Documents'
REPOS = USER .. '\\repos'
