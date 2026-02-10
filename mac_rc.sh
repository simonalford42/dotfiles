# load general settings
. ~/dotfiles/general_rc.sh

alias src='source ~/dotfiles/mac_rc.sh'
alias pdflatex='latex2'

# SSH ALIASES
ADDR=sca63@unicorn-login-02.coecis.cornell.edu
SSH_ADDR=$ADDR
alias g2='ssh sca63@g2-login-05.coecis.cornell.edu'
alias uc='ssh sca63@unicorn-login-02.coecis.cornell.edu'
alias uc4='ssh sca63@unicorn-login-04.coecis.cornell.edu'
alias g2='ssh sca63@g2-login-04.coecis.cornell.edu'
alias clip='ssh $ADDR "cat ~/.vim/clip.txt" | pbcopy'
alias tbr=touchbarreset

function vpn() {
    local state
    state="$(/opt/cisco/secureclient/bin/vpn state 2>&1)" 
    if echo "$state" | command grep -q "state: Connected"; then
        echo "$state"
        echo "Already connected."
        echo "Disconnect with: /opt/cisco/secureclient/bin/vpn disconnect"
    else
        /Users/simon/code/scripts/cornell-vpn-keychain.exp
    fi
}

function touchbarreset() {
    sudo pkill TouchBarServer
    sudo killall ControlStrip
}

function scopy() {
    scp -rC $ADDR:/home/sca63/$1 $2
}

# when you don't want brew to update before doing stuff
function brew2() {
    HOMEBREW_NO_AUTO_UPDATE=1 brew "$@" && brew update
}

# iterm tab titles
if [ $ITERM_SESSION_ID ]; then
precmd() {
  echo -ne "\033]0;${PWD##*/}\007"
}
fi

# for docker-credential-desktop
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"

# Only set PATH eagerly (fast)
export PATH="/Users/simon/mambaforge/bin:$PATH"

if [ -f "/Users/simon/mambaforge/etc/profile.d/conda.sh" ]; then
  conda() {
    unset -f conda
    . "/Users/simon/mambaforge/etc/profile.d/conda.sh"
    conda "$@"
  }

  mamba() {
    unset -f mamba
    . "/Users/simon/mambaforge/etc/profile.d/conda.sh"
    mamba "$@"
  }
fi

# The next line updates PATH for the Google Cloud SDK.

if [ -f '/Users/simon/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/simon/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/simon/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/simon/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/simon/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
