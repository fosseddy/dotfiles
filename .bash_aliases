shopt -s expand_aliases

alias ls="ls -AGlhv --time-style=+'|' --color=auto"
alias v="nvim"
alias dotfiles="/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias wttr="curl https://wttr.in/chelyabinsk?format=4"
alias bat-stat="cat /sys/class/power_supply/BAT0/capacity && cat /sys/class/power_supply/BAT0/status"
alias cal="cal -m"
alias rg="rg --no-heading --hidden"
alias fd="fd -u"
