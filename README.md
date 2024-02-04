# ![~/.config/nvim](_assets/sagrada_falimia.jpg)

A vanilla+ Neovim configuration.

[![CI][ci_bdg]][ci_lnk]
[![Nix flake][nf_bdg]][nf_lnk]

[ci_bdg]: https://img.shields.io/github/actions/workflow/status/mnacamura/config-nvim/ci.yml?style=flat-square&logo=github&label=CI
[ci_lnk]: https://github.com/mnacamura/config-nvim/actions/workflows/ci.yml
[nf_bdg]: https://img.shields.io/github/actions/workflow/status/mnacamura/config-nvim/nix.yml?style=flat-square&logo=nixos&logoColor=7ebae4&label=Nix%20flake
[nf_lnk]: https://github.com/mnacamura/config-nvim/actions/workflows/nix.yml

## Installation

Install this repository either as usual Neovim configuration
([`:h XDG_CONFIG_HOME`][1]) or as [Nix flake][2].

### As usual Neovim configuration

> [!CAUTION]
> Make sure to back up your configuration
> (`${XDG_CONFIG_HOME:-~/.config}/nvim`) and plugins
> (`${XDG_DATA_HOME:-~/.local/share}/nvim/site/pack`) before trying it!

```console
git clone https://github.com/mnacamura/config-nvim \
    "${XDG_CONFIG_HOME:-~/.config}/nvim"
nvim -es -V1 --headless \
    --cmd ":lua require'my.plugins.paq'.setup()" \
    --cmd :PaqInstall \
    --cmd :5sleep
nvim -es -V1 --headless +":TSInstall all"  # Optional
```

You may want to customize the `:5sleep` command depending on your environment
such as internet connection speed.

### As Nix flake

Just try it:

```console
nix run github:mnacamura/config-nvim -- blabla.txt
```

If you happened to like it, install it to your system:

```console
nix profile install github:mnacamura/config-nvim
```

## Plugins

This repository ships with plugins listed here,
mostly coming from [rockerBOO/awesome-neovim][3].

### Plugin manager

Only for usual Neovim installation.

- [x] [savq/paq-nvim][4]

### Neovim Lua batteries

- [x] [nvim-lua/plenary.nvim][5]
- [x] [nvim-lua/popup.nvim][6]

### Vanilla+ experience

#### Motion improvements

- [x] [tpope/vim-repeat][101]
- [x] [chrisgrieser/nvim-spider][12]
- [x] [rhysd/clever-f.vim][13]
- [x] [haya14busa/vim-asterisk][14]
- [x] [chrisgrieser/nvim-various-textobjs][105]

#### Useful mappings

- [x] [tpope/vim-unimpaired][102]

#### Insert / command-line mode fixes

- [x] [tpope/vim-rsi][15]

#### Marks

- [x] [chentoast/marks.nvim][17]

#### Comment

- [x] [numToStr/Comment.nvim][16]

#### Parentheses completion

- [x] [m4xshen/autoclose.nvim][19]

#### Extra operators

- [x] [kylechui/nvim-surround][23]
- [x] [gbprod/substitute.nvim][103]

#### Quickfix

- [x] [gitlab:yorickpeterse/nvim-pqf][18]

#### Editing support

- [x] [monaqa/dial.nvim][20]
- [x] [nacro90/numb.nvim][21]
- [x] [ethanholz/nvim-lastplace][22]

#### Neovim UI improvement

- [x] [stevearc/dressing.nvim][7]

### Look and feel

#### Colorscheme

- [x] [mnacamura/nvim-srcerite][8]

#### Statusline

- [x] [freddiehaddad/feline.nvim][9]

#### Cursorline

- [x] [sontungexpt/stcursorword][10]

#### Icon fonts

- [x] [kyazdani42/nvim-web-devicons][11]

### LSP enhancement

- [x] [neovim/nvim-lspconfig][24]
- [x] [nvimtools/none-ls][25]
- [x] [onsails/lspkind-nvim][26]

### Telescope and its extensions

