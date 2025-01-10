# bt-nvim

My own custom NeoVim Configuration. 


# Installation
Clone this directory to `~/.config` and rename it to `nvim`
```
cd ~/.config
git clone git@github.com:bturley2/bt-nvim.git nvim
```

You must also install several dependencies:
```
brew install ripgrep fd luarocks node npm clang-format markdown wget go rust php

# python neovim module, allows running python plugins
python -m pip install neovim
```

And requirements for language support:
```
brew install yaml-language-server \
	python-lsp-server \
	rust-analyzer \
	gopls \
	bash-language-server \
	llvm \
	marksman \
	jdtls
	

# if curious about what any of these are, just use "brew info". ex:
brew info jdtls
```

Oh, and install a Nerd Font while you're at it: https://www.nerdfonts.com/

# Notes
For the sake of clarity, all plugins are installed as their own file in the `lua/plugins/` folder. The goal was to install as few plugins as I could to prevent breaking changes.

The following items are currently installed:
* lazy.nvim [https://github.com/folke/lazy.nvim] as a package manager, the file system follows lazy's standards (note: this is different from LazyVim)
* TreeSitter [https://github.com/nvim-treesitter/nvim-treesitter] for proper language parsing. See the plugin's lua code for a list of languages I've included.
* nvim-lspconfig [https://github.com/neovim/nvim-lspconfig] to allow LSP support.
* telescope [https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file] fuzzy file finder.
* nvim-cmp [https://github.com/hrsh7th/nvim-cmp] Auto-complete for text.
* NeoTree [https://github.com/nvim-neo-tree/neo-tree.nvim] Visual file-tree sidebar.
* nvim-autopairs [https://github.com/windwp/nvim-autopairs] Add end brackets and parenthesis automatically.
* Mason [https://github.com/williamboman/mason.nvim] LSP Installer.
* mason-lspconfig [https://github.com/williamboman/mason-lspconfig.nvim] Automatically integrate Mason with lspconfig.
* conform.nvim [certain languages on save] Auto-format files on save
* indent-blankline [https://github.com/lukas-reineke/indent-blankline.nvim] highlights line indentation to make it easier to match indentation


Leader key is set to `<space>`. Invoke file fuzzy finding with `<space>ff`, search within all files with `<space>fg`, etc. The hotkeys are all defined in the `init.lua` file.

Instantly open and close filetree with `\`



