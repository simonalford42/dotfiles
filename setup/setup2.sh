#!/bin/bash

# for now, just add manually

# -s is for symbolic link, -i means give an error if link already exists

# making a link from A to B overwrites B with a link to A.
# then when you edit either of them, both are changed.
# if you replace A with another file, then B changes too.
# if you replace B with another file, then the link is broken:
#   A stays what it used to be, and B is now the new file.

# we want editing ~/.file to update ~/dotfiles/file
# and we want updating ~/dotfiles/file with git to update ~/.file

# so do ln -si ~/dotfiles/file ~/.file

# editing ~/.zshenv should change dotfiles version
# ln -si ~/.zshenv ~/dotfiles/zshenv
# # shouldn't ever edit zshrc
# ln -si ~/dotfiles/zshenv ~/.zshrc
# # editing ~/.zshenv should change ~/.bashrc
# ln -si ~/.zshenv ~/.bashrc
# # editing ~/.zshenv should change ~/.bash_profile
# ln -si ~/.zshenv ~/.bash_profile
ln -si ~/.vim ~/dotfiles/vim
# editing ~/.spacemacs should change dotfiles version
# ln -si ~/.spacemacs ~/dotfiles/spacemacs

# ln -si ~/.tmux.conf ~/dotfiles/tmux.conf
# ln -si ~/.config/flake8 ~/dotfiles/flake8

