# aliases
alias p=python
alias go="python main.py"
alias mp='./mypy.sh'
alias ls='ls -Gp' # G colorizes output, p puts a / after directories
alias delswaps='find . -type f -name ".*.sw[klmnop]" -delete'
alias bp="vim ~/dotfiles/*_zshenv.sh"


# git aliases
alias gp='git pull'
alias gpom='git push'
alias gst='git status'
alias gsub='git submodule update --init --recursive'
alias dotgg="cd ~/dotfiles/ && gp && gg 'update' && cd -"
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
set -o vi
