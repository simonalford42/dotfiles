# load general settings
. ~/dotfiles/general_rc.sh

alias src='source ~/dotfiles/mac_rc.sh'
alias pdflatex='latex2'

# SSH ALIASES
ADDR=sca63@g2-login-05.coecis.cornell.edu
SSH_ADDR=$ADDR
alias g2='ssh $ADDR'
alias clip='ssh $ADDR "cat ~/.vim/clip.txt" | pbcopy'
alias tbr=touchbarreset

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/simon/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/simon/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/simon/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/simon/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
