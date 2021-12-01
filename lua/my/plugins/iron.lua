local iron = require'iron'

iron.core.set_config {
  repl_open_cmd = 'top 10 split',
  preferred = {
    bash=  'bash',
    fish = 'fish',
    python = 'python',
  },
}

iron.core.add_repl_definitions {
  bash = {
    bash = {
      command = {'bash', '-i'},
    },
  },
  fish = {
    fish = {
      command = {'fish', '--interactive', '--private'},
    },
  },
}

-- TODO: These maps should be buffer local after launching iron repl.
vim.cmd [[
noremap [iron] <Nop>
map <Leader>s [iron]

nmap <silent> [iron]s :Iron<CR>
vmap <silent> [iron]s :Iron<CR>
nmap          [iron]S :Iron! 
vmap          [iron]S :Iron! 
nmap <silent> [iron]r     <Plug>(iron-restart)
nmap <silent> [iron]<CR>  <Plug>(iron-cr)
nmap <silent> [iron]c     <Plug>(iron-interrupt)
nmap <silent> [iron]<C-l> <Plug>(iron-clear)
nmap <silent> [iron]q     <Plug>(iron-exit)
nmap <silent> [iron]l     <Plug>(iron-send-line)
nmap <silent> [iron].     <Plug>(iron-repeat-cmd)

nmap [iron]w <Cmd>call iron#WatchCurrentFile()<CR> 
nmap [iron]u <Cmd>call iron#UnwatchCurrentFile()<CR>

nmap <silent> gs <Plug>(iron-send-motion)
vmap <silent> gs <Plug>(iron-visual-send)
nmap <silent> gl <Plug>(iron-send-lines)
]]
