require('glow').setup {
   border = 'rounded',
}

local filetypes = {
   'markdown',
   'markdown.gfm',
   'markdown.pandoc',
   'glowpreview',
}

local group = vim.api.nvim_create_augroup('glow', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
   group = group,
   pattern = filetypes,
   callback = function()
      vim.keymap.set('n', '<LocalLeader>g', '<Cmd>Glow<CR>', { buffer = true })
   end,
})
