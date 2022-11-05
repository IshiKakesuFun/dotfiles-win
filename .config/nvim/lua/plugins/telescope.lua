
--------------------------------------------------------------------------------
-- https://github.com/nvim-telescope/telescope.nvim
--------------------------------------------------------------------------------
-- import plugin safely
local setup, plugin = pcall(require, "telescope")
if not setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
plugin.setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
plugin.load_extension("fzf")
