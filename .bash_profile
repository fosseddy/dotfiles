export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/lib/go/bin:$PATH

export XINITRC=$HOME/.config/xorg/xinitrc
export XAUTHORITY=$HOME/.local/state/xorg/Xauthority
export NPM_CONFIG_USERCONFIG=$HOME/.config/npm/npmrc
export NODE_REPL_HISTORY=$HOME/.local/state/nodejs/repl_history
export TS_NODE_HISTORY=$HOME/.local/state/ts-node/repl_history
export GOPATH=$HOME/.local/lib/go

export LS_COLORS="rs=0:di=00;34:ln=00;36:mh=00:pi=40;33:so=00;35:do=00;35:bd=40;33;00:cd=40;33;00:or=40;31;00:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=00;32:"

[[ -f ~/.bashrc ]] && . ~/.bashrc
