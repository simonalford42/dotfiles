# MAC zshenv

# ssh aliases
alias bu='ssh -L 5002:127.0.0.1:5005 salford@peterchin8.bu.edu'
alias mvm2='cd /om2/user/salford/neurosymbolic-modules/bidir-synth && source activate pytorch'
alias ll="ssh salford@txe1-login.mit.edu"
alias clip='ssh -Y salford@polestar.mit.edu "cat ~/.vim/clip.txt" | pbcopy'
alias om='ssh -Y salford@openmind7.mit.edu'
alias tb='ssh -L 16006:127.0.0.1:6006 salford@txe1-login.mit.edu'
alias mlf='ssh -L 5001:127.0.0.1:5000 salford@polestar.mit.edu'
alias pst='ssh -Y salford@polestar.mit.edu'
alias athena='ssh -Y salford@athena.dialup.mit.edu'
# for website
alias cornell='ssh sca63@linux.coecis.cornell.edu'
# change sablab-gpu-06.ece.cornell.edu to whatever node name is for jupyter notebook
# more info: https://it.coecis.cornell.edu/researchit/g2cluster/#Starting_a_Jupyter_notebook_session_Tunneling_the_notebook
alias g2='ssh -L 8899:sablab-gpu-01.ece.cornell.edu:8899 sca63@g2-login.coecis.cornell.edu'
# alias g2='ssh -L 8899:nikola-compute-03.cs.cornell.edu:8899 sca63@g2-login.coecis.cornell.edu'

# other aliases
alias src='source ~/dotfiles/mac_zshenv.sh'
alias mvm="cd ~/Code/neurosymbolic-modules/bidir-synth && conda activate arc2"
alias clip='ssh -Y salford@polestar.mit.edu "cat ~/.vim/clip.txt" | pbcopy'
alias scopy='scp -rC sca63@g2-login.coecis.cornell.edu:/home/sca63/to_copy/ ~/'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias pdflatex='latex2'
alias ibrew="arch -x86_64 /usr/local/bin/brew"

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

. ~/dotfiles/general_zshenv.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/simon/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/simon/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/simon/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/simon/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# had issues with conda, this fixes it: https://stackoverflow.com/a/60180578/4383594
conda deactivate && conda activate base
