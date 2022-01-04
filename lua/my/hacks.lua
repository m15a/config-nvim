local env = vim.env
local o = vim.opt

-- Hack for vim + fish problem.
if os.getenv('SHELL'):match '/fish$' then
   env.SHELL = vim.fn.system { 'which', 'bash' }
   o.shell = env.SHELL
end

-- Practical Vim, Tip 42: '%%' expands to '%:h'
vim.api.nvim_set_keymap(
   'c',
   '%%',
   [[getcmdtype() == ':' ? expand('%:h') . '/' : '%%']],
   { expr = true, noremap = true }
)

-- Practical Vim, Tip 93: Repeat the last substitution by '&'
for _, mode in ipairs { 'n', 'x' } do
   vim.api.nvim_set_keymap(mode, '&', [[:&&<CR>]], { noremap = true })
end

if vim.fn.executable 'rg' == 1 then
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

-- Update timestamp automatically
-- See https://vim.fandom.com/wiki/Insert_current_date_or_time
-- TODO: translate it into lua
vim.cmd [[
fun! UpdateTimestamp(format)
  if !&modified | return | endif
  let l:pos = getpos('.')
  let l:n = min([10, line('$')])
  let l:date = strftime(a:format)
  if match(getline(1, l:n), l:date) > -1 | return | endif
  let l:cmd = '1,' . l:n . 's#\v\c(Last %(Change|Modified): ).*#\1' . l:date . '#e'
  keepj exec l:cmd
  call histdel('search', -1)
  call setpos('.', l:pos)
endfun
augroup update_timestamp
  autocmd!
  au BufWritePre * call UpdateTimestamp('%Y-%m-%d')
augroup END
]]
