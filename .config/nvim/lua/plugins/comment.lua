--------------------------------------------------------------------------------
-- https://github.com/numToStr/Comment.nvim
--------------------------------------------------------------------------------
-- import plugin safely
local status, plugin = pcall(require, "Comment")
if not status then
	return
end
-- call plugin setup
plugin.setup()
