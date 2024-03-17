# .bashrc
# written by krzych for krzych
#
# krzysckh.org
# krzysckh 2021, 2022, 2023, 2024

. /etc/profile.d/bash_completion.sh
alias pm="sudo make clean ; perl Makefile.PL ; sudo make install"
alias lg=lazygit

stty stop undef
# stop ctrl-s

export GCC_COLORS='error=01;31:warning=01;30:note=01;36:caret=01;32:locus=01:quote=01'
# cc colored warnings etc

PS1='λ '
PS2='> '
# prompt

export EDITOR='vim'
export VISUAL='vim'
export BROWSER='firefox-esr'
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

#alias rm='rm -i'
# paranoia

# thank fuck archwiki
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;33m'
export LESS_TERMCAP_so=$'\e[01;44;37m'
export LESS_TERMCAP_us=$'\e[01;37m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_ue=$'\e[0m'
export GROFF_NO_SGR=1

export HISTSIZE=
export HISTFILESIZE=

export MDCAT_PAGER="less -R"

topdf() {
  [ -z "$1" ] && return

  bare="$(echo $1 | rev | sed 's/.*\.//' | rev)"
  tesseract "$1" "$bare" -l pol pdf
  echo "=> $bare"
}


export MAKESYSPATH=/usr/share/mk/

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
cls
# some update of urxvt f'd something up with geometry in dwm
# it's a "fix"


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
