local packer = require("packer")
packer.startup(function(use)
    use("wbthomason/packer.nvim")
    use("preservim/nerdtree")
    use({
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = {{ "nvim-lua/plenary.nvim" }}
    })
    use({ "L3MON4D3/LuaSnip", tag = "v1.*" })
end)

vim.cmd.colorscheme("art")

vim.g.mapleader = " "

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
vim.opt.listchars = { trail = "·", tab = "  " }
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Telescope
local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
local telescope_previewers = require("telescope.previewers")
telescope.setup({
    defaults = {
        file_ignore_patterns = { "node_modules" },
        buffer_previewer_maker = function(a, b, c)
            c.use_ft_detect = false
            telescope_previewers.buffer_previewer_maker(a, b, c)
        end
    },
    pickers = {
        find_files = { theme = "dropdown" },
        live_grep = { theme = "dropdown" },
        grep_string = { theme = "dropdown" },
        buffers = { theme = "dropdown" }
    }
})
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files)
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers)
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep)
vim.keymap.set("n", "<leader>fs", telescope_builtin.grep_string)

-- LuaSnip
local luasnip = require("luasnip")
local luasnip_loader = require("luasnip.loaders.from_vscode")
luasnip.config.set_config({ history = false, updateevents = "TextChangedI" })
luasnip_loader.lazy_load({ paths = { "./snippets" }})
vim.keymap.set("i", "<Tab>", function()
    return luasnip.expand_or_jumpable() and "<Plug>luasnip-expand-or-jump"
                                        or "<Tab>"
end, { remap = true, expr = true })
vim.keymap.set("n", "<leader>ss", luasnip.unlink_current)
