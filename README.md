# Synopsis

An example Neovim configuration, being developed by the policy:

    Keep staying vanilla+, but telescope is unavoidable!

# Plugins

Subsections below are adopted from [rockerBOO/awesome-neovim][1], from which
most plugins listed here are employed.

## Plugin manager

- [x] [savq/paq-nvim][2]

## LSP

- [x] [neovim/nvim-lspconfig][3]
- [x] [RishabhRD/lspactions][4]
- [x] [onsails/lspkind-nvim][5]
- [x] [jose-elias-alvarez/null-ls][6]
- [x] [folke/lsp-colors.nvim][7]

## Syntax

- [x] [nvim-treesitter/nvim-treesitter][8]
- [x] [nvim-treesitter/nvim-treesitter-textobjects][9]
- [x] [machakann/vim-sandwich][10]
    + TODO: Replace it with neovim counterpart.

## Terminal integration

- [x] [mnacamura/iron.nvim][11]
    + An experimental fork of [hkupty/iron.nvim][12]

## Marks

- [ ] [chentau/marks.nvim][13]

## Fuzzy finder

- [x] [nvim-telescope/telescope.nvim][14]
- [x] [nvim-telescope/telescope-symbols.nvim][15]

## Colorscheme creation

- [ ] [Iron-E/nvim-highlite][16]

## Colorscheme

- [x] [srcery-colors/srcery-vim][17]
    + TODO: Replace it with nvim-highlite's.

## Icon

- [x] [kyazdani42/nvim-web-devicons][18]

## Neovim Lua development

- [x] [nvim-lua/plenary.nvim][19]
- [x] [nvim-lua/popup.nvim][20]
- [x] [tjdevries/astronauta.nvim][21]

## Statusline

- [x] [famiu/feline.nvim][22]

## Cursorline

- [ ] [yamatsum/nvim-cursorline][23]

## Git

- [x] [lewis6991/gitsigns.nvim][24]
- [ ] [tveskag/nvim-blame-line][25]
  or [f-person/git-blame.nvim][26]

## Comment

- [x] [b3nj5m1n/kommentary][27]

## Quickfix

- [x] [gitlab:yorickpeterse/nvim-pqf][28]

## Motion

- [x] [chaoren/vim-wordmotion][29]
- [x] [ggandor/lightspeed.nvim][30]

## Search

- [x] [thinca/vim-visualstar][31]

## Editing support

- [ ] [windwp/nvim-autopairs][32] or [steelsojka/pears.nvim][33]
- [ ] [monaqa/dial.nvim][34]
- [ ] [mizlan/iswap.nvim][35]
- [x] [nacro90/numb.nvim][36]
- [x] [ethanholz/nvim-lastplace][37]

## Command line

- [x] [tpope/vim-rsi][38]

## Language specific

### Markdown

- [x] [mnacamura/glow.nvim:preview-buffer-filetype][39]
    + A fork of [ellisonleao/glow.nvim][40]
- [x] [rhysd/vim-gfm-syntax][41]
- [x] [vim-pandoc/vim-pandoc-syntax][42]
- [x] [dhruvasagar/vim-table-mode][43]
- [x] [crispgm/telescope-heading.nvim][44]
- [x] [nvim-telescope/telescope-bibtex.nvim][45]

### Nix

- [x] [LnL7/vim-nix][46]

### Bash

- [x] [aliou/bats.vim][47]

### Fish

- [x] [NovaDev94/vim-fish][48]

### Lua

- [x] [euclidianAce/BetterLua.vim][49]

### Fennel

- [x] [mnacamura/vim-fennel-syntax][50]


[1]: https://github.com/rockerBOO/awesome-neovim
[2]: https://github.com/savq/paq-nvim
[3]: https://github.com/neovim/nvim-lspconfig
[4]: https://github.com/RishabhRD/lspactions
[5]: https://github.com/onsails/lspkind-nvim
[6]: https://github.com/jose-elias-alvarez/null-ls.nvim
[7]: https://github.com/folke/lsp-colors.nvim
[8]: https://github.com/nvim-treesitter/nvim-treesitter
[9]: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
[10]: https://github.com/machakann/vim-sandwich
[11]: https://github.com/mnacamura/iron.nvim
[12]: https://github.com/hkupty/iron.nvim
[13]: https://github.com/chentau/marks.nvim
[14]: https://github.com/nvim-telescope/telescope.nvim
[15]: https://github.com/nvim-telescope/telescope-symbols.nvim
[16]: https://github.com/Iron-E/nvim-highlite
[17]: https://github.com/srcery-colors/srcery-vim
[18]: https://github.com/kyazdani42/nvim-web-devicons
[19]: https://github.com/nvim-lua/plenary.nvim
[20]: https://github.com/nvim-lua/popup.nvim
[21]: https://github.com/tjdevries/astronauta.nvim
[22]: https://github.com/famiu/feline.nvim
[23]: https://github.com/yamatsum/nvim-cursorline
[24]: https://github.com/lewis6991/gitsigns.nvim
[25]: https://github.com/tveskag/nvim-blame-line
[26]: https://github.com/f-person/git-blame.nvim
[27]: https://github.com/b3nj5m1n/kommentary
[28]: https://gitlab.com/yorickpeterse/nvim-pqf
[29]: https://github.com/chaoren/vim-wordmotion
[30]: https://github.com/ggandor/lightspeed.nvim
[31]: https://github.com/thinca/vim-visualstar
[32]: https://github.com/windwp/nvim-autopairs
[33]: https://github.com/steelsojka/pears.nvim
[34]: https://github.com/monaqa/dial.nvim
[35]: https://github.com/mizlan/iswap.nvim
[36]: https://github.com/nacro90/numb.nvim
[37]: https://github.com/ethanholz/nvim-lastplace
[38]: https://github.com/tpope/vim-rsi
[39]: https://github.com/mnacamura/glow.nvim/tree/preview-buffer-filetype
[40]: https://github.com/ellisonleao/glow.nvim
[41]: https://github.com/rhysd/vim-gfm-syntax
[42]: https://github.com/vim-pandoc/vim-pandoc-syntax
[43]: https://github.com/dhruvasagar/vim-table-mode
[44]: https://github.com/crispgm/telescope-heading.nvim
[45]: https://github.com/nvim-telescope/telescope-bibtex.nvim
[46]: https://github.com/LnL7/vim-nix
[47]: https://github.com/aliou/bats.vim
[48]: https://github.com/NovaDev94/vim-fish
[49]: https://github.com/euclidianAce/BetterLua.vim
[50]: https://github.com/mnacamura/vim-fennel-syntax

<!-- vim: set ft=markdown.gfm tw=80: -->
