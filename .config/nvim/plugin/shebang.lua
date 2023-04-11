vim.api.nvim_create_autocmd("Syntax", {
    pattern = "*",
    command = "syn match _Shebang /#!.*/"
})

vim.cmd("hi def link _Shebang Comment")
