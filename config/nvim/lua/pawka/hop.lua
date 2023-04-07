local hop = require('hop')

-- Jump to beginning of any word.
vim.keymap.set('n', '<leader><leader>w', ':HopWord<Cr>', {remap=true})
-- Jump back from current cursor
vim.keymap.set('n', '<leader><leader>b', ':HopWordBC<Cr>', {remap=true})
-- Jump to after-end-of-word.
vim.keymap.set('n', '<Leader><Leader>e', function()
    hop.hint_patterns({}, '\\>')
end, {remap=true})

hop.setup({})
