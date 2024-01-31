local builtin = require 'telescope.builtin'
local keymaps = require 'my.keymaps'
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

   local tmap = keymaps.set_telescope_keymap
   local lmap = keymaps.set_lsp_keymap
   local gmap = keymaps.set_git_keymap

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
   tmap('r', '<Cmd>Telescope registers<CR>')
   tmap('s', '<Cmd>Telescope spell_suggest<CR>')
   tmap('/', '<Cmd>Telescope current_buffer_fuzzy_find<CR>')
   tmap('e', '<Cmd>Telescope resume<CR>')
   tmap('E', '<Cmd>Telescope builtin<CR>')

   lmap('r', '<Cmd>Telescope lsp_references<CR>')
   lmap('s', '<Cmd>Telescope lsp_document_symbols<CR>') -- TODO: fall back to treesitter
   lmap('S', '<Cmd>Telescope lsp_workspace_symbols<CR>')
   -- lmap('', '<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>')
   lmap('a', '<Cmd>Telescope lsp_code_actions<CR>')
   lmap('a', ':<C-u>Telescope lsp_range_code_actions<CR>', { mode = 'x' })
   lmap('d', '<Cmd>Telescope lsp_document_diagnostics<CR>')
   lmap('D', '<Cmd>Telescope lsp_workspace_diagnostics<CR>')
   -- lmap('i', '<Cmd>Telescope lsp_implementations<CR>')
   -- lmap('', '<Cmd>Telescope lsp_definitions<CR>')
   -- lmap('t', '<Cmd>Telescope lsp_type_definitions<CR>')

   gmap('l', '<Cmd>Telescope git_commits<CR>')
   gmap('L', '<Cmd>Telescope git_bcommits<CR>')
   gmap('b', '<Cmd>Telescope git_branches<CR>')
   gmap('w', '<Cmd>Telescope git_status<CR>')
   gmap('s', '<Cmd>Telescope git_stash<CR>')

   tmap('t', '<Cmd>Telescope treesitter<CR>')
end

function M.git_files_or_find_files(opts)
   opts = opts or {}
   local ok = pcall(builtin.git_files, opts)
   if not ok then
      builtin.find_files(opts)
   end
end

return M
