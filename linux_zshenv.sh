. ~/dotfiles/general_zshenv.sh

function mvt() {
    mv "$@" ~/trash/
}

alias src='source ~/dotfiles/linux_zshenv.sh'
export PATH=${PATH}:/share/apps/anaconda3/2021.05/bin
alias ijob='srun --nodes=1 --ntasks-per-node=1 --time=02:00:00 --pty bash -i'
alias gpujob='srun --nodes=1 --gpus-per-node=1 --ntasks-per-node=1 --time=02:00:00 --pty bash -i'
alias sq='squeue -u sca63'
# another good one is sacct

# since we don't have ag
alias grepp='grep -rnw ./ -e' 

tmux at
