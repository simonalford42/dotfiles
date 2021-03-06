# aliases
alias p=python
alias c='clear'
alias pt='python -i -c"import torch as t; import torch; import torch.nn.functional as F; import torch.nn as nn; import numpy as np"'
alias go="python main.py"
alias mp='./mypy.sh'
alias ls='ls -Gp' # G colorizes output, p puts a / after directories
alias delswaps='find . -type f -name ".*.sw[klmnop]" -delete'
alias bp='vim ~/dotfiles/*_zshenv.sh ~/dotfiles/tldr.sh*'
alias pp='vim ~/dotfiles/tldr.sh'
alias pip='python -m pip'

# git aliases
alias gup="git commit -m 'save' && git pull"
alias gp='git pull'
alias gpom='git push'
alias gst='git status'
alias gsub='git submodule update --init --recursive'
alias dotgg="cd ~/dotfiles/ && gg 'update' && cd -"
alias dotgp='cd ~/dotfiles/ && gp && cd -'
alias gpp='git push'

function ga() {
    git add "$@"
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
