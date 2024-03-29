local builtin = require 'telescope.builtin'
local keymap = require 'my.keymap'
local assets = require 'my.assets'

local M = {}

function M.setup()
   require('telescope').setup {
      defaults = {
         borderchars = {
            assets.border_chars.north,
            assets.border_chars.east,
            assets.border_chars.south,
            assets.border_chars.west,
            assets.border_chars.northwest,
            assets.border_chars.northeast,
            assets.border_chars.southeast,
            assets.border_chars.southwest,
         },
         mappings = {
            i = {
               -- ['<C-a>'] = '',
            },
         },
      },
   }

   local tmap = keymap.set_telescope
   local gmap = keymap.set_git

   tmap('F', '<Cmd>Telescope find_files<CR>')
   tmap('f', "<Cmd>lua require'my.plugins.telescope'.git_files_or_find_files()<CR>")
   tmap('*', '<Cmd>Telescope grep_string<CR>')
   tmap('g', '<Cmd>Telescope live_grep<CR>')
   tmap('o', '<Cmd>Telescope file_browser sorting_strategy=ascending<CR>')

   tmap('b', '<Cmd>Telescope buffers<CR>')
   tmap('O', '<Cmd>Telescope oldfiles<CR>')
   tmap(':', '<Cmd>Telescope commands<CR>')
   -- tmap('t', '<Cmd>Telescope tags<CR>')
   tmap(';', '<Cmd>Telescope command_history<CR>')
   tmap('?', '<Cmd>Telescope search_history<CR>')
   tmap('h', '<Cmd>Telescope help_tags<CR>')
   tmap('M', '<Cmd>Telescope man_pages<CR>')
   tmap('m', '<Cmd>Telescope marks<CR>')
   tmap('q', '<Cmd>Telescope quickfix<CR>')
   tmap('l', '<Cmd>Telescope loclist<CR>')
   tmap('<C-o>', '<Cmd>Telescope jumplist<CR>')
   tmap('"', '<Cmd>Telescope registers<CR>')
   tmap('s', '<Cmd>Telescope spell_suggest<CR>')
   tmap('/', '<Cmd>Telescope current_buffer_fuzzy_find<CR>')
   tmap('e', '<Cmd>Telescope resume<CR>')
   tmap('B', '<Cmd>Telescope builtin<CR>')
   tmap('t', '<Cmd>Telescope treesitter<CR>')

   gmap('l', '<Cmd>Telescope git_commits<CR>')
   gmap('L', '<Cmd>Telescope git_bcommits<CR>')
   gmap('b', '<Cmd>Telescope git_branches<CR>')
   gmap('w', '<Cmd>Telescope git_status<CR>')
   gmap('s', '<Cmd>Telescope git_stash<CR>')
end

function M.git_files_or_find_files(opts)
   opts = opts or {}
   local ok = pcall(builtin.git_files, opts)
   if not ok then
      builtin.find_files(opts)
   end
end

return M
