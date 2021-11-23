# aliases
alias python=python3
alias mp='./mypy.sh'
alias ls='ls -Gp' # G colorizes output, p puts a / after directories
alias delswaps='find . -type f -name ".*.sw[klmnop]" -delete'
alias bp="vim ~/dotfiles/*_zshenv.sh"

# git aliases
alias gp='git pull'
alias gpom='git push'
alias gst='git status'

function ga() {
    git add "$@"
}

function gcm() {
    git commit -m "$@"
}

# disabled because of weird messages in emacs/automator about stty: stdin isnt
# a terminal
# stty -ixon # so that ctrl-S can be used in vim
# to use vim things in command prompt
set -o vi