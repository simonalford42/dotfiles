#!/bin/bash

# for now, just add manually

# editing ~/.zshenv should change dotfiles version
ln -si ~/.zshenv ~/dotfiles/.zshenv ~/.zshenv
# shouldn't ever edit this
ln -si ~/dotfiles/.zshenv ~/.zshrc
# editing ~/.zshenv should change ~/.bashrc
ln -si ~/.zshenv ~/.bashrc
# editing ~/.zshenv should change ~/.bash_profile
ln -si ~/.zshenv ~/.bash_profile
ln -si ~/.vim ~/dotfiles/.vim
# editing ~/.spacemacs should change dotfiles version
ln -si ~/.spacemacs ~/dotfiles/.spacemacs
