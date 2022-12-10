local telescope = require('telescope')

telescope.setup {
    extensions = {
        recent_files = {
            -- This extension's options, see below.
        }
    }
}

vim.api.nvim_set_keymap("n", "<C-n>",
  [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
  {noremap = true, silent = true})

-- To get fzf loaded and working with telescope,
-- you need to call load_extension, somewhere after
-- the setup function.
telescope.load_extension('fzf')

-- Extention to display recent files.
telescope.load_extension("recent_files")