- [x] [nvim-telescope/telescope.nvim][27]
- [x] [nvim-telescope/telescope-symbols.nvim][28]
- [x] [nvim-telescope/telescope-bibtex.nvim][29]
- [x] [crispgm/telescope-heading.nvim][30]

### Tree-sitter

- [x] [nvim-treesitter/nvim-treesitter][31]
- [x] [nvim-treesitter/nvim-treesitter-textobjects][32]

### Language-specific plugins

#### Nix

- [x] [LnL7/vim-nix][33]

#### Fennel

- [x] [mnacamura/vim-fennel-syntax][36]

#### Markdown / LaTeX

- [x] [bullets-vim/bullets.vim][104]
- [x] [rhysd/vim-gfm-syntax][37]
- [x] [vim-pandoc/vim-pandoc-syntax][38]
- [x] [dhruvasagar/vim-table-mode][39]

#### PureScript

- [x] [purescript-contrib/purescript-vim][42]

### Tool integration

#### Git

- [x] [lewis6991/gitsigns.nvim][40]

#### Glow

- [x] [ellisonleao/glow.nvim][41]

## Licenses

See [`_assets/README`](_assets/README) for the licenses of the cover image.

See [`LICENSE`](LICENSE) for the license of the other materials in this
repository.

[1]: https://neovim.io/doc/user/starting.html#%24XDG_CONFIG_HOME
[2]: https://nix.dev/concepts/flakes
[3]: https://github.com/rockerBOO/awesome-neovim
[4]: https://github.com/savq/paq-nvim
[5]: https://github.com/nvim-lua/plenary.nvim
[6]: https://github.com/nvim-lua/popup.nvim
[7]: https://github.com/stevearc/dressing.nvim
[8]: https://github.com/mnacamura/nvim-srcerite
[9]: https://github.com/freddiehaddad/feline.nvim
[10]: https://github.com/sontungexpt/stcursorword
[11]: https://github.com/kyazdani42/nvim-web-devicons
[12]: https://github.com/chrisgrieser/nvim-spider
[13]: https://github.com/rhysd/clever-f.vim
[14]: https://github.com/haya14busa/vim-asterisk
[15]: https://github.com/tpope/vim-rsi
[16]: https://github.com/numToStr/Comment.nvim
[17]: https://github.com/chentoast/marks.nvim
[18]: https://gitlab.com/yorickpeterse/nvim-pqf
[19]: https://github.com/m4xshen/autoclose.nvim
[20]: https://github.com/monaqa/dial.nvim
[21]: https://github.com/nacro90/numb.nvim
[22]: https://github.com/ethanholz/nvim-lastplace
[23]: https://github.com/kylechui/nvim-surround
[24]: https://github.com/neovim/nvim-lspconfig
[25]: https://github.com/nvimtools/none-ls.nvim
[26]: https://github.com/onsails/lspkind-nvim
[27]: https://github.com/nvim-telescope/telescope.nvim
[28]: https://github.com/nvim-telescope/telescope-symbols.nvim
[29]: https://github.com/nvim-telescope/telescope-bibtex.nvim
[30]: https://github.com/crispgm/telescope-heading.nvim
[31]: https://github.com/nvim-treesitter/nvim-treesitter
[32]: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
[33]: https://github.com/LnL7/vim-nix
[36]: https://github.com/mnacamura/vim-fennel-syntax
[37]: https://github.com/rhysd/vim-gfm-syntax
[38]: https://github.com/vim-pandoc/vim-pandoc-syntax
[39]: https://github.com/dhruvasagar/vim-table-mode
[42]: https://github.com/purescript-contrib/purescript-vim
[40]: https://github.com/lewis6991/gitsigns.nvim
[41]: https://github.com/ellisonleao/glow.nvim
[101]: https://github.com/tpope/vim-repeat
[102]: https://github.com/tpope/vim-unimpaired
[103]: https://github.com/gbprod/substitute.nvim
[104]: https://github.com/bullets-vim/bullets.vim
[105]: https://github.com/chrisgrieser/nvim-various-textobjs

<!-- vim: set ft=markdown.gfm tw=80 nowrap: -->
