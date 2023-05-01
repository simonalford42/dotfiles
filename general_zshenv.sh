# aliases
alias p=python
alias c='clear'
alias pt='python -i -c"import torch as t; import torch; import torch.nn.functional as F; import torch.nn as nn; import numpy as np"'
alias ls='ls -Gp' # G colorizes output, p puts a / after directories
alias delswaps='find . -type f -name ".*.sw[klmnop]" -delete'
alias bp='vim ~/dotfiles/*_zshenv.sh ~/dotfiles/tldr.sh*'
alias tld='vim ~/dotfiles/tldr.sh'
alias pip='python -m pip'

# git aliases
alias gup="git add -u && git commit -m 'save' && git pull"
alias gp='git pull'
alias gpom='git push'
alias gst='git status'
alias gsub='git submodule update --init --recursive'
alias dotgp='cd ~/dotfiles/ && gp && cd -'
alias gpp='git push'
# grep colored output
alias grep='grep --color=always'

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
