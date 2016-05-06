function peco-ghq-src () {
    local selected=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected" ]; then
        BUFFER="cd ${selected}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-ghq-src
