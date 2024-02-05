local g = vim.g

g.gfm_syntax_enable_always = false
g.gfm_syntax_enable_filetypes = {
   'markdown.gfm',
}

local group = vim.api.nvim_create_augroup('gfm_syntax', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
   group = group,
   pattern = { 'README.md' },
   callback = function()
      vim.bo.filetype = 'markdown.gfm'
   end,
})
