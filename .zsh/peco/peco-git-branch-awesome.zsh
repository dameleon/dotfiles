function peco-git-branch-awesome() {
    local selected_branch_name=$(git branch -a | peco | sed -e "s/^.*?(remotes\/origin\/)(.*)(\s->\s.*)?$//g") 
    if [ -n "$selected_branch_name" ]; then
        BUFFER="git checkout ${selected_branch_name}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-branch-awesome
