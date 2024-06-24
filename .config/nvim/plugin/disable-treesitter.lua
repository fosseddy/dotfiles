if vim.g.plugin_disable_treesitter == 1 then
    return
end
vim.g.plugin_disable_treesitter = 1

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "lua vim.treesitter.stop()"
})
