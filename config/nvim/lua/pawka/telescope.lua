local telescope = require('telescope')

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "^.git/",
    },
    mappings = {
      i = {
        ["<C-u>"] = false
      },
    },
    -- Live grep and other grep tools ignores hidden directories and files by
    -- default. Override arguments to grep hidden files too. Most flags here are
    -- mandatory (see :help telescope.defaults.vimgrep_arguments).
    -- There is no need to exclude directories such as .git here because
    -- excludes list is maintained via "file_ignore_patterns".
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      -- This is the flag to search hidden files.
      '--hidden',
    },
  },
  pickers = {
    -- Your special builtin config goes in here
    buffers = {
      sort_lastused = true,
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          -- Right hand side can also be the name of the action as a string
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        }
      }
    },
    find_files = {
      -- Include hidden files too. Directories which should be excluded (such
      -- as ".git") are defined in file_ignore_patterns.
      hidden = true
    },
  },
  extensions = {
    undo = {
      side_by_side = true,
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0.7,
      }
    }
  }
}

-- To get fzf loaded and working with telescope,
-- you need to call load_extension, somewhere after
-- the setup function.
telescope.load_extension('fzf')
telescope.load_extension('undo')
