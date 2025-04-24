# old stuff i dont want in my mac_zshenv anymore, but leaving here in case i need it again
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
# for cornell webpage
alias website='ssh sca63@linux.coecis.cornell.edu'

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

# for llvm, from bash rec, see https://apple.stackexchange.com/a/434462/308005
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# haskell
[ -f "/Users/simon/.ghcup/env" ] && source "/Users/simon/.ghcup/env" # ghcup-env

# opam configuration
[[ ! -r /Users/simon/.opam/opam-init/init.zsh ]] || source /Users/simon/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null


function latex2() {
    latexmk -pdf "$@" && latexmk -c
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

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/simon/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=~/.npm-global/bin:$PATH
