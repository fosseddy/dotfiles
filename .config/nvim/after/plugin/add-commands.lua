function create_type(prefix, suffix)
    return { prefix = prefix, suffix = suffix }
end

slash = create_type("//", "")
hash  = create_type("'\\#'", "")

filetypes = {
    javascript = slash,
    go         = slash,
    c          = slash,
    php        = slash,
    sh         = hash,
    python     = hash,
    html       = create_type("\\<\\!--", "--\\>"),
    css        = create_type("/\\*", "\\*/"),
    lua        = create_type("--", ""),
    vim        = create_type("\\\"", ""),
}

function get_lang()
    local ft = vim.bo.filetype
    local lang = filetypes[ft]

    local res = {}

    if lang == nil then
        res.error = "vimcmd-toggle-comment: " .. ft .. " filetype is not supported"
        return res
    end

    res.prefix = lang.prefix
    res.suffix = lang.suffix

    return res
end

function toggle_comment()
    r = get_lang()

    if r.error then
        return print(r.error)
    end

    return ":!vimcmd-toggle-comment " .. r.prefix .. " " .. r.suffix .. "<cr>"
end

vim.keymap.set("v", "<leader>/", toggle_comment, { expr = true })
