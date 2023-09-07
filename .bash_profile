export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/lib/go/bin:$PATH

export XINITRC=$HOME/.config/xorg/xinitrc
export XAUTHORITY=$HOME/.local/state/xorg/Xauthority
export NPM_CONFIG_USERCONFIG=$HOME/.config/npm/npmrc
export NODE_REPL_HISTORY=$HOME/.local/state/nodejs/repl_history
export TS_NODE_HISTORY=$HOME/.local/state/ts-node/repl_history
export GOPATH=$HOME/.local/lib/go

[[ -f ~/.bashrc ]] && . ~/.bashrc
