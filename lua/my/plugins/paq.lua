local M = {}

M.specs = {
   'Iron-E/nvim-highlite',
   'LnL7/vim-nix',
   'bullets-vim/bullets.vim',
   'chentoast/marks.nvim',
   'chrisgrieser/nvim-spider',
   'chrisgrieser/nvim-various-textobjs',
   'crispgm/telescope-heading.nvim',
   'dhruvasagar/vim-table-mode',
   'ellisonleao/glow.nvim',
   'ethanholz/nvim-lastplace',
   'folke/todo-comments.nvim',
   'freddiehaddad/feline.nvim',
   'gbprod/substitute.nvim',
   'gbprod/yanky.nvim',
   'haya14busa/vim-asterisk',
   'klen/nvim-config-local',
   'kyazdani42/nvim-web-devicons',
   'kylechui/nvim-surround',
   'lewis6991/gitsigns.nvim',
   'm4xshen/autoclose.nvim',
   'm15a/nvim-srcerite',
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
   'sQVe/sort.nvim',
   'savq/paq-nvim',
   'sontungexpt/stcursorword',
   'stevearc/dressing.nvim',
   'tpope/vim-repeat',
   'tpope/vim-rsi',
   'tpope/vim-unimpaired',
   'utilyre/sentiment.nvim',
   'vim-pandoc/vim-pandoc-syntax',
   'yorickpeterse/nvim-pqf',
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
