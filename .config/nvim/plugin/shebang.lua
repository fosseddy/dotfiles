if vim.g.plugin_shebang == 1 then
    return
end
vim.g.plugin_shebang = 1

vim.api.nvim_create_autocmd("Syntax", {
    pattern = "*",
    callback = function()
        vim.cmd.syntax({"match", "global_shebang", "/#!.*/"})
        vim.cmd.highlight({"def", "link", "global_shebang", "Comment"})
    end
})
