# simplify
alias code="codium"
alias p="sudo pacman -S"
alias icat="kitty +kitten icat"

# terminal color output
alias ls="lsd"
alias ll="lsd -l"
alias cat="bat"
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
export LESS='-R --use-color -Dd+r$Du+b'

#trash managment
alias tr="trash-put"
alias rm="trash-put" 
alias trl="trash-list"
alias trr="trash-restore"

#dotfiles git
alias dot-git='/usr/bin/git --git-dir=$HOME/.dotfiles_repo/ --work-tree=$HOME'
