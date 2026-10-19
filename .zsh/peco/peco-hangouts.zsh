function peco-hangouts () {
    local hangouts_dir=$(ghq list -p | grep -m1 hangouts)
    local selected=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected" ]; then
        BUFFER="make -C ${hangouts_dir} shell WORKSPACE=${selected}"
        zle accept-line
    fi
    zle clear-screen
}

zle -N peco-hangouts

function peco-hangouts-here () {
    local hangouts_dir=$(ghq list -p | grep -m1 hangouts)
    BUFFER="make -C ${hangouts_dir} shell WORKSPACE=${PWD}"
    zle accept-line
}
zle -N peco-hangouts-here
