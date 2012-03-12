function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref#refs/heads/}")"
}
PS1="\u@\h:\w\[\033[00;31m\]\$(parse_git_branch)\[\033[00m\]\$ "
