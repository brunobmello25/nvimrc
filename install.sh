#! /bin/bash

[ -d ~/.config/nvim2 ] && echo "Moving old config to ~/nvim-bck" && mv ~/.config/nvim2 ~/nvim-bck

echo "Linking to ~/.config/nvim2"
ln -s $(pwd) ~/.config/nvim2

