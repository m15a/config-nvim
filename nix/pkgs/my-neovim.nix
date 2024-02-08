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
        (vimPlugins.nvim-treesitter.withPlugins (_: tree-sitter.allGrammars))
        vimPlugins.autoclose-nvim
        vimPlugins.clever-f-vim
        vimPlugins.comment-nvim
        vimPlugins.nvim-config-local
        vimPlugins.dial-nvim
        vimPlugins.dressing-nvim
        vimPlugins.feline-nvim
        vimPlugins.gitsigns-nvim
        vimPlugins.glow-nvim
        vimPlugins.lspkind-nvim
        vimPlugins.marks-nvim
        vimPlugins.none-ls-nvim
        vimPlugins.numb-nvim
        vimPlugins.nvim-highlite
        vimPlugins.nvim-lastplace
        vimPlugins.nvim-lspconfig
        vimPlugins.nvim-pqf
        vimPlugins.nvim-spider
        vimPlugins.nvim-surround
        vimPlugins.nvim-treesitter-textobjects
        vimPlugins.nvim-web-devicons
        vimPlugins.plenary-nvim
        vimPlugins.popup-nvim
        vimPlugins.purescript-vim
        vimPlugins.sort-nvim
        vimPlugins.substitute-nvim
        vimPlugins.telescope-nvim
        vimPlugins.telescope-symbols-nvim
        vimPlugins.todo-comments-nvim
        vimPlugins.vim-asterisk
        vimPlugins.vim-nix
        vimPlugins.vim-pandoc-syntax
        vimPlugins.vim-repeat
        vimPlugins.vim-rsi
        vimPlugins.vim-table-mode
        vimPlugins.vim-unimpaired
        vimPlugins.yanky-nvim
        vimExtraPlugins.bullets-vim
        vimExtraPlugins.nvim-srcerite
        vimExtraPlugins.nvim-various-textobjs
        vimExtraPlugins.sentiment-nvim
        vimExtraPlugins.stcursorword
        vimExtraPlugins.telescope-bibtex-nvim
        vimExtraPlugins.telescope-heading-nvim
        vimExtraPlugins.vim-fennel-syntax
        vimExtraPlugins.vim-gfm-syntax
      ];
    };
  };
}
