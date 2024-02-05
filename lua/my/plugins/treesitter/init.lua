local M = {}

M.config = {
   highlight = {
      enable = true,
      disable = {
         'markdown',
         'nix',
         'fennel',
      },
   },
   incremental_selection = {
      enable = false, -- too much for me!
   },
   indent = {
      enable = true,
   },
}

function M.setup()
   local ok, textobjs = pcall(require, 'my.plugins.treesitter.textobjects')
   local config = M.config
   if ok then
      config = vim.tbl_deep_extend('force', config, textobjs.config)
   end
   require('nvim-treesitter.configs').setup(config)
end

return M
