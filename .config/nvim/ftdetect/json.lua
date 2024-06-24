vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.json",
    command = "set filetype=json"
})
