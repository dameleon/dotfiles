source ~/.bashrc
zstyle ':completion:*' matcher-list ' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}''
bindkey -v
bindkey '^R' history-incremental-search-backward

setopt share_history
setopt extended_history
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
function history_all { history -E 1 }

function alc() {
  if [ $# != 0 ]; then
    w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa" | less +37
  else
    w3m "http://www.alc.co.jp/"
  fi
}
