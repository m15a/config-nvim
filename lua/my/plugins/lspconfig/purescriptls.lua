local M = {}

-- https://github.com/nwolverson/purescript-language-server?tab=readme-ov-file#neovims-built-in-language-server--nvim-lspconfig
M.settings = {
   purescript = {
      addSpagoSources = true,
      formatter = 'purs-tidy',
   },
}

return M
