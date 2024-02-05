vim.api.nvim_create_autocmd('FileType', {
   pattern = { 'lua' },
   group = vim.api.nvim_create_augroup('filetype_lua', { clear = true }),
   callback = function()
      vim.bo.shiftwidth = 3
   end,
})

vim.api.nvim_create_autocmd('FileType', {
   pattern = { 'vim' },
   group = vim.api.nvim_create_augroup('filetype_vim', { clear = true }),
   callback = function()
      vim.bo.shiftwidth = 2
   end,
})

vim.api.nvim_create_autocmd('FileType', {
   pattern = { 'make' },
   group = vim.api.nvim_create_augroup('filetype_make', { clear = true }),
   callback = function()
      vim.bo.tabstop = 4
   end,
})
