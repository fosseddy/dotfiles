# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="ls -AGlhv --time-style=+'|' --color=auto"
alias v="nvim"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias wttr="curl https://wttr.in/chelyabinsk?format=4"
alias bat-stat="cat $DEVICES/power_supply/BAT0/capacity && cat $DEVICES/power_supply/BAT0/status"
alias cal="cal -m"

#PS1="\[\e[33m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[33m\]]\[\e[m\]\[\e[34m\][\[\e[m\]\[\e[34m\]\w\[\e[m\]\[\e[34m\]]\[\e[m\]\[\e[35m\]\\$\[\e[m\] "
PS1="\[\e[33m\]\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[33m\] \[\e[m\]\[\e[34m\]\[\e[m\]\[\e[34m\]\w\[\e[m\]\[\e[34m\] \[\e[m\]\[\e[35m\]\\$\[\e[m\] "

~/bin/pick-random-color-script
~/bin/task-list print
