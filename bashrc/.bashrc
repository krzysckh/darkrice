# .bashrc
# written by krzych for krzych
# 
# krzysckh.org
# krzysckh 2021


export GCC_COLORS='error=01;31:warning=01;30:note=01;36:caret=01;32:locus=01:quote=01'
# cc colored warnings etc

PS1='\u: \[\033[37m\]\W \[\033[34m\]→ \[\033[0m'
PS2='↪ '
# prompt

export EDITOR='vim'
export VISUAL='vim'
export BROWSER='firefox'
export TERMINAL='urxvt'
export PAGER='less'

# basic exports

# my aliases
alias clear='printf "\033c"'
# clear aliased to that 'cause it deletes scrollback in urxvt B)

case $- in *i*) ;; *) return;; esac

# color aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
