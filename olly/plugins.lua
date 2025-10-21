local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("Installing lazy.nvim...")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
    print("Lazy.nvim installed")
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
    "nvim-lua/plenary.nvim",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        priority = 100,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "folke/which-key.nvim",
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
})
