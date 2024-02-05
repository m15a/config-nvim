require('gitsigns').setup {
   signs = {
      add = { hl = 'GitGutterAdd' },
      change = { hl = 'GitGutterChange' },
      delete = { hl = 'GitGutterDelete' },
      topdelete = { hl = 'GitGutterDelete' },
      changedelete = { hl = 'GitGutterChangeDelete' },
   },

   on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
         opts = opts or {}
         opts.buffer = bufnr
         vim.keymap.set(mode, l, r, opts)
      end

      local function hunk_prev()
         if vim.wo.diff then
            return '[c'
         end
         vim.schedule(function()
            gs.prev_hunk()
         end)
         return '<Ignore>'
      end
      local function hunk_next()
         if vim.wo.diff then
            return ']c'
         end
         vim.schedule(function()
            gs.next_hunk()
         end)
         return '<Ignore>'
      end
      local function hunk_stage_region()
         gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end
      local function hunk_reset_region()
         gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end
      local function hunk_blame()
         gs.blame_line { full = true }
      end
      local function hunk_diff_tilde()
         gs.diffthis '~'
      end
      map('n', '[c', hunk_prev, { expr = true })
      map('n', ']c', hunk_next, { expr = true })
      map('n', '<leader>hs', gs.stage_hunk)
      map('v', '<leader>hs', hunk_stage_region)
      map('n', '<leader>hS', gs.stage_buffer)
      map('n', '<leader>hr', gs.reset_hunk)
      map('v', '<leader>hr', hunk_reset_region)
      map('n', '<leader>hR', gs.reset_buffer)
      map('n', '<leader>hu', gs.undo_stage_hunk)
      map('n', '<leader>hp', gs.preview_hunk)
      map('n', '<leader>hB', hunk_blame)
      map('n', '<leader>hb', gs.toggle_current_line_blame)
      map('n', '<leader>hd', gs.diffthis)
      map('n', '<leader>hD', hunk_diff_tilde)
      -- map('n', '<leader>hD', gs.toggle_deleted)
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
   end,
}
