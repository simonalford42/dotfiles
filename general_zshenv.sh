# aliases
alias whisper='cd code/fun && python3 whisper.py'
alias mb=mamba
alias p=python
alias c='clear'
alias pt='python -i -c"import torch as t; import torch; import torch.nn.functional as F; import torch.nn as nn; import numpy as np"'
alias ls='ls -Gp' # G colorizes output, p puts a / after directories
alias delswaps='find . -type f -name ".*.sw[klmnop]" -delete'
alias bp='vim ~/dotfiles/*_zshenv.sh ~/dotfiles/tldr.sh*'
alias tld='vim ~/dotfiles/tldr.sh'
alias pip='python -m pip'

# git aliases
alias gp='git pull'
alias gst='git status'
alias gsub='git submodule update --init --recursive'
alias dotgp='cd ~/dotfiles/ && gp && cd -'
alias gpp='git push'
# grep colored output
alias grep='grep --color=always'


function vimr() {
    vim $(ls -t | head -n $1)
}

function find2() {
    find . -name "*$1*"
}

function copilot() {
    # based off extension provided as argument, open vim file 'scratch.extension'
    # if no extension provided, open vim file 'scratch.txt'
    if [ -z "$1" ]; then
        vim ~/scratch.txt
    else
        vim ~/scratch.$1
    fi
}

function ga() {
    git add "$@"
}

function dotgg() {
  # If an argument is provided, use it as the message to echo
  if [ -n "$1" ]; then
    message="$1"
  else
    message="update"
  fi

  cd ~/dotfiles/ && gg $message && cd -
}

function gcm() {
    git commit -m "$@"
}

function gccm() {
    git add -u && git commit -m "$@"
}

function gg() {
    git add -u && git commit -m "$@" && git push
}

# disabled because of weird messages in emacs/automator about stty: stdin isnt
# a terminal
# stty -ixon # so that ctrl-S can be used in vim
# to use vim things in command prompt
# set -o vi

# z cd tool
. ~/dotfiles/z/z.sh

# put ~/dotfiles/scripts on path
export PATH="$HOME/dotfiles/scripts:$PATH"
