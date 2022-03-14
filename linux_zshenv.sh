# at some point, can separate out cluster-specific from general linux stuff.

# load general settings
. ~/dotfiles/general_zshenv.sh

export PATH=${PATH}:/share/apps/anaconda3/2021.05/bin

function trash() {
    mv "$@" ~/trash/
}

alias cag='conda activate gcsl'

alias src='source ~/dotfiles/linux_zshenv.sh'
alias ijob='srun --nodes=1 --time=02:00:00 --pty bash'
alias gpujob='srun --nodes=1 --gres=gpu:1 --time=01:00:00 --partition=default_partition-interactive --pty bash'
alias gpujob2='srun --nodes=1 --gres=gpu:1 --time=01:00:00 --partition=gpu-interactive --pty bash'
alias gpujobe='srun --nodes=1 --gres=gpu:1 --time=01:00:00 --partition=ellis-interactive --pty bash'

alias jnb='XDG_RUNTIME_DIR=/tmp/sca63 jupyter-notebook --ip=0.0.0.0 --port=8899'

alias sq='squeue -u sca63'
# cancel all of my jobs
alias scu='scancel -u sca63'
alias jnb='XDG_RUNTIME_DIR=/tmp/sca63 jupyter-notebook --ip=0.0.0.0 --port=8899'

# moving to places, running common code
alias mvm='cd ~/abstraction/ && conda activate gcsl'
alias go='python abstract.py'

# since we don't have ag
alias grepp='grep -rn ./ -e'

# another good one is sacct
# see gpus available
alias sinfo2='sinfo -o "%20N  %10c  %10m  %25f  %10G "'

# used for abstraction too
conda activate gcsl

tmux at
