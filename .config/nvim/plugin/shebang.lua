vim.api.nvim_create_autocmd("Syntax", {
    pattern = "*",
    command = "syn match global_shebang /#!.*/"
})

vim.cmd.highlight({"def", "link", "global_shebang", "Comment"})
