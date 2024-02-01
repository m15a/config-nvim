local M = {}

M.specs = {
   'LnL7/vim-nix',
   'aliou/bats.vim',
   'chaoren/vim-wordmotion',
   'chentoast/marks.nvim',
   'crispgm/telescope-heading.nvim',
   'dhruvasagar/vim-table-mode',
   'dkarter/bullets.vim',
   'ellisonleao/glow.nvim',
   'ethanholz/nvim-lastplace',
   'euclidianAce/BetterLua.vim',
   'feline-nvim/feline.nvim',
   'ggandor/lightspeed.nvim',
   'kyazdani42/nvim-web-devicons',
   'lewis6991/gitsigns.nvim',
   'machakann/vim-sandwich',
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
   'rhysd/vim-gfm-syntax',
   'savq/paq-nvim',
   'stevearc/dressing.nvim',
   'thinca/vim-visualstar',
   'tpope/vim-repeat',
   'tpope/vim-rsi',
   'tpope/vim-unimpaired',
   'vim-pandoc/vim-pandoc-syntax',
   'yamatsum/nvim-cursorline',
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
