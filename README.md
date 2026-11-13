# Bruno's nvimrc

my personal neovim config. This is a rewrite
from my [old config](https://github.com/brunobmello25/skeleton.nvim),
using [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)
as a starting point

# Keymaps

You can use `:Keymaps` to see all the keymaps, but the most important ones are:

- `<space>ff` to search for files
- `<space>fg` to search for content with grep
- `<space>fF` to search for files and include hidden files
- `gd` go to definition
- `gI` go to implementation
- `gr` go to references
- `<space>rn` rename symbol
- `<space>.` code actions
- `-` open [oil.nvim](https://github.com/stevearc/oil.nvim) (my file manager of choice)
- `<space>ha` to [grapple](https://github.com/cbochs/grapple.nvim) a file
- `<space>hh` to show [grapple](https://github.com/cbochs/grapple.nvim) menu
- `<space>1` to `<space>9` to switch between [grapple](https://github.com/cbochs/grapple.nvim) files

# Requirements

- [Neovim](https://neovim.io) 0.12+ (tested on 0.12.6)
- [tree-sitter CLI](https://tree-sitter.github.io/tree-sitter/) 0.26+ — the `main` branch of nvim-treesitter needs the CLI on `PATH` to download and compile parsers
- Ripgrep
- NodeJS
- Python
- Golang

If you manage Neovim with [mise](https://mise.jdx.dev), install the tree-sitter CLI alongside it:

    mise use -g tree-sitter@0.27.2
