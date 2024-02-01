{ wrapNeovim
, neovim
, tree-sitter
, config-nvim
, vimPlugins
, vimExtraPlugins
}:

wrapNeovim neovim {
  withPython3 = false;
  withRuby = false;

  configure = {
    customRC = ''
      let g:disable_paq = v:true
      luafile ${config-nvim}/init.lua
    '';

    packages.default = {
      start = [
        config-nvim
        vimPlugins.BetterLua-vim
        vimPlugins.gitsigns-nvim
        vimExtraPlugins.glow-nvim
        vimExtraPlugins.Comment-nvim
        vimPlugins.lightspeed-nvim
        vimPlugins.lspkind-nvim
        vimPlugins.marks-nvim
        vimExtraPlugins.none-ls-nvim
        vimPlugins.numb-nvim
        vimExtraPlugins.stcursorword
        vimPlugins.nvim-lspconfig
        (vimPlugins.nvim-treesitter.withPlugins (_: tree-sitter.allGrammars))
        vimPlugins.nvim-treesitter-textobjects
        vimPlugins.nvim-web-devicons
        vimPlugins.telescope-nvim
        vimPlugins.telescope-symbols-nvim
        vimPlugins.vim-nix
        vimPlugins.vim-pandoc-syntax
        vimPlugins.vim-repeat
        vimPlugins.vim-rsi
        vimPlugins.vim-sandwich
        vimPlugins.vim-table-mode
        vimPlugins.vim-unimpaired
        vimPlugins.vim-visualstar
        vimPlugins.vim-wordmotion
        vimExtraPlugins.bats-vim
        vimExtraPlugins.bullets-vim
        vimExtraPlugins.dial-nvim
        vimExtraPlugins.dressing-nvim
        vimExtraPlugins.feline-nvim
        vimExtraPlugins.nvim-lastplace
        vimExtraPlugins.nvim-pqf
        vimExtraPlugins.nvim-srcerite
        vimExtraPlugins.telescope-bibtex-nvim
        vimExtraPlugins.telescope-heading-nvim
        vimExtraPlugins.vim-fennel-syntax
        vimExtraPlugins.vim-gfm-syntax
      ];
    };
  };
}
