#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
force_color_prompt=yes

alias ls='ls --color=auto'
PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$ \[\e[0m\]"
PS2='\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50
HISTFILESIZE=25

cat ~/.cache/wal/sequences

echo blagh

# Calculator function
function calc
{
  echo "${1}" | bc -l;
}

export VISUAL="nano"
export EDITOR="nano"

alias ll='ls -lh'
alias la='ls -Ah'
alias l='ls -CF'
alias lal='ls -alth'
alias cls='clear'
alias c='clear'
alias music=ncmpcpp

# Powerline
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Wal
#(wal -r &)

export SSLKEYLOGFILE=~/sslstrip.log


#cat ~/.cache/wal/sequences
echo -n "▌                    ▌          ▗
▛▀▖▞▀▖ ▞▀▌▝▀▖▌ ▌   ▞▀▌▞▀▖ ▞▀▖▙▀▖▄ ▛▚▀▖▞▀▖▞▀▘
▌ ▌▛▀  ▚▄▌▞▀▌▚▄▌▗▖ ▌ ▌▌ ▌ ▌ ▖▌  ▐ ▌▐ ▌▛▀ ▝▀▖
▀▀ ▝▀▘ ▗▄▘▝▀▘▗▄▘▗▘ ▝▀▘▝▀  ▝▀ ▘  ▀▘▘▝ ▘▝▀▘▀▀
" | lolcat -F 0.6

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ethan/.bin/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ethan/.bin/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ethan/.bin/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ethan/.bin/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

