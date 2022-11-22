local status, nvim_tree, u
--------------------------------------------------------------------------------
-- https://github.com/nvim-tree/nvim-tree.lua
--------------------------------------------------------------------------------
-- import plugin safely
status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	return
end

-- disable netrw at the very start of your init.lua (using nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
  auto_reload_on_write = true,                -- default: true
  create_in_closed_folder = false,            -- default: false
  disable_netrw = false,                      -- default: false
  hijack_cursor = false,                      -- default: false
  hijack_netrw = true,                        -- default: true
  hijack_unnamed_buffer_when_opening = false, -- default: false
  ignore_buffer_on_setup = false,             -- default: false
  open_on_setup = false,                      -- default: false
  open_on_setup_file = false,                 -- default: false
  open_on_tab = false,                        -- default: false
  ignore_buf_on_tab_change = {},              -- default: {}
  sort_by = "name",                           -- default: "name"
  root_dirs = {},                             -- default: {}
  prefer_startup_root = false,                -- default: false
  sync_root_with_cwd = false,                 -- default: false
  reload_on_bufenter = false,                 -- default: false
  respect_buf_cwd = false,                    -- default: false
  on_attach = "disable",                      -- defualt: "disable"
  remove_keymaps = false,                     -- default: false
  select_prompts = false,                     -- default: false
  view = {
    adaptive_size = false,                    -- default: false
    centralize_selection = false,             -- default: false
    width = 30,                               -- default: 30
    hide_root_folder = false,                 -- default: false
    side = "left",                            -- default: "left"
    preserve_window_proportions = false,      -- default: false
    number = true,                            -- default: false
    relativenumber = true,                    -- default: false
    signcolumn = "yes",                       -- default: "yes"
    mappings = {
      custom_only = false,                    -- default: false
      list = {
        -- default: {}, -- user mappings go here
      },
    },
    float = {
      enable = false,                         -- default: false
      quit_on_focus_loss = true,              -- default: true
      open_win_config = {
        relative = "editor",                  -- default: "editor"
        border = "rounded",                   -- default: "rounded"
        width = 30,                           -- default: 30
        height = 30,                          -- default: 30
        row = 1,                              -- default: 1
        col = 1,                              -- default: 1
      },
    },
  },
  renderer = {
    add_trailing = false,                     -- default: false
    group_empty = false,                      -- default: false
    highlight_git = false,                    -- default: false
    full_name = false,                        -- default: false
    highlight_opened_files = "none",          -- default: "none"
    root_folder_modifier = ":~",              -- default: ":~"
    indent_width = 2,                         -- default: 2
    indent_markers = {
      enable = true,                          -- default: false
      inline_arrows = true,                   -- default: true
      icons = {
        corner = "└",                         -- default: "└"
        edge = "┊",                           -- default: "│"
        item = "┊",                           -- default: "│"
        bottom = "┈",                         -- default: "─"
        none = " ",                           -- default: " "
      },
    },
    icons = {
      webdev_colors = true,                   -- default: true
      git_placement = "before",               -- default: "before"
      padding = " ",                          -- default: " "
      symlink_arrow = " ➛ ",                  -- default: " ➛ "
      show = {
        file = true,                          -- default: true
        folder = true,                        -- default: true
        folder_arrow = false,                 -- default: true
        git = true,                           -- default: true
      },
      glyphs = {
        default = "",                        -- default: ""
        symlink = "",                        -- default: ""
        bookmark = "",                       -- default: ""
        folder = {
          arrow_closed = "",                 -- default: ""
          arrow_open = "",                   -- default: ""
          default = "",                      -- default: ""
          open = "",                         -- default: ""
          empty = "",                        -- default: ""
          empty_open = "",                   -- default: ""
          symlink = "",                      -- default: ""
          symlink_open = "",                 -- default: ""
        },
        git = {
          unstaged = "✗",                     -- default: "✗"
          staged = "✓",                       -- default: "✓"
          unmerged = "",                     -- default: ""
          renamed = "➜",                      -- default: "➜"
          untracked = "★",                    -- default: "★"
          deleted = "",                      -- default: ""
          ignored = "◌",                      -- default: "◌"
        },
      },
    },
    special_files = {                         -- default: { "Cargo.toml", "Makefile", "README.md", "readme.md" }
      "Cargo.toml",
      "Makefile",
      "README.md",
      "readme.md",
    },
    symlink_destination = true,               -- default: true
  },
  hijack_directories = {
    enable = true,                            -- default: true
    auto_open = true,                         -- default: true
  },
  update_focused_file = {
    enable = false,                           -- default: false
    update_root = false,                      -- default: false
    ignore_list = {},                         -- default: {}
  },
  ignore_ft_on_setup = {},                    -- default: {}
  system_open = {
    cmd = "",                                 -- default: ""
    args = {},                                -- default: {}
  },
  diagnostics = {
    enable = false,                           -- default: false
    show_on_dirs = false,                     -- default: false
    debounce_delay = 50,                      -- default: 50
    icons = {
      hint = "",                             -- default: ""
      info = "",                             -- default: ""
      warning = "",                          -- default: ""
      error = "",                            -- default: ""
    },
  },
  filters = {
    dotfiles = false,                         -- default: false
    custom = {},                              -- default: {}
    exclude = {},                             -- default: {}
  },
  filesystem_watchers = {
    enable = true,                            -- default: true
    debounce_delay = 50,                      -- default: 50
  },
  git = {
    enable = true,                            -- default: true
    ignore = true,                            -- default: true
    show_on_dirs = true,                      -- default: true
    timeout = 400,                            -- default: 400
  },
  actions = {
    use_system_clipboard = true,              -- default: true
    change_dir = {
      enable = true,                          -- default: true
      global = false,                         -- default: false
      restrict_above_cwd = false,             -- default: false
    },
    expand_all = {
      max_folder_discovery = 300,             -- default: 300
      exclude = {},                           -- defualt: {}
    },
    file_popup = {
      open_win_config = {
        col = 1,                              -- default: 1
        row = 1,                              -- default: 1
        relative = "cursor",                  -- default: "cursor"
        border = "shadow",                    -- default: "shadow"
        style = "minimal",                    -- default: "minimal"
      },
    },
    open_file = {
      quit_on_open = false,                   -- defualt: false
      resize_window = true,                   -- defualt: true
      window_picker = {
        enable = true,                        --default: true
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890", -- default: "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" }, -- default: { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" }
          buftype = { "nofile", "terminal", "help" },                                   -- default: { "nofile", "terminal", "help" }
        },
      },
    },
    remove_file = {
      close_window = true,                    -- default: true
    },
  },
  trash = {
    cmd = "gio trash",                        -- default: "gio trash"
    require_confirm = true,                   -- default: true
  },
  live_filter = {
    prefix = "[FILTER]: ",                    -- default: "[FILTER]: "
    always_show_folders = true,               -- default: true
  },
  log = {
    enable = false,                           -- default: false
    truncate = false,                         -- default: false
    types = {
      all = false,                            -- default: false
      config = false,                         -- default: false
      copy_paste = false,                     -- default: false
      dev = false,                            -- default: false
      diagnostics = false,                    -- default: false
      git = false,                            -- default: false
      profile = false,                        -- default: false
      watcher = false,                        -- default: false
    },
  },
  notify = {
    threshold = vim.log.levels.INFO,          -- default: vim.log.level.INFO
  },
})

-- import modul safely
status, u = pcall(require, "core.utils")
if not status then
	return
end

u.set_keymap('n', { noremap = true, silent = true }, {
  { '<Leader>e', ':NvimTreeToggle<CR>' }
})
