require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use({"nvim-telescope/telescope.nvim", branch = "0.1.x", requires = {{"nvim-lua/plenary.nvim"}}})
    use({"L3MON4D3/LuaSnip", tag = "v2.*"})
end)

vim.cmd.colorscheme("art")

vim.g.mapleader = " "
vim.env.BASH_ENV = "~/.bash_aliases"

vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabpagemax = 5
vim.opt.errorbells = false
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 20
vim.opt.list = true
vim.opt.listchars = {trail = "·", tab = "  "}
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Telescope
local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
local telescope_previewers = require("telescope.previewers")
telescope.setup({
    defaults = {
        buffer_previewer_maker = function(a, b, c)
            c.use_ft_detect = false
            telescope_previewers.buffer_previewer_maker(a, b, c)
        end
    },
    pickers = {
        find_files = {theme = "dropdown"},
        live_grep = {theme = "dropdown"},
        grep_string = {theme = "dropdown"},
        buffers = {theme = "dropdown"},
        current_buffer_fuzzy_find = {theme = "dropdown"}
    }
})
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files)
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers)
vim.keymap.set("n", "<leader>fc", telescope_builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep)
vim.keymap.set("n", "<leader>fs", telescope_builtin.grep_string)

-- LuaSnip
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load({paths = {"./snippets"}})
luasnip.config.set_config({history = false, updateevents = "TextChangedI"})
vim.keymap.set("n", "<leader>ss", luasnip.unlink_current)
vim.keymap.set("i", "<Tab>", function()
    return luasnip.expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<Tab>"
end, {remap = true, expr = true})
