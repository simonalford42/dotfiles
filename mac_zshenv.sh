# load general settings
. ~/dotfiles/general_zshenv.sh

alias src='source ~/dotfiles/mac_zshenv.sh'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias pdflatex='latex2'
# brew when m1-native not available
alias ibrew='arch -x86_64 /usr/local/bin/brew'

# SSH ALIASES
ADDR=sca63@g2-login-05.coecis.cornell.edu
SSH_ADDR=$ADDR
alias g2='ssh $ADDR'
alias clip='ssh $ADDR "cat ~/.vim/clip.txt" | pbcopy'
alias host='ssh $ADDR "cat ~/.host" | pbcopy'
# for cornell webpage
alias website='ssh sca63@linux.coecis.cornell.edu'
# change sablab-gpu-06.ece.cornell.edu to whatever node name is for jupyter notebook
# more info: https://it.coecis.cornell.edu/researchit/g2cluster/#Starting_a_Jupyter_notebook_session_Tunneling_the_notebook
alias g2j='ssh -4 -Y -L 6006:sablab-gpu-06.ece.cornell.edu:6006 $ADDR -v -v'
alias g2m='ssh -Y -L 7845:127.0.0.1:7845 $ADDR'

# Function to add SSH config entry for Cornell nodes
addnode() {
    NODE_NAME=$1
    CONFIG_FILE="$HOME/.ssh/config"

    # Create config entry
    CONFIG_ENTRY="Host $NODE_NAME
ProxyCommand ssh sca63@g2-login-05.coecis.cornell.edu -W $NODE_NAME:%p
User sca63"

    # Add entry to config file
    echo "$CONFIG_ENTRY" >> "$CONFIG_FILE"
    echo "SSH config entry added for $NODE_NAME"
}

function scopy() {
    scp -rC $ADDR:/home/sca63/$1 $2
}

function gpt() {
    cd ~/code/fun/openai
    if [ $# -eq 0 ]; then
        python gpt.py
    else
        python gpt.py "$@"
    fi
}

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

# compile graphviz from vim
graphitt() {
    s=${1%gv}pdf
    neato -Tpdf $1 -o $s
    open -a "Preview" $s
}

# compile graphviz from vim
graphit() {
    s=${1%gv}pdf
    dot -Tpdf $1 -o $s
    open -a "Preview" $s
}

# compile graphviz from vim
graphitpng() {
    s=${1%gv}png
    dot -Tpng $1 -o $s
    open -a "Preview" $s
}

# for compiling biblatex from vim
latte2 () {
    s=${1%tex}pdf
    t=${1%tex}aux
    echo $1
    echo $s
    echo $t
    pdflatex $1
    bibtex $t
    pdflatex $1
    pdflatex $1
    open -a "Preview" $s
}

# added for sketch 2020 6.s084
export PATH="$PATH:/Users/alfordsimon/Applications/sketch-1.7.6/sketch-frontend/"
export SKETCH_HOME="/Users/alfordsimon/Applications/sketch-1.7.6/sketch-frontend/runtime"
# trying again with new sketch download?
export PATH="$PATH:/Users/alfordsimon/Code/sketch-1.7.6/sketch-frontend"
export SKETCH_HOME="/Users/alfordsimon/Code/sketch-1.7.6/sketch-frontend/runtime"

# iterm tab titles
if [ $ITERM_SESSION_ID ]; then
precmd() {
  echo -ne "\033]0;${PWD##*/}\007"
}
fi

# Update your path to include LaTeX for TAs
export PATH=${PATH}:/usr/texbin

# include scripts in the path
export PATH=${PATH}:/users/simon/code/scripts

# Kivy settings for preferences and logging
export KIVY_HOME="${HOME}/.kivy"

# for jekyll; see https://jekyllrb.com/docs/installation/macos/ (12/27/21)
export SDKROOT=$(xcrun --show-sdk-path)

# for jekyll;
export PATH=${PATH}:/Users/simon/.gem/ruby/2.6.0/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/simon/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/simon/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/simon/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/simon/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup


if [ -f "/Users/simon/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/simon/mambaforge/etc/profile.d/mamba.sh"
fi

unset __conda_setup
# <<< conda initialize <<<

# had issues with conda, this fixes it: https://stackoverflow.com/a/60180578/4383594
# conda deactivate && conda activate base

if [ -f "/Users/simon/mambaforge/etc/profile.d/mamba.sh" ]; then
        . "/Users/simon/mambaforge/etc/profile.d/mamba.sh"
fi

# opam configuration
[[ ! -r /Users/simon/.opam/opam-init/init.zsh ]] || source /Users/simon/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

source /Users/simon/.config/broot/launcher/bash/br

[ -f "/Users/simon/.ghcup/env" ] && source "/Users/simon/.ghcup/env" # ghcup-env

# for llvm, from bash rec, see https://apple.stackexchange.com/a/434462/308005
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/simon/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/simon/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/simon/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/simon/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/simon/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/simon/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

export PATH="/usr/local/opt/kleopatra/bin:$PATH"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/simon/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
. "$HOME/.cargo/env"
