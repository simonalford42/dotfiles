# load general settings
. ~/dotfiles/general_zshenv.sh

alias vm='docker pull charlessherk/cs4120-vm && docker run -it --platform linux/amd64 -v /Users/simon/code/eta-compiler:/home/student/shared charlessherk/cs4120-vm'
alias vmu='docker pull charlessherk/cs4120-vm'
alias vm2='docker pull charlessherk/cs4120-vm && docker run -it --platform linux/x86-64 -v /Users/simon/code/eta-compiler:/home/student/shared charlessherk/cs4120-vm'
alias src='source ~/dotfiles/mac_zshenv.sh'
alias mvm='cd ~/Code/abstraction'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias pdflatex='latex2'
# brew when m1-native not available
alias ibrew='arch -x86_64 /usr/local/bin/brew'

# ssh aliases
# ssh without password: https://serverfault.com/a/241593/529924
ADDR=sca63@g2-login.coecis.cornell.edu
alias g2='ssh $ADDR'
alias clip='ssh $ADDR "cat ~/.vim/clip.txt" | pbcopy'
alias scopy='scp -rC $ADDR:/home/sca63/to_copy/ ~/'
alias scopy2='trash ~/to_copy && scp -rC $ADDR:/home/sca63/to_copy/ ~/ && cp ~/to_copy/models.txt ~/Code/abstraction/ && cp ~/to_copy/*.pt ~/Code/abstraction/models/'
alias single_file='trash ~/single_file && scp -rC $ADDR:/home/sca63/single_file/ ~/'
alias single_file2='trash ~/single_file && scp -rC $ADDR:/home/sca63/single_file/ ~/ && cp ~/single_file/*.pt ~/Code/abstraction/models/'
# for cornell webpage
alias website='ssh sca63@linux.coecis.cornell.edu'
# change sablab-gpu-06.ece.cornell.edu to whatever node name is for jupyter notebook
# more info: https://it.coecis.cornell.edu/researchit/g2cluster/#Starting_a_Jupyter_notebook_session_Tunneling_the_notebook
alias g2j='ssh -4 -Y -L 6006:sablab-gpu-06.ece.cornell.edu:6006 $ADDR -v -v'
alias g2m='ssh -Y -L 7845:127.0.0.1:7845 $ADDR'

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

# Kivy settings for preferences and logging
export KIVY_HOME="${HOME}/.kivy"


# for jekyll; see https://jekyllrb.com/docs/installation/macos/ (12/27/21)
export SDKROOT=$(xcrun --show-sdk-path)

# for jekyll;
export PATH=${PATH}:/Users/simon/.gem/ruby/2.6.0/bin

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

