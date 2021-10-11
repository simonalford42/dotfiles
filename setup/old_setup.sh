#!/bin/bash

# note; out of date. dotfiles no longer stored in .vim lol

# move this folder to .vim 
mv ~/vim ~/.vim

# make the handy trash directory
mkdir ~/trash/

if [ ! -s ~/.bashrc ]
then
    echo '~/.bashrc is not empty. appending contents to ~/.bash_profile'
    echo '# automatically added by ~/.vim/setup.bash to merge with local ~/.bash_profile' >> ~/.bash_profile
    cat ~/.bashrc >> ~/.vim/.bash_profile
    echo '# done adding from ~/.bashrc' 
    mv ~/.bashrc ~/trash
    echo 'old ~/.bash_profile moved to ~/trash/'
fi

ln -s ~/.bash_profile ~/.bashrc
echo 'linked ~/.bashrc to ~/.bash_profile'

if [ ! -s ~/.bash_profile ]
then
    echo '~/.bash_profile is not empty. appending ~/.vim/.bash_profile to it'
    echo '# automatically added by ~/.vim/setup.bash to merge with local ~/.bash_profile' >> ~/.vim/.bash_profile
    cat ~/.vim/.bash_profile >> ~/.bash_profile
    echo '# done adding from ~/.vim/.bash_profile' 
else 
    cp ~/.vim/.bash_profile ~/.bash_profile
fi

# assist in setting up caps lock mods
cp ~/.vim/setup/custom-capslock.json ~/.config/karabiner/assets/complex_modifications

# assist in setting up solarized dark for terminal
cp ~/.vim/setup/solarized_dark.terminal ~/Documents/solarized_dark.terminal

