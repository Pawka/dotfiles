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
    }
  }
}

-- To get fzf loaded and working with telescope,
-- you need to call load_extension, somewhere after
-- the setup function.
telescope.load_extension('fzf')
