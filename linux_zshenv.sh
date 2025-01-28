# to see jobs on ellis
# sacct -X --format="JobID, node%-20, user, State%-10, JobName%-15, Elapsed, AllocTRES%-42" -a -s R -r ellis

# you can cat /share/ellis/g2_usage/sacct to see a list of jobs scheduled under ellis
alias pl='python -i -c"from spock_reg_model import load"'

# load general settings
. ~/dotfiles/general_zshenv.sh

# copy host name to ~/.host. used with addnode() command in mac_zshenv
hostname -s > ~/.host

export PATH=$PATH:/share/apps/anaconda3/2021.05/bin
# bin folder that doesn't require sudo access
export PATH=$PATH:$HOME/bin

function ov() {
    vim out/$(ls -t out | head -n $1)
}

function trash() {
    mv "$@" ~/trash/
}

function single_file() {
    rm ~/single_file/* && cp "$@" ~/single_file/
}

alias cab='conda activate bnn_chaos_model'
alias vimout='vim $(cd out && ls -Art | tail -n 10)$'
alias ma='mamba activate'
alias ecopy='touch ~/to_copy/random.txt && mv ~/to_copy/* ~/trash/'
alias src='source ~/dotfiles/linux_zshenv.sh'
alias ijob='run --nodes=1 --time=02:00:00 --mem=50G --pty bash'
alias gpujob='srun --nodes=1 --gres=gpu:1 --cpus-per-task=8 --time=02:00:00 --mem=50G --partition=default_partition-interactive --pty bash'
alias vsgpu='srun --nodes=1 --gres=gpu:1 --cpus-per-task=8 --time=04:00:00 --mem=50G --partition=default_partition-interactive --pty bash'
alias vscpu='srun --nodes=1 --cpus-per-task=8 --time=04:00:00 --mem=50G --partition=default_partition-interactive --pty bash'
alias gpujob2='srun --nodes=1 --gres=gpu:1 --cpus-per-task=8 --time=02:00:00 --mem=50G --partition=gpu-interactive --pty bash'
alias gpujobe='srun --nodes=1 --cpus-per-task=8 --gres=gpu:1 --time=02:00:00 --mem=50G --partition=ellis-interactive --pty bash'
alias gpujoba='srun --gres=gpu:a6000:1 --time=02:00:00 --partition=gpu-interactive --pty bash'
alias gpujobe1='srun --nodes=1 --cpus-per-task=8 --gres=gpu:1 --time=02:00:00 --mem=50G --nodelist=ellis-compute-01 --pty bash'
alias gpujobe2='srun --nodes=1 --cpus-per-task=8 --gres=gpu:1 --time=02:00:00 --mem=50G --nodelist=ellis-compute-02 --pty bash'

alias jnb='XDG_RUNTIME_DIR=/tmp/sca63 jupyter-notebook --ip=0.0.0.0 --port=8899'

alias wsq='watch squeue -u sca63'
alias sq='squeue -u sca63'
# cancel all of my jobs
alias scu='scancel -u sca63'
alias jnb='XDG_RUNTIME_DIR=/tmp/sca63 jupyter-notebook --ip=0.0.0.0 --port=8899'

# since we don't have ag
alias grepp='grep --include \*.py -n ./ -e'
alias greppr='grep --include \*.py -rn ./ -e'

# another good one is sacct
# see gpus available
alias sinfo2='sinfo -o "%20N  %10c  %10m  %25f  %10G "'

alias ysq='squeue -o "%.9i %.9P %80j %.15u %.8T %.10M %.9l %.6D %R"' # squeue with some addition info
alias ysqm='sq -u $USER' # sq for my jobs only
alias ysqmo='squeue -o "%.9i %.9P %80j %.15u %.8T %.10M %.9l %.6D %R %o" -u $USER' # sqm + showing the command as well
alias ysp='squeue -t PENDING -o "%.8Q %.10i %.3P %.9j %.6u %.2t %.16S %.10M %.10l %.5D %.12b %.2c %.4m %R" -S -t,-p,i | less -N ' # show all pending jobs
alias ysia='sinfo -o "%15P %.5a %.10l %.10s %.4r %.8h %.10g %.6D %.11T %15G %N"'
# see who is using ellis nodes
alias ysqa='cat /share/ellis/g2_usage/sacct'

# for gpg key github? https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key
export GPG_TTY=$(tty)

# add julia to path
export PATH="/home/sca63/julia-1.9.3/bin:$PATH"

# source /home/sca63/mambaforge/etc/profile.d/conda.sh
source activate bnn_chaos_model

# tmux at
