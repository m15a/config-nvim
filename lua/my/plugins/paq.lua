local M = {}

M.specs = {
   --[[
   Sections below are mostly based on
   [rockerBOO/awesome-neovim](https://github.com/rockerBOO/awesome-neovim).
   ]]
   -- Plugin manager {{{1
   'savq/paq-nvim',

   -- LSP {{{1
   'neovim/nvim-lspconfig',
   'RishabhRD/lspactions',
   'onsails/lspkind-nvim',
   'jose-elias-alvarez/null-ls.nvim',
   'folke/lsp-colors.nvim',

   -- Syntax {{{1
   'nvim-treesitter/nvim-treesitter',
   'nvim-treesitter/nvim-treesitter-textobjects',
   'machakann/vim-sandwich',

   -- Terminal integration {{{1
   'mnacamura/iron.nvim',

   -- Fuzzy finder {{{1
   'nvim-telescope/telescope.nvim',
   'nvim-telescope/telescope-symbols.nvim',

   -- Colorscheme {{{1
   'srcery-colors/srcery-vim',

   -- Icon {{{1
   'kyazdani42/nvim-web-devicons',

   -- Neovim Lua development {{{1
   'nvim-lua/plenary.nvim',
   'nvim-lua/popup.nvim',
   'tjdevries/astronauta.nvim',

   -- Statusline {{{1
   'famiu/feline.nvim',

   -- Git {{{1
   'lewis6991/gitsigns.nvim',

   -- Comment {{{1
   'b3nj5m1n/kommentary',

   -- Quickfix {{{1
   { url = 'https://gitlab.com/yorickpeterse/nvim-pqf.git' },

   -- Motion {{{1
   'chaoren/vim-wordmotion',
   'ggandor/lightspeed.nvim',

   -- Search {{{1
   'thinca/vim-visualstar',

   -- Editing support {{{1
   'dkarter/bullets.vim',
   'tpope/vim-repeat',
   'tpope/vim-unimpaired',
   'ethanholz/nvim-lastplace',

   -- Command line {{{1
   'tpope/vim-rsi',

   -- Language specific {{{1
   -- Markdown {{{2
   { 'mnacamura/glow.nvim', branch = 'preview-buffer-filetype' },
   'rhysd/vim-gfm-syntax',
   'vim-pandoc/vim-pandoc-syntax',
   'dhruvasagar/vim-table-mode',
   'crispgm/telescope-heading.nvim',
   'nvim-telescope/telescope-bibtex.nvim',

   -- Nix {{{2
   'LnL7/vim-nix',

   -- Bash {{{2
   'aliou/bats.vim',

   -- Fish {{{2
   'NovaDev94/vim-fish',

   -- Lua {{{2
   'euclidianAce/BetterLua.vim',

   -- Fennel {{{2
   'mnacamura/vim-fennel-syntax',
   -- }}}1
}

function M.bootstrap()
   local fn = vim.fn
   local repo = 'https://github.com/savq/paq-nvim'
   local path = fn.stdpath 'data' .. '/site/pack/paqs/start/paq-nvim'
   if fn.empty(fn.glob(path)) > 0 then
      fn.system { 'git', 'clone', '--depth=1', repo, path }
      vim.cmd [[packadd paq-nvim]]
   end
end

function M.setup()
   M.bootstrap()
   require 'paq'(M.specs)
end

return M

-- vim: fdm=marker
