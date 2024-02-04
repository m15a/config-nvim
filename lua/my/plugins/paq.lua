local M = {}

M.specs = {
   'LnL7/vim-nix',
   'aliou/bats.vim',
   'chentoast/marks.nvim',
   'chrisgrieser/nvim-spider',
   'crispgm/telescope-heading.nvim',
   'dhruvasagar/vim-table-mode',
   'dkarter/bullets.vim',
   'ellisonleao/glow.nvim',
   'ethanholz/nvim-lastplace',
   'euclidianAce/BetterLua.vim',
   'freddiehaddad/feline.nvim',
   'haya14busa/vim-asterisk',
   'kyazdani42/nvim-web-devicons',
   'kylechui/nvim-surround',
   'lewis6991/gitsigns.nvim',
   'm4xshen/autoclose.nvim',
   'mnacamura/nvim-srcerite',
   'mnacamura/vim-fennel-syntax',
   'monaqa/dial.nvim',
   'nacro90/numb.nvim',
   'neovim/nvim-lspconfig',
   'numToStr/Comment.nvim',
   'nvim-lua/plenary.nvim',
   'nvim-lua/popup.nvim',
   'nvim-telescope/telescope-bibtex.nvim',
   'nvim-telescope/telescope-symbols.nvim',
   'nvim-telescope/telescope.nvim',
   'nvim-treesitter/nvim-treesitter',
   'nvim-treesitter/nvim-treesitter-textobjects',
   'nvimtools/none-ls.nvim',
   'onsails/lspkind-nvim',
   'purescript-contrib/purescript-vim',
   'rhysd/clever-f.vim',
   'rhysd/vim-gfm-syntax',
   'savq/paq-nvim',
   'sontungexpt/stcursorword',
   'stevearc/dressing.nvim',
   'tpope/vim-repeat',
   'tpope/vim-rsi',
   'tpope/vim-unimpaired',
   'vim-pandoc/vim-pandoc-syntax',
   { url = 'https://gitlab.com/yorickpeterse/nvim-pqf.git' },
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
