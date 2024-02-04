local g = vim.g

g.bullets_enabled_file_types = {
   'markdown',
   'markdown.gfm',
   'markdown.pandoc',
   'gitcommit',
   'text',
}
g.bullets_checkbox_markers = ' x'

g.bullets_set_mappings = false
-- See `augroup TextBulletsMappings` in
-- https://github.com/dkarter/bullets.vim/blob/master/plugin/bullets.vim
vim.api.nvim_create_autocmd('FileType', {
   pattern = g.bullets_enabled_file_types,
   group = vim.api.nvim_create_augroup('bullets', { clear = true }),
   callback = function()
      local map = vim.keymap.set
      local opts_noremap = { silent = true, buffer = true }
      local opts = vim.tbl_extend('force', opts_noremap, { remap = true })

      map('i', '<CR>', '<Plug>(bullets-newline)', opts)
      map('i', '<C-CR>', '<CR>', opts_noremap)
      map('n', 'o', '<Plug>(bullets-newline)', opts)

      map({ 'n', 'v' }, '<LocalLeader>n', '<Plug>(bullets-renumber)', opts)

      map('n', '<LocalLeader>x', '<Plug>(bullets-toggle-checkbox)', opts)

      map('i', '<C-t>', '<Plug>(bullets-demote)', opts)
      map('n', '>>', '<Plug>(bullets-demote)', opts)
      map('v', '>', '<Plug>(bullets-demote)', opts)

      map('i', '<C-d>', '<Plug>(bullets-promote)', opts)
      map('n', '<<', '<Plug>(bullets-promote)', opts)
      map('v', '<', '<Plug>(bullets-promote)', opts)
   end,
})
