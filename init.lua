vim.o.number = true
vim.o.relativenumber = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.cursorline = true
vim.o.termguicolors = true

vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '/?.lua'

require('olly.options')
require('olly.keymaps')

require('olly.plugins')

require('olly.treesitter')
require('olly.completion')

require('olly.theme')

require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

local function is_modified_buffer_open(buffers)
    for _, v in pairs(buffers) do
        if v.name:match("NvimTree_") == nil then
            return true
        end
    end
    return false
end

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if
            #vim.api.nvim_list_wins() == 1
            and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
            and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
        then
            vim.cmd("quit")
        end
    end,
})

vim.cmd("NvimTreeOpen")
