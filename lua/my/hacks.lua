local u = require'my.utils'
local env = vim.env
local o = vim.opt

-- Hack for vim + fish problem.
env.SHELL = '/run/current-system/sw/bin/bash'
o.shell = env.SHELL

u.augroup('remember_last_cursor_position', function(au)
  au [[BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exec "normal g`\"" | endif]]
end)

-- Practical Vim, Tip 42: '%%' expands to '%:h'
vim.api.nvim_set_keymap('c', '%%', [[getcmdtype() == ':' ? expand('%:h') . '/' : '%%']],
                        {expr = true, noremap = true})

-- Practical Vim, Tip 93: Repeat the last substitution by '&'
for _, mode in ipairs({'n', 'x'}) do
  vim.api.nvim_set_keymap(mode, '&', [[:&&<CR>]], {noremap = true})
end

if vim.fn.executable('rg') == 1 then
  o.grepprg = table.concat({
    'rg',
    '--smart-case',
    '--with-filename',
    '--no-heading',
    '--vimgrep',
  }, ' ')
  o.grepformat = {
    '%f:%l:%c:%m',
    '%f',
  }
end
