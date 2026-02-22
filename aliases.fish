# ls aliases
alias ls='eza --color=always --icons'
alias l1='eza --color=always --icons -1'
alias la='eza -a --color=always --icons'
alias l='eza -l --color=always --group-directories-first --icons --time-style=long-iso'
alias ll='eza -la --color=always --group-directories-first --icons --time-style=long-iso'
alias lt='eza -aT --color=always --group-directories-first --icons'
alias tree='eza -aT --color=always --group-directories-first --icons'

# Clear alias
alias cls='clear'

# Making and removing directories
alias md='mkdir -pv'
alias rm='rm -Iv'

# pacman aliases
alias Sy='sudo pacman -Sy'
alias Qu='pacman -Qu'

# Python aliases
alias py='/usr/bin/env python'

# Virustotal aliases
alias vtsf='vt scan file $1 -o'

