-- nvim-treesitter "main" branch setup (the old "master" configs.setup API is gone).
-- Highlighting is started via the FileType autocmd below; parsers are installed
-- on demand with the tree-sitter CLI, which is bootstrapped automatically.

-- The tree-sitter CLI is required by nvim-treesitter to build parsers. Instead
-- of depending on a package manager, download the prebuilt binary once per
-- machine into Neovim's data dir. Works the same on macOS and Linux.
local function ensure_tree_sitter_cli()
    local cli_dir = vim.fn.stdpath('data') .. '/tree-sitter-cli'
    vim.env.PATH = cli_dir .. ':' .. vim.env.PATH
    if vim.fn.executable('tree-sitter') == 1 then
        return
    end

    local uname = vim.uv.os_uname()
    local os_name = uname.sysname == 'Darwin' and 'macos' or 'linux'
    local machine = uname.machine
    local arch = (machine == 'arm64' or machine == 'aarch64') and 'arm64' or 'x64'
    local url = string.format(
        'https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-%s-%s.gz',
        os_name, arch)

    vim.notify('Downloading tree-sitter CLI...', vim.log.levels.INFO)
    vim.fn.mkdir(cli_dir, 'p')
    local gz = cli_dir .. '/tree-sitter.gz'
    local curl = vim.system({ 'curl', '-fsSL', '-o', gz, url }):wait()
    if curl.code ~= 0 then
        vim.notify('tree-sitter CLI download failed: ' .. (curl.stderr or ''), vim.log.levels.ERROR)
        return
    end
    vim.system({ 'gunzip', '-f', gz }):wait()
    vim.uv.fs_chmod(cli_dir .. '/tree-sitter', 493) -- 0755
end

ensure_tree_sitter_cli()

local ts = require('nvim-treesitter')

-- Installed at startup; install() is async and a no-op for present parsers.
ts.install {
    'bash',
    'c',
    'cmake',
    'dockerfile',
    'go',
    'gomod',
    'html',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'query',
    'rust',
    'starlark',
    'vim',
    'zig',
}

-- vimwiki is configured with markdown syntax ('syntax': 'markdown'), so
-- highlight its buffers with the markdown parser.
vim.treesitter.language.register('markdown', 'vimwiki')

-- Enable highlighting for every filetype with a parser. Missing parsers are
-- installed automatically (the old auto_install = true).
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('pawka.treesitter', { clear = true }),
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then
            return
        end
        if vim.treesitter.language.add(lang) then
            vim.treesitter.start(args.buf, lang)
        elseif vim.tbl_contains(ts.get_available(), lang) then
            ts.install(lang):await(vim.schedule_wrap(function()
                if vim.api.nvim_buf_is_valid(args.buf)
                    and vim.bo[args.buf].filetype == args.match
                    and vim.treesitter.language.add(lang) then
                    vim.treesitter.start(args.buf, lang)
                end
            end))
        end
    end,
})

-- Syntax-aware text objects (nvim-treesitter-textobjects, "main" branch).
require('nvim-treesitter-textobjects').setup {
    select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        -- You can choose the select mode (default is charwise 'v')
        selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
        },
        -- Extend textobjects to include preceding or succeeding whitespace,
        -- to act similarly to e.g. the built-in `ap`.
        include_surrounding_whitespace = true,
    },
}

local textobject_keymaps = {
    ['aa'] = '@parameter.outer',
    ['ia'] = '@parameter.inner',
    ['af'] = '@function.outer',
    ['if'] = '@function.inner',
    ['ac'] = '@class.outer',
    ['ic'] = '@class.inner',
}
for lhs, query in pairs(textobject_keymaps) do
    vim.keymap.set({ 'x', 'o' }, lhs, function()
        require('nvim-treesitter-textobjects.select').select_textobject(query, 'textobjects')
    end)
end
