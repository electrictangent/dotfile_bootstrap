# Lines configured by zsh-newuser-install
HISTFILE=~/.config/histfile
HISTSIZE=1000
SAVEHIST=1000
TERM=xterm
bindkey -e

cat ~/.cache/wal/sequences

# To get delete key working again >:(
bindkey "\e[3~" delete-char

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

autoload -Uz compinit
compinit
# End of lines added by compinstall


### ALIASES ###
alias c='clear'
alias l='ls -a --color'
alias ll='ls -alth --color'

alias ext-ip='curl http://ip1.dynupdate.no-ip.com/'
alias pls='sudo'

### SHORTCUTS ###
export i3config='~/.config/i3/config'

### EXPORTS ###
export XTERM='urxvt'

### OTHER SHIT ###

function calc_raw
{
  echo "{$1}" | bc -l;
}

alias calc='noglob calc_raw'

powerline-daemon -q 
. /usr/lib/python3.10/site-packages/powerline/bindings/zsh/powerline.zsh
