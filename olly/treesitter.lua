require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "lua", "vim", "c", "html", "cpp", "css", "json", "yaml", "toml", "markdown", "bash", "go", "python"
    },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
        },
    },
}
