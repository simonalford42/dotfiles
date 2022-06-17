#!/bin/bash

# assist in setting up caps lock mods
# cp ../config/karabiner.json ~/.config/karabiner/assets/complex_modifications

# SYM LINKING DOTFILES TO HOME DIRECTORY 

# -s is for symbolic link, -i means give an error if link already exists

# making a link from A to B overwrites B with a link to A.
# then when you edit either of them, both are changed.
# if you replace A with another file, then B changes too.
# if you replace B with another file, then the link is broken:
#   A stays what it used to be, and B is now the new file.

# we want editing ~/.file to update ~/dotfiles/file
# and we want updating ~/dotfiles/file with git to update ~/.file

# so do ln -si ~/dotfiles/file ~/.file
# note: using ~ doesn't seem to work, do full path.

ln -si /Users/simon/dotfiles/mac_zshenv.sh /Users/simon/.zshenv

# these should all just mirror zshenv
ln -si /Users/simon/dotfiles/mac_zshenv.sh /Users/simon/.bashrc
ln -si /Users/simon/dotfiles/mac_zshenv.sh /Users/simon/.zshrc
ln -si /Users/simon/dotfiles/mac_zshenv.sh /Users/simon/.bashrc

ln -si /Users/simon/dotfiles/tmux.conf /Users/simon/.tmux.conf
ln -si /Users/simon/dotfiles/flake8 /Users/simon/.config/flake8
ln -si /Users/simon/dotfiles/global_gitignore /Users/simon/.gitignore
