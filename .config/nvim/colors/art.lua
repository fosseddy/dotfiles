vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.opt.background = "dark"
vim.g.colors_name = "art"

local black   = {term = 0, gui = "#1c1c1c"}
local red     = {term = 1, gui = "#a36666"}
local green   = {term = 2, gui = "#90a57d"}
local yellow  = {term = 3, gui = "#d7af87"}
local blue    = {term = 4, gui = "#7fa5bd"}
local magenta = {term = 5, gui = "#c79ec4"}
local cyan    = {term = 6, gui = "#8adbb4"}
local white   = {term = 7, gui = "#d0d0d0"}

local lblack   = {term = 8,  gui = "#4a4845"}
local lred     = {term = 9,  gui = "#d78787"}
local lgreen   = {term = 10, gui = "#afbea2"}
local lyellow  = {term = 11, gui = "#e4c9af"}
local lblue    = {term = 12, gui = "#a1bdce"}
local lmagenta = {term = 13, gui = "#d7beda"}
local lcyan    = {term = 14, gui = "#b1e7dd"}
local lwhite   = {term = 15, gui = "#efefef"}

local dblack = {gui = "#121212"}

local term_to_gui = {
    black.gui,  red.gui,      green.gui,   yellow.gui,
    blue.gui,   magenta.gui,  cyan.gui,    white.gui,
    lblack.gui, lred.gui,     lgreen.gui, lyellow.gui,
    lblue.gui,  lmagenta.gui, lcyan.gui,  lwhite.gui,
}

local hi = function(group, term_args, gui_args)
    local term_fg, term_bg, term_mod = unpack(term_args)
    term_mod = term_mod or "NONE"

    local gui_fg, gui_bg, gui_mod

    if gui_args ~= nil then
        gui_fg, gui_bg, gui_mod = unpack(gui_args)
        gui_mod = gui_mod or "NONE"
    else
        gui_fg = term_fg
        if type(term_fg) == "number" then
            gui_fg = term_to_gui[term_fg + 1]
        end

        gui_bg = term_bg
        if type(term_bg) == "number" then
            gui_bg = term_to_gui[term_bg + 1]
        end

        gui_mod = term_mod
    end

    local args = {group, "cterm="..term_mod, "gui="..gui_mod}

    if term_fg ~= nil then
        table.insert(args, "ctermfg="..term_fg)
    end

    if term_bg ~= nil then
        table.insert(args, "ctermbg="..term_bg)
    end

    if gui_fg ~= nil then
        table.insert(args, "guifg="..gui_fg)
    end

    if gui_bg ~= nil then
        table.insert(args, "guibg="..gui_bg)
    end

    vim.cmd.highlight(args)
end

local link = function(from, to)
    vim.cmd.highlight({bang = true, "link", from, to})
end

-- UI
hi("Normal", {white.term, black.term})

hi("DebugR", {"fg", red.term})
hi("DebugG", {"fg", green.term})
hi("DebugB", {"fg", blue.term})

link("TermCursor", "DebugB")
link("Cursor",     "DebugR")
link("lCursor",    "DebugR")

hi("SpecialKey",   {cyan.term})
hi("NonText",      {lblack.term})
hi("Directory",    {lblue.term},           {blue.gui})
hi("ErrorMsg",     {"fg", red.term})
hi("LineNr",       {lblack.term})
hi("StatusLine",   {"bg", "fg", "bold"})
hi("StatusLineNC", {lblack.term, "bg"},    {"fg", lblack.gui})
hi("Visual",       {"bg", yellow.term},    {"fg", lblack.gui})
hi("ModeMsg",      {"fg"})
hi("WildMenu",     {"fg", magenta.term},   {"fg", lblack.gui})
hi("SignColumn",   {lblack.term, "bg"})
hi("Pmenu",        {"bg", yellow.term},    {"fg", lblack.gui})
hi("PmenuSel",     {"fg", magenta.term},   {"bg", magenta.gui})
hi("PmenuSbar",    {_, yellow.term},       {_, dblack.gui})
hi("PmenuThumb",   {_, magenta.term},      {_, "fg"})
hi("ColorColumn",  {_, red.term},          {_, dblack.gui})
hi("WinSeparator", {"bg", "fg"})
hi("IncSearch",    {"fg", magenta.term},   {"bg", magenta.gui})
hi("Search",       {"fg", magenta.term},   {"bg", magenta.gui})
hi("CursorLine",   {magenta.term},         {_, lblack.gui})
hi("TabLine",      {lblack.term, "bg"},    {"fg", dblack.gui})
hi("TabLineSel",   {"bg", "fg"},           {"fg", lblack.gui})
hi("MoreMsg",      {green.term})
hi("Question",     {green.term})
hi("WarningMsg",   {yellow.term})
hi("Title",        {magenta.term},         {magenta.gui, "bg"})
hi("Folded",       {cyan.term, "bg"})
hi("MatchParen",   {magenta.term, "NONE"}, {"fg", lblack.gui})

link("CursorLineNr", "CursorLine")
link("CursorColumn", "CursorLine")
link("TabLineFill",  "TabLine")
link("FoldColumn",   "Folded")

link("DiffAdd",    "DebugB")
link("DiffChange", "DebugG")
link("DiffDelete", "DebugR")
link("DiffText",   "DebugB")

link("SpellBad",   "DebugR")
link("SpellCap",   "DebugB")
link("SpellRare",  "DebugG")
link("SpellLocal", "DebugG")

-- Languages
hi("Comment",    {lblack.term})

hi("Constant", {"fg"})
hi("String",   {green.term})
link("Character", "Constant")
link("Number",    "Constant")
link("Boolean",   "Constant")
link("Float",     "Constant")

hi("Identifier", {"fg"})
link("Function", "Identifier")

hi("Statement", {"fg"})
link("Conditional", "Statement")
link("Repeat",      "Statement")
link("Label",       "Statement")
link("Operator",    "Statement")
link("Keyword",     "Statement")
link("Exception",   "Statement")

hi("PreProc", {"fg"})
link("Include",   "PreProc")
link("Define",    "PreProc")
link("Macro",     "PreProc")
link("PreCondit", "PreProc")

hi("Type", {"fg"})
link("StorageClass", "Type")
link("Structure",    "Type")
link("Typedef",      "Type")

hi("Special", {"fg"})
link("SpecialChar",    "Special")
link("Tag",            "Special")
link("Delimiter",      "Special")
link("SpecialComment", "Special")
link("Debug",          "Special")

hi("Underlined", {"fg", _, "underline"})

hi("Ignore", {"fg"})

link("Error", "ErrorMsg")

link("Todo", "Comment")

-- Telescope
link("TelescopeMatching", "IncSearch")
