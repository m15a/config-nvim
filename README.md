# config-nvim

![~/.config/nvim](_assets/sagrada_falimia.jpg)

An example Neovim configuration.

    Keep staying vanilla+, but telescope is unavoidable!

[![CI][ci badge]][ci status]
[![Nix flake][nix badge]][nix status]

## Installation

You can use this repository either as usual Neovim configuration
(`~/.config/nvim`) or as [Nix flake][0].

### Usual Neovim configuration

> [!CAUTION]
> Back up your configuration (`~/.config/nvim`) and
> plugin packs (`~/.local/share/nvim/site/pack`) beforehand!

```console
$ git clone https://github.com/mnacamura/config-nvim ~/.config/nvim
```

After launching Neovim, execute `:PaqInstall`.
You'll see some error messages but no problem. Relaunch neovim!

### Nix flake

You can just try it:

```console
$ nix run github:mnacamura/config-nvim -- blabla.txt
```

If you happened to like it, install it to your system:

```console
$ nix profile install github:mnacamura/config-nvim
```

## Plugins

This repository ships with plugins listed here,
mostly coming from [rockerBOO/awesome-neovim][1].

### Plugin manager

- [x] [savq/paq-nvim][2]

### Neovim Lua development

- [x] [nvim-lua/plenary.nvim][19]
- [x] [nvim-lua/popup.nvim][20]

### Vanilla+ enhancement

#### Command line

- [x] [tpope/vim-rsi][38]

#### Comment

- [x] [b3nj5m1n/kommentary][27]

#### Editing support

- [ ] [windwp/nvim-autopairs][32] or [steelsojka/pears.nvim][33]
- [x] [monaqa/dial.nvim][34]
- [x] [nacro90/numb.nvim][36]
- [x] [ethanholz/nvim-lastplace][37]

#### Marks

- [x] [chentoast/marks.nvim][13]

#### Motion

- [x] [chaoren/vim-wordmotion][29]
- [x] [ggandor/lightspeed.nvim][30]

#### Quickfix

- [x] [gitlab:yorickpeterse/nvim-pqf][28]

#### Search

- [x] [thinca/vim-visualstar][31]

### Neovim UI enhancement

- [x] [stevearc/dressing.nvim][54]

### LSP enhancement

- [x] [neovim/nvim-lspconfig][3]
- [x] [nvimtools/none-ls][6]
- [x] [onsails/lspkind-nvim][5]

### Telescope and its extensions

- [x] [nvim-telescope/telescope.nvim][14]
- [x] [nvim-telescope/telescope-symbols.nvim][15]
- [x] [nvim-telescope/telescope-bibtex.nvim][45]
- [x] [crispgm/telescope-heading.nvim][44]

### Tree-sitter

- [x] [nvim-treesitter/nvim-treesitter][8]
- [x] [nvim-treesitter/nvim-treesitter-textobjects][9]

### Other syntax extensions

- [x] [machakann/vim-sandwich][10]
    + [ ] Replace it with [blackCauldron7/surround.nvim][51]
          after it supports dot repeat.

### Look and feel

#### Colorscheme

- [x] [mnacamura/nvim-srcerite][52]

#### Icon fonts

- [x] [kyazdani42/nvim-web-devicons][18]

#### Statusline

- [x] [feline-nvim/feline.nvim][22]

#### Cursorline

- [x] [yamatsum/nvim-cursorline][23]

### Tool integration

#### Git

- [x] [lewis6991/gitsigns.nvim][24]

### Language-specific plugins

#### Markdown / LaTeX

- [x] [ellisonleao/glow.nvim][40]
- [x] [rhysd/vim-gfm-syntax][41]
- [x] [vim-pandoc/vim-pandoc-syntax][42]
- [x] [dhruvasagar/vim-table-mode][43]

#### Nix

- [x] [LnL7/vim-nix][46]

#### Bash

- [x] [aliou/bats.vim][47]

#### Lua

- [x] [euclidianAce/BetterLua.vim][49]

#### Fennel

- [x] [mnacamura/vim-fennel-syntax][50]

#### Python

- [x] [raimon49/requirements.txt.vim][53]

## Licenses

See [`_assets/README`](_assets/README) for the licenses of the cover image.

See [`LICENSE`](LICENSE) for the license of the other materials in this
repository.


[0]: https://nixos.wiki/wiki/Flakes
[1]: https://github.com/rockerBOO/awesome-neovim
[2]: https://github.com/savq/paq-nvim
[3]: https://github.com/neovim/nvim-lspconfig
[5]: https://github.com/onsails/lspkind-nvim
[6]: https://github.com/nvimtools/none-ls.nvim
[8]: https://github.com/nvim-treesitter/nvim-treesitter
[9]: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
[10]: https://github.com/machakann/vim-sandwich
[13]: https://github.com/chentoast/marks.nvim
[14]: https://github.com/nvim-telescope/telescope.nvim
[15]: https://github.com/nvim-telescope/telescope-symbols.nvim
[16]: https://github.com/Iron-E/nvim-highlite
[17]: https://github.com/srcery-colors/srcery-vim
[18]: https://github.com/kyazdani42/nvim-web-devicons
[19]: https://github.com/nvim-lua/plenary.nvim
[20]: https://github.com/nvim-lua/popup.nvim
[22]: https://github.com/feline-nvim/feline.nvim
[23]: https://github.com/yamatsum/nvim-cursorline
[24]: https://github.com/lewis6991/gitsigns.nvim
[27]: https://github.com/b3nj5m1n/kommentary
[28]: https://gitlab.com/yorickpeterse/nvim-pqf
[29]: https://github.com/chaoren/vim-wordmotion
[30]: https://github.com/ggandor/lightspeed.nvim
[31]: https://github.com/thinca/vim-visualstar
[32]: https://github.com/windwp/nvim-autopairs
[33]: https://github.com/steelsojka/pears.nvim
[34]: https://github.com/monaqa/dial.nvim
[36]: https://github.com/nacro90/numb.nvim
[37]: https://github.com/ethanholz/nvim-lastplace
[38]: https://github.com/tpope/vim-rsi
[40]: https://github.com/ellisonleao/glow.nvim
[41]: https://github.com/rhysd/vim-gfm-syntax
[42]: https://github.com/vim-pandoc/vim-pandoc-syntax
[43]: https://github.com/dhruvasagar/vim-table-mode
[44]: https://github.com/crispgm/telescope-heading.nvim
[45]: https://github.com/nvim-telescope/telescope-bibtex.nvim
[46]: https://github.com/LnL7/vim-nix
[47]: https://github.com/aliou/bats.vim
[49]: https://github.com/euclidianAce/BetterLua.vim
[50]: https://github.com/mnacamura/vim-fennel-syntax
[51]: https://github.com/blackCauldron7/surround.nvim
[52]: https://github.com/mnacamura/nvim-srcerite
[53]: https://github.com/raimon49/requirements.txt.vim
[54]: https://github.com/stevearc/dressing.nvim

[ci badge]: https://img.shields.io/github/actions/workflow/status/mnacamura/config-nvim/ci.yml?style=flat-square&logo=github&label=CI
[ci status]: https://github.com/mnacamura/config-nvim/actions/workflows/ci.yml
[nix badge]: https://img.shields.io/github/actions/workflow/status/mnacamura/config-nvim/nix.yml?style=flat-square&logo=nixos&logoColor=7ebae4&label=Nix%20flake
[nix status]: https://github.com/mnacamura/config-nvim/actions/workflows/nix.yml

<!-- vim: set ft=markdown.gfm tw=80: -->
