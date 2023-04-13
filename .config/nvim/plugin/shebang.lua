vim.api.nvim_create_autocmd("Syntax", {
    pattern = "*",
    command = "syn match _Shebang /#!.*/"
})

vim.cmd.highlight({"def", "link", "_Shebang", "Comment"})
