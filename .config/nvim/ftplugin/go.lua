vim.opt_local.expandtab = false
vim.opt_local.colorcolumn = "120"

local id = vim.api.nvim_create_augroup("GoAutoFormatting", {})

vim.api.nvim_create_autocmd("BufWritePost", {
    group = id,
    buffer = bufnr,
    command = "!goimports -w %"
})
