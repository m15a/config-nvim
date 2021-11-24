vim.cmd 'packadd paq-nvim'
require'paq-nvim' {
  --[[
  Sections below are mostly based on
  [rockerBOO/awesome-neovim](https://github.com/rockerBOO/awesome-neovim).
  ]]
  -- Plugin manager {{{1
  {'savq/paq-nvim', opt = true},

  -- LSP {{{1
  'neovim/nvim-lspconfig',
  'RishabhRD/popfix',
  'RishabhRD/nvim-lsputils',
  'onsails/lspkind-nvim',
  'jose-elias-alvarez/null-ls.nvim',

  -- Markdown {{{1
  'npxbr/glow.nvim',
  'vim-pandoc/vim-pandoc-syntax',

  -- Syntax {{{1
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'machakann/vim-sandwich',

  -- Colorscheme {{{1
  'srcery-colors/srcery-vim',

  -- Icon {{{1
  'kyazdani42/nvim-web-devicons',

  -- Neovim Lua development {{{1
  'nvim-lua/plenary.nvim',

  -- Statusline {{{1
  'famiu/feline.nvim',

  -- Git {{{1
  'lewis6991/gitsigns.nvim',

  -- Comment {{{1
  'tyru/caw.vim',

  -- Motion {{{1
  'chaoren/vim-wordmotion',
  'ggandor/lightspeed.nvim',

  -- Search {{{1
  'thinca/vim-visualstar',

  -- Editing support {{{1
  'dkarter/bullets.vim',
  'tpope/vim-repeat',
  'tpope/vim-unimpaired',

  -- Command line {{{1
  'houtsnip/vim-emacscommandline',

  -- Language specific {{{1
  -- Nix {{{2
  'LnL7/vim-nix',

  -- Bash {{{2
  'aliou/bats.vim',

  -- Fish {{{2
  'NovaDev94/vim-fish',

  -- Fennel {{{2
  'mnacamura/vim-fennel-syntax',

  -- TOML {{{2
  'cespare/vim-toml',
  -- }}}1
}
-- vim: fdm=marker
