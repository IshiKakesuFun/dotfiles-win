--------------------------------------------------------------------------------
-- https://github.com/numToStr/Comment.nvim
--------------------------------------------------------------------------------
-- import plugin safely
local setup, plugin = pcall(require, "Comment")
if not setup then
	return
end
-- call plugin setup
plugin.setup()

