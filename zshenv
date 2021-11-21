# testing change2
# ssh aliases
alias clip='ssh -Y salford@polestar.mit.edu "cat ~/.vim/clip.txt" | pbcopy'
alias bu='ssh -L 5002:127.0.0.1:5005 salford@peterchin8.bu.edu'
alias go="python -m rl.main"
alias mvm="cd ~/Code/neurosymbolic-modules/bidir-synth && conda activate arc2"
alias mvm2='cd /om2/user/salford/neurosymbolic-modules/bidir-synth && source activate pytorch'
alias ll="ssh salford@txe1-login.mit.edu"
alias om='ssh -Y salford@openmind7.mit.edu'
alias tb='ssh -L 16006:127.0.0.1:6006 salford@txe1-login.mit.edu'
alias mlf='ssh -L 5001:127.0.0.1:5000 salford@polestar.mit.edu'
alias pst='ssh -Y salford@polestar.mit.edu'
alias athena='ssh -Y salford@athena.dialup.mit.edu'
# for website
alias cornell='ssh sca63@linux.coecis.cornell.edu'
alias g2='ssh sca63@g2-login.coecis.cornell.edu'

# specialized aliases
alias go="python -m rl.main"
alias mvm="cd ~/Code/neurosymbolic-modules/bidir-synth && conda activate arc2"
alias alg='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/2021a-spring'
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias python=python3
alias bp="vim ~/.zshenv"
alias clip='ssh -Y salford@polestar.mit.edu "cat ~/.vim/clip.txt" | pbcopy'
alias scopy='scp -rC salford@polestar.mit.edu:/om2/user/salford/to_copy/ ~/'

# general aliases
alias src='source ~/.zshenv'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias cda='conda activate arc'
alias mp='./mypy.sh'
alias pdflatex='latex2'
# alias pip=echo "python -m pip"
alias ls='ls -Gp' # G colorizes output, p puts a / after directories
alias delswaps='find . -type f -name ".*.sw[klmnop]" -delete'
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias python=python3
alias bp="vim ~/.zshenv"
alias ibrew="arch -x86_64 /usr/local/bin/brew"

# git aliases
alias gp='git pull'
alias gpom='git push origin master'
alias gst='git status'

function ga() {
    git add "$@"
}

function gcm() {
    git commit -m "$@"
}

# function mvt() {
#     mv "$@" ~/trash/
# }

function latex2() {
    latexmk -pdf "$@" && latexmk -c
} 

# when you don't want brew to update before doing stuff
function brew2() {
    HOMEBREW_NO_AUTO_UPDATE=1 brew "$@" && brew update
}

# for compiling latex from vim
latte () {
    s=${1%tex}pdf
    pdflatex $1
    open -a "Preview" $s
}

# for compiling biblatex from vim
latte2 () {
    s=${1%tex}pdf
    t=${1%tex}aux
    pdflatex $1
    bibtex $t
    pdflatex $1
    pdflatex $1
    open -a "Preview" $s
}

# disabled because of weird messages in emacs/automator about stty: stdin isnt
# a terminal
# stty -ixon # so that ctrl-S can be used in vim
# to use vim things in command prompt
set -o vi

# added for sketch 2020 6.s084
export PATH="$PATH:/Users/alfordsimon/Applications/sketch-1.7.6/sketch-frontend/"
export SKETCH_HOME="/Users/alfordsimon/Applications/sketch-1.7.6/sketch-frontend/runtime"
# trying again with new sketch download?
export PATH="$PATH:/Users/alfordsimon/Code/sketch-1.7.6/sketch-frontend"
export SKETCH_HOME="/Users/alfordsimon/Code/sketch-1.7.6/sketch-frontend/runtime"

# for conda
# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/simon/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/simon/miniforge3/etc/profile.d/conda.sh" ]; then
#         . "/Users/simon/miniforge3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/simon/miniforge3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# iterm tab titles
if [ $ITERM_SESSION_ID ]; then
precmd() {
  echo -ne "\033]0;${PWD##*/}\007"
}
fi


# Update your path to include LaTeX for TAs
export PATH=${PATH}:/usr/texbin

# Kivy settings for preferences and logging
export KIVY_HOME="${HOME}/.kivy"

# M1 python for tensorflow?
# export PATH="/Users/simon/miniforge3/bin:$PATH"

# commented out to enable miniforge M1 usage?
# added after installing homebrew 3.0.0 for M1
eval "$(/opt/homebrew/bin/brew shellenv)"

# export PATH="/usr/local/opt/python@3.7/bin:$PATH"
