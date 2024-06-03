vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "lua vim.treesitter.stop()"
})
