if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn sync fromstart

syn match sh_comment "^\s*\zs#.*$"
syn match sh_comment "\s\zs#.*$"
syn match sh_comment "#.*$"
syn match sh_comment "#.*$"
syn match sh_comment "#.\{-}\ze`"

syn region sh_string start=+\z(['"]\)+ skip="\\\z1" end="\z1"
syn region sh_string start="<<\s*\z([^ \t|>]\+\)" end="^\z1$"
syn region sh_string start="<<-\s*\z([^ \t|>]\+\)" end="^\t*\z1$"
syn region sh_string start="<<\s*\\\z([^ \t|>]\+\)" end="^\z1$"
syn region sh_string start="<<-\s*\\\z([^ \t|>]\+\)" end="^\t*\z1$"
syn region sh_string start="<<\s*'\z([^']\+\)'" end="^\z1$"
syn region sh_string start="<<-\s*'\z([^']\+\)'" end="^\t*\z1$"
syn region sh_string start="<<\s*\"\z([^"]\+\)\"" end="^\z1$"
syn region sh_string start="<<-\s*\"\z([^"]\+\)\"" end="^\t*\z1$"
syn region sh_string start="<<\s*\\\_$\_s*\z([^ \t|>]\+\)" end="^\z1$"
syn region sh_string start="<<-\s*\\\_$\_s*\z([^ \t|>]\+\)" end="^\t*\z1$"
syn region sh_string start="<<\s*\\\_$\_s*\\\z([^ \t|>]\+\)" end="^\z1$"
syn region sh_string start="<<-\s*\\\_$\_s*\\\z([^ \t|>]\+\)" end="^\t*\z1$"
syn region sh_string start="<<\s*\\\_$\_s*'\z([^']\+\)'" end="^\z1$"
syn region sh_string start="<<-\s*\\\_$\_s*'\z([^']\+\)'" end="^\t*\z1$"
syn region sh_string start="<<\s*\\\_$\_s*\"\z([^"]\+\)\"" end="^\z1$"
syn region sh_string start="<<-\s*\\\_$\_s*\"\z([^"]\+\)\"" end="^\t*\z1$"
syn match sh_string "<<<" skipwhite	nextgroup=sh_cmd_paren_region
syn region sh_cmd_paren_region start="((\@!" skip='\\\\\|\\.' end=")"

syn match sh_special "\$[-#*@!?]"
syn match sh_special "\$\$"
syn match sh_special "\${\d}"
syn region sh_special start="\${##\=" end="}"
syn region sh_special start="\${\$\$" end="}"

hi def link sh_comment Comment
hi def link sh_string String

let b:current_syntax = "sh"
let &cpo = s:cpo_save
unlet s:cpo_save
