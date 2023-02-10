#Custom aliases

#easy
alias code="codium"
alias p="sudo pacman -S"
alias icat="kitty +kitten icat"

#color UwU commands
alias ls="lsd"
alias ll="lsd -l"
alias cat="bat"
#-- The following were added inpirated by:
#-- https://wiki.archlinux.org/title/Color_output_in_console
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

export LESS='-R --use-color -Dd+r$Du+b'

#guit
#dotfiles git
alias dot-git='/usr/bin/git --git-dir=$HOME/.dotfiles_repo/ --work-tree=$HOME'
