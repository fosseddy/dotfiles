vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.opt.background = "dark"
vim.g.colors_name = "art"

local black = {term = 0, gui = "#1c1c1c"}
local red = {term = 1, gui = "#a36666"}
local green = {term = 2, gui = "#90a57d"}
local yellow = {term = 3, gui = "#d7af87"}
local blue = {term = 4, gui = "#7fa5bd"}
local magenta = {term = 5, gui = "#c79ec4"}
local cyan = {term = 6, gui = "#8adbb4"}
local white = {term = 7, gui = "#d0d0d0"}

local lblack = {term = 8,  gui = "#4a4845"}
local lred = {term = 9,  gui = "#d78787"}
local lgreen = {term = 10, gui = "#afbea2"}
local lyellow = {term = 11, gui = "#e4c9af"}
local lblue = {term = 12, gui = "#a1bdce"}
local lmagenta = {term = 13, gui = "#d7beda"}
local lcyan = {term = 14, gui = "#b1e7dd"}
local lwhite = {term = 15, gui = "#efefef"}

local dblack = {gui = "#121212"}

local none = {term = "NONE", gui = "NONE"}

local hi = function(group, term, gui)
    local ttype = term.type or "NONE"
    local tfg = term.fg and term.fg.term
    local tbg = term.bg and term.bg.term

    local gtype = ttype
    local gfg = term.fg and term.fg.gui
    local gbg = term.bg and term.bg.gui

    if gui ~= nil then
        gtype = gui.type or "NONE"
        gfg = gui.fg and gui.fg.gui
        gbg = gui.bg and gui.bg.gui
    end

    args = {group, "cterm="..ttype, "gui="..gtype}

    if tfg ~= nil then
        table.insert(args, "ctermfg="..tfg)
    end

    if tbg ~= nil then
        table.insert(args, "ctermbg="..tbg)
    end

    if gfg ~= nil then
        table.insert(args, "guifg="..gfg)
    end

    if gbg ~= nil then
        table.insert(args, "guibg="..gbg)
    end

    vim.cmd.highlight(args)
end

local link = function(from, to)
    vim.cmd.highlight({bang = true, "link", from, to})
end

-- UI
hi("Normal", {fg = white, bg = black})

hi("DebugR", {fg = white, bg = red})
hi("DebugG", {fg = white, bg = green})
hi("DebugB", {fg = white, bg = blue})

link("TermCursor", "DebugB")
link("Cursor", "DebugR")
link("lCursor", "DebugR")

hi("SpecialKey", {fg = cyan})
hi("NonText", {fg = lblack})
hi("Directory", {fg = lblue}, {fg = blue})
hi("ErrorMsg", {fg = white,  bg = red})
hi("LineNr", {fg = lblack})
hi("StatusLine", {fg = black, bg = white, type = "bold"})
hi("StatusLineNC", {fg = lblack, bg = black}, {fg = white, bg = lblack})
hi("Visual", {fg = black, bg = yellow}, {fg = white, bg = lblack})
hi("ModeMsg", {fg = white})
hi("WildMenu", {fg = white, bg = magenta}, {fg = white, bg = lblack})
hi("SignColumn", {fg = lblack, bg = black})
hi("Pmenu", {fg = black, bg = yellow}, {fg = white, bg = lblack})
hi("PmenuSel", {fg = white, bg = magenta}, {fg = black, bg = magenta})
hi("PmenuSbar", {bg = yellow}, {bg = dlback})
hi("PmenuThumb", {bg = magenta}, {bg = white})
hi("ColorColumn", {bg = red}, {bg = dblack})
hi("WinSeparator", {fg = black, bg = white})
hi("IncSearch", {fg = white, bg = magenta}, {fg = black, bg = magenta})
hi("Search", {fg = magenta, bg = none}, {fg = black, bg = blue})
hi("CursorLine", {fg = magenta}, {bg = lblack})
hi("TabLine", {fg = lblack, bg = black}, {fg = white, bg = dblack})
hi("TabLineSel", {fg = black, bg = white}, {fg = white, bg = lblack})
hi("MoreMsg", {fg = green})
hi("Question", {fg = green})
hi("WarningMsg", {fg = yellow})
hi("Title", {fg = magenta}, {fg = magenta, bg = black})
hi("Folded", {fg = cyan, bg = black})

link("CursorLineNr", "CursorLine")
link("CursorColumn", "CursorLine")
link("TabLineFill", "TabLine")
link("FoldColumn", "Folded")

link("DiffAdd", "DebugB")
link("DiffChange", "DebugG")
link("DiffDelete", "DebugR")
link("DiffText", "DebugB")

link("SpellBad", "DebugR")
link("SpellCap", "DebugB")
link("SpellRare", "DebugG")
link("SpellLocal", "DebugG")

-- Languages
hi("Underlined", {fg = white, type = "underline"})
hi("MatchParen", {fg = magenta, bg = none}, {fg = white, bg = lblack})

hi("Comment", {fg = lblack})
hi("String", {fg = green})
hi("Constant", {fg = white})
hi("Identifier", {fg = white})
hi("Statement", {fg = white})
hi("PreProc", {fg = white})
hi("Type", {fg = white})
hi("Special", {fg = white})

link("Todo", "Comment")

-- NERDTree
hi("NERDTreeExecFile", {fg = green})
hi("NERDTreeLinkFile", {fg = cyan})

-- Telescope
link("TelescopeMatching", "IncSearch")

-- HTML
vim.g.html_no_rendering = 1
vim.g.html_wrong_comments = 1
