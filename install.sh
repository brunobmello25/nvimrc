#! /bin/bash

# nvim-treesitter (main branch) requires the tree-sitter CLI on PATH to
# compile parsers. With mise:  mise use -g tree-sitter@0.27.2

[ -d ~/.config/nvim ] && echo "Moving old config to ~/nvim-bck" && mv ~/.config/nvim ~/nvim-bck

echo "Linking to ~/.config/nvim"
ln -s $(pwd) ~/.config/nvim

