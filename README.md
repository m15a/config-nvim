## Plugins

Subsections below are mostly adopted from
[rockerBOO/awesome-neovim](https://github.com/rockerBOO/awesome-neovim).

### Plugin manager

- [x] [savq/paq-nvim](https://github.com/savq/paq-nvim)

### LSP

- [x] [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [x] [RishabhRD/nvim-lsputils](https://github.com/RishabhRD/nvim-lsputils)
    + depends on [RishabhRD/popfix](https://github.com/RishabhRD/popfix)
- [x] [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim)
- [x] [jose-elias-alvarez/null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [x] [folke/lsp-colors.nvim](https://github.com/folke/lsp-colors.nvim)

### Syntax

- [x] [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [x] [nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
- [x] [machakann/vim-sandwich](https://github.com/machakann/vim-sandwich)
    + TODO: Replace it with neovim counterpart.

### Terminal integration

- [x] [mnacamura/iron.nvim](https://github.com/mnacamura/iron.nvim)
    + An experimental fork of [hkupty/iron.nvim](https://github.com/hkupty/iron.nvim)

### Snippet

- TODO: Use some snippet plugin?

### Register

- [ ] ~~[tversteeg/registers.nvim](https://github.com/tversteeg/registers.nvim)~~
    + conflicts with telescope's builtin registers.

### Marks

- [ ] [chentau/marks.nvim](https://github.com/chentau/marks.nvim)

### Fuzzy Finder

- [x] [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [x] [nvim-telescope/telescope-symbols.nvim](https://github.com/nvim-telescope/telescope-symbols.nvim)

### Color

- [ ] [folke/twilight.nvim](https://github.com/folke/twilight.nvim)

### Colorscheme Creation

- [ ] [Iron-E/nvim-highlite](https://github.com/Iron-E/nvim-highlite)

### Colorscheme

- [x] [srcery-colors/srcery-vim](https://github.com/srcery-colors/srcery-vim)
    + TODO: Replace it with nvim-highlite's.

### Icon

- [x] [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

### Neovim Lua development

- [x] [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

### Statusline

- [x] [famiu/feline.nvim](https://github.com/famiu/feline.nvim)

### Cursorline

- [ ] [yamatsum/nvim-cursorline](https://github.com/yamatsum/nvim-cursorline)

### Indent

- [ ] [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
  or [haringsrob/nvim_context_vt](https://github.com/haringsrob/nvim_context_vt)

### Git

- [x] [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [ ] [tveskag/nvim-blame-line](https://github.com/tveskag/nvim-blame-line)
  or [f-person/git-blame.nvim](https://github.com/f-person/git-blame.nvim)

### Comment

- [x] [b3nj5m1n/kommentary](https://github.com/b3nj5m1n/kommentary)

### Quickfix

- [x] [gitlab:yorickpeterse/nvim-pqf](https://gitlab.com/yorickpeterse/nvim-pqf)

### Motion

- [x] [chaoren/vim-wordmotion](https://github.com/chaoren/vim-wordmotion)
- [x] [ggandor/lightspeed.nvim](https://github.com/ggandor/lightspeed.nvim)
    + in place of [rhysd/clever-f.vim](https://github.com/rhysd/clever-f.vim): `sr` conflicts with [vim-sandwitch](https://github.com/machakann/vim-sandwich)'s

### Search

- [x] [thinca/vim-visualstar](https://github.com/thinca/vim-visualstar)

### Editing support

- [ ] ~~[RRethy/nvim-align](https://github.com/RRethy/nvim-align) in place of vim-easy-align~~
    + Nowadays all things like this are done by formatters.
- [ ] [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) or [steelsojka/pears.nvim](https://github.com/steelsojka/pears.nvim)
- [ ] [monaqa/dial.nvim](https://github.com/monaqa/dial.nvim)
- [ ] [mizlan/iswap.nvim](https://github.com/mizlan/iswap.nvim)
- [ ] [nacro90/numb.nvim](https://github.com/nacro90/numb.nvim)
- [ ] [abecodes/tabout.nvim](https://github.com/abecodes/tabout.nvim)
- [ ] [ethanholz/nvim-lastplace](https://github.com/ethanholz/nvim-lastplace)

### Command line

- [x] [tpope/vim-rsi](https://github.com/tpope/vim-rsi)
- [ ] [gelguy/wilder.nvim](https://github.com/gelguy/wilder.nvim)

### Split and Window

- [ ] [gitlab.com/yorickpeterse/nvim-window](https://gitlab.com/yorickpeterse/nvim-window)

### Language specific

#### Markdown

- [x] [mnacamura/glow.nvim:preview-buffer-filetype](https://github.com/mnacamura/glow.nvim/tree/preview-buffer-filetype)
    + A fork of [ellisonleao/glow.nvim](https://github.com/ellisonleao/glow.nvim)
- [x] [rhysd/vim-gfm-syntax](https://github.com/rhysd/vim-gfm-syntax)
- [x] [vim-pandoc/vim-pandoc-syntax](https://github.com/vim-pandoc/vim-pandoc-syntax)
- [x] [dhruvasagar/vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)
- [x] [crispgm/telescope-heading.nvim](https://github.com/crispgm/telescope-heading.nvim)
- [x] [nvim-telescope/telescope-bibtex.nvim](https://github.com/nvim-telescope/telescope-bibtex.nvim)

#### Nix

- [x] [LnL7/vim-nix](https://github.com/LnL7/vim-nix)

#### Bash

- [x] [aliou/bats.vim](https://github.com/aliou/bats.vim)

#### Fish

- [x] [NovaDev94/vim-fish](https://github.com/NovaDev94/vim-fish)

#### Lua

- [x] [euclidianAce/BetterLua.vim](https://github.com/euclidianAce/BetterLua.vim)

#### Fennel

- [x] [mnacamura/vim-fennel-syntax](https://github.com/mnacamura/vim-fennel-syntax)

<!-- vim: set ft=markdown.gfm: -->
