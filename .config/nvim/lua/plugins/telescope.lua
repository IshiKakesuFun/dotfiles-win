--------------------------------------------------------------------------------
-- https://github.com/nvim-telescope/telescope.nvim
--------------------------------------------------------------------------------
-- import plugin safely
local state, plugin = pcall(require, "telescope")
if not state then
  return
end
-- import builtin safely
local state, builtin = pcall(require, "telescope.builtin") if not state then return
end

-- import telescope config safely
local state, config = pcall(require, "telescope.config")
if not state then
  return
end

-- -- import telescope actions safely
-- local state, actions = pcall(require, "telescope.actions")
-- if not state then
--   return
-- end

-- import telescope actions.layout safely
local state, layout = pcall(require, "telescope.actions.layout")
if not state then
  return
end

-- import modul safely
local state, u = pcall(require, "core.utils")
if not state then
  return
end

local M = {}

M.git_or_find_files = function(options)
  local opts = options or {}
  local cd = opts.cwd and "cd " .. opts.cwd .. " && " or "";
  pcall(vim.fn.system, cd .. "git rev-parse --is-inside-work-tree")
  if vim.v.shell_error == 0 then
    builtin.git_files(opts)
  else
    builtin.find_files(opts)
  end
end

M.grep_current_word = function()
  local options = { 
    search = vim.fn.imput("Grep for >"),
  }
  builtin.grep_string(options)
end

M.grep_current_word = function()
  local options = { 
    prompt_title = "< grep current word >",
    search = vim.fn.expand("<cword>"),
  }
  builtin.grep_string(options)
end


M.dot_files = function()
  local options = { 
    prompt_title = "< VimRC >",
    cwd = CONFIG_PATH,
  }
  M.git_or_find_files(options)
end

M.search_repos = function()
  local options = {
    prompt_title = "< repos >",
    cwd = REPOS,
  }
  M.git_or_find_files(options)
end

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(config.values.vimgrep_arguments) }
-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
plugin.setup {
  defaults = {
    -- `hidden = true` is not supported in text grep commands.
    vimgrep_arguments = vimgrep_arguments,
    mappings = {
      n = {
        ["<M-p"] = layout.toggle_preview,
      },
      i = {
        ["<C-u"] = false, -- If you'd prefer Telescope to clear the prompt on 
                          -- <C-u> rather than scroll the previewer 
        ["<M-p"] = layout.toggle_preview,
      },
    },
  },

  pickers = {
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not 
      -- `.gitignore`d.
      prompt_prefix = " ",
      selection_caret = " ",
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
    },
    git_files = {
      prompt_prefix = " ",
      selection_caret = " ",
    },
    grep_string = {
      prompt_prefix = " ",
      selection_caret = " ",
    }
  },
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


u.set_keymap('n', { noremap = true, silent = true }, {
  { '<Leader>ti', '<cmd>Telescope builtin<CR>' }, -- all buildin functions

  { '<Leader>tb', '<cmd>Telescope buffers<CR>' },
  { '<Leader>tff', '<cmd>Telescope find_files<CR>' },
  { '<Leader>tg', '<cmd>Telescope live_grep<CR>' },
  { '<Leader>th', '<cmd>Telescope help_tags<CR>' },
  { '<Leader>tk', '<cmd>Telescope keymaps<CR>' },
  { '<Leader>tp', '<cmd>lua require("plugins.telescope").git_or_find_files()<CR>' },
  { '<Leader>tq', '<cmd>Telescope quickfix<CR>' },
  { '<Leader>tr', '<cmd>Telescope registers<CR>' },
  { '<Leader>ts', '<cmd>Telescope grep_string<CR>' },
  { '<Leader>tw', '<cmd>lua require("plugins.telescope").grep_current_word()<CR>' },

  { '<Leader>td', '<cmd>lua require("plugins.telescope").dot_files()<CR>' },
  { '<Leader>tfr', '<cmd>lua require("plugins.telescope").search_repos()<CR>' },
  { '<Leader>gt', '<cmd>Telescope git_stash<CR>' },
  { '<Leader>gs', '<cmd>Telescope git_status<CR>' },
  { '<Leader>gb', '<cmd>Telescope git_branches<CR>' },
  { '<Leader>gc', '<cmd>Telescope git_commits<CR>' },
  { '<Leader>gcb', '<cmd>Telescope git_bcommits<CR>' },
})

return M
