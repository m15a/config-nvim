local M = {}

M.leader_prefixes = {
   ['[telescope]'] = 'e',
   ['[lsp]'] = 'l',
   ['[git]'] = 'g',
}

function M.setup()
   local g = vim.g
   g.mapleader = ';'
   g.maplocalleader = ','

   local map = vim.api.nvim_set_keymap
   for prefix, key in pairs(M.leader_prefixes) do
      map('', prefix, '<Nop>', { noremap = true })
      map('', '<Leader>' .. key, prefix, {})
   end
end

local function set_prefixed(prefix, key, cmd, opts)
   local opts_ = vim.tbl_extend('force', { silent = true }, opts or {})
   vim.keymap.set('n', prefix .. key, cmd, opts_)
end

function M.set_telescope(key, cmd, opts)
   set_prefixed('[telescope]', key, cmd, opts)
end

function M.set_lsp(key, cmd, opts)
   set_prefixed('[lsp]', key, cmd, opts)
end

function M.set_git(key, cmd, opts)
   set_prefixed('[git]', key, cmd, opts)
end

return M
