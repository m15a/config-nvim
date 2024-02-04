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
        vimPlugins.clever-f
        vimPlugins.gitsigns-nvim
        vimPlugins.lspkind-nvim
        vimPlugins.marks-nvim
        vimPlugins.numb-nvim
        vimPlugins.nvim-lspconfig
        vimPlugins.nvim-treesitter-textobjects
        vimPlugins.nvim-web-devicons
        vimPlugins.telescope-nvim
        vimPlugins.telescope-symbols-nvim
        vimPlugins.vim-asterisk
        vimPlugins.vim-nix
        vimPlugins.vim-pandoc-syntax
        vimPlugins.vim-repeat
        vimPlugins.vim-rsi
        vimPlugins.vim-table-mode
        vimPlugins.vim-unimpaired
        (vimPlugins.nvim-treesitter.withPlugins (_: tree-sitter.allGrammars))
        vimExtraPlugins.Comment-nvim
        vimExtraPlugins.autoclose-nvim
        vimExtraPlugins.bullets-vim
        vimExtraPlugins.dial-nvim
        vimExtraPlugins.dressing-nvim
        vimExtraPlugins.feline-nvim
        vimExtraPlugins.glow-nvim
        vimExtraPlugins.none-ls-nvim
        vimExtraPlugins.nvim-lastplace
        vimExtraPlugins.nvim-pqf
        vimExtraPlugins.nvim-spider
        vimExtraPlugins.nvim-srcerite
        vimExtraPlugins.nvim-various-textobjs
        vimExtraPlugins.sentiment-nvim
        vimExtraPlugins.stcursorword
        vimExtraPlugins.surround-nvim
        vimExtraPlugins.telescope-bibtex-nvim
        vimExtraPlugins.telescope-heading-nvim
        vimExtraPlugins.todo-comments-nvim
        vimExtraPlugins.vim-fennel-syntax
        vimExtraPlugins.vim-gfm-syntax
        vimExtraPlugins.yanky-nvim
      ];
    };
  };
}
