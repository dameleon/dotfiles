function peco-ack-vim () {
  vim $(ack "$@" | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}
zle -N peco-ack-vim
