local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "dockerfile",
        "go",
        "gomod",
        "json",
        "lua",
        "markdown",
        "rust",
        "vim",
        "zig",
    },
    auto_install = true,
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
}
