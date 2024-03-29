# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="ls -AGlhv --time-style=+'|' --color=auto"
alias v="nvim"
alias dotfiles="/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias wttr="curl https://wttr.in/chelyabinsk?format=4"
alias bat-stat="cat /sys/class/power_supply/BAT0/capacity && cat /sys/class/power_supply/BAT0/status"
alias cal="cal -m"
alias rg="rg --no-heading"
alias fd="fd -u"

PS1="\[\e[33m\]\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[33m\] \[\e[m\]\[\e[34m\]\[\e[m\]\[\e[34m\]\w\[\e[m\]\[\e[34m\] \[\e[m\]\[\e[35m\]\\$\[\e[m\] "

$HOME/.local/lib/random-color-script
task-list print
