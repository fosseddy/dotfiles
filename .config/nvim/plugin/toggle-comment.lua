local cmd = "~/.local/lib/vimcmd-toggle-comment"

local create_type = function(prefix, suffix)
    return {prefix = prefix, suffix = suffix}
end

local slash = create_type("//", "")
local hash = create_type([[\\#]], "")

local filetypes = {
    javascript = slash,
    typescript = slash,
    go         = slash,
    c          = slash,
    cpp        = slash,
    php        = slash,
    scss       = slash,
    vue        = slash,
    dart       = slash,
    sh         = hash,
    python     = hash,
    yaml       = hash,
    asm        = hash,
    html       = create_type([[\<\!--]], [[--\>]]),
    css        = create_type([[/\*]], [[\*/]]),
    lua        = create_type("--", ""),
    vim        = create_type([[\"]], ""),
}

local get_lang = function()
    local ft = vim.bo.filetype
    local lang = filetypes[ft]

    if lang == nil then
        return nil, cmd..": "..ft.." filetype is not supported"
    end

    return lang, ""
end

function toggle_comment()
    lang, err = get_lang()

    if err ~= "" then
        return print(err)
    end

    return ":!"..cmd.." "..lang.prefix.." "..lang.suffix.."<cr>"
end

vim.keymap.set("v", "<leader>/", toggle_comment, {expr = true})
