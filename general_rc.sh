# aliases
alias whisper='cd code/fun && python3 whisper.py'
alias ca='conda activate'
alias mb=mamba
alias p=python
alias c='clear'
alias pt='python -i -c"import torch as t; import torch; import torch.nn.functional as F; import torch.nn as nn; import numpy as np"'
alias ls='ls -Gp' # G colorizes output, p puts a / after directories
alias delswaps='find . -type f -name ".*.sw[klmnop]" -delete'
alias bp='vim ~/dotfiles/*_rc.sh ~/dotfiles/tldr.sh*'
alias tld='vim ~/dotfiles/tldr.sh'
alias pip='python -m pip'
alias condastartup='cd $CONDA_PREFIX/etc/conda/activate.d/'

# git aliases
alias gp='git pull'
alias gst='git status'
alias gsub='git submodule update --init --recursive'
alias dotgp='cd ~/dotfiles/ && gp && cd -'
alias gpp='git push'
# grep colored output
alias grep='grep --color=always'


# use vim bindings in command line
set -o vi

function vimr() {
    vim $(ls -U | head -n $1)
}

function vime() {
    vim $(sacct -X -o jobid | tail -n $1 | sed 's/[[:space:]]*$//' | sed 's/$/.out/')

}

function find2() {
    find . -name "*$1*"
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

# put ~/dotfiles/scripts on path
export PATH="$HOME/dotfiles/scripts:$PATH"
