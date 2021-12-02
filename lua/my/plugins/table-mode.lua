local g = vim.g

-- g.table_mode_corner_corner = '+'
-- g.table_mode_header_fillchar = '='

-- TODO: Translate it into Lua.
vim.cmd([[
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
      \ <SID>isAtStartOfLine('\|\|') ?
      \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
      \ <SID>isAtStartOfLine('__') ?
      \ '<c-o>:silent! TableModeDisable<cr>' : '__'
]])

g.table_mode_map_prefix = "<Leader>t"
g.table_mode_toggle_map = "t"
g.table_mode_relign_map = g.table_mode_map_prefix .. "r"
g.table_mode_delete_row_map = g.table_mode_map_prefix .. "d"
g.table_mode_delete_column_map = g.table_mode_map_prefix .. "D"
g.table_mode_insert_column_after_map = g.table_mode_map_prefix .. "a"
g.table_mode_insert_column_before_map = g.table_mode_map_prefix .. "A"
g.table_mode_add_formula_map = g.table_mode_map_prefix .. "f"
g.table_mode_eval_expr_map = g.table_mode_map_prefix .. "e"
g.table_mode_sort_map = g.table_mode_map_prefix .. "s"
g.table_mode_tableize_map = g.table_mode_map_prefix .. "m"
g.table_mode_tableize_op_map = g.table_mode_map_prefix .. "M"
