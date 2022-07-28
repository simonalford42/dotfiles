# at some point, can separate out cluster-specific from general linux stuff.

# load general settings
. ~/dotfiles/general_zshenv.sh

export PATH=${PATH}:/share/apps/anaconda3/2021.05/bin
# bin folder that doesn't require sudo access
export PATH=$PATH:$HOME/bin

function trash() {
    mv "$@" ~/trash/
}

function model_copy() {
    cp "$@" ~/to_copy/

}

function model_copy2() {
    cp ~/abstraction/out/models.txt ~/to_copy/
}

alias cag='conda activate gcsl'
alias ecopy='touch ~/to_copy/random.txt && mv ~/to_copy/* ~/trash/'
alias src='source ~/dotfiles/linux_zshenv.sh'
alias ijob='srun --nodes=1 --time=02:00:00 --pty bash'
alias gpujob='srun --nodes=1 --gres=gpu:1 --cpus-per-task=8 --time=01:00:00 --mem=16G --partition=default_partition-interactive --pty bash'
alias gpujob2='srun --nodes=1 --gres=gpu:1 --cpus-per-task=8 --time=01:00:00 --mem=16G --partition=gpu-interactive --pty bash'
alias gpujobe='srun --nodes=1 --cpus-per-task=8 --gres=gpu:1 --time=01:00:00 --mem=16G --partition=ellis-interactive --pty bash'

alias jnb='XDG_RUNTIME_DIR=/tmp/sca63 jupyter-notebook --ip=0.0.0.0 --port=8899'

alias wsq='watch squeue -u sca63'
alias sq='squeue -u sca63'
# cancel all of my jobs
alias scu='scancel -u sca63'
alias jnb='XDG_RUNTIME_DIR=/tmp/sca63 jupyter-notebook --ip=0.0.0.0 --port=8899'

# moving to places, running common code
alias mvm='cd ~/abstraction/ && conda activate gcsl'
alias go='python abstract.py'

# since we don't have ag
alias grepp='grep --include \*.py -rn ./ -e'

# another good one is sacct
# see gpus available
alias sinfo2='sinfo -o "%20N  %10c  %10m  %25f  %10G "'

tmux at

# for gpg key github? https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key
export GPG_TTY=$(tty)
