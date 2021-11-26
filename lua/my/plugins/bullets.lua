local g = vim.g
local v = require'my.utils.vimsl'

g.bullets_enabled_file_types = {
  'markdown',
  'gitcommit',
  'text',
}
g.bullets_set_mappings = false
g.bullets_outline_levels = {
  'ROM',
  'ABC',
  'num',
  'abc',
  'rom',
  'std*',
  'std+',
  'std-',
}
g.bullets_checkbox_markers = ' x'

-- See `s:add_local_mapping()` in
-- https://github.com/dkarter/bullets.vim/blob/master/plugin/bullets.vim
-- TODO: lazy evaluation of this function with g:bullets_*
local function set_keymap(mapping_type, mapping, action)
  local cmd = {
    'FileType',
    table.concat(g.bullets_enabled_file_types, ','),
    mapping_type,
    '<silent>',
    '<buffer>',
    mapping,
    action,
  }
  return table.concat(cmd, ' ')
end

-- See `augroup TextBulletsMappings` in
-- https://github.com/dkarter/bullets.vim/blob/master/plugin/bullets.vim
v.augroup('bullets', function(au)
  au(set_keymap('inoremap', '<CR>', '<Cmd>InsertNewBullet<CR>'))
  au(set_keymap('nnoremap', 'o', '<Cmd>InsertNewBullet<CR>'))
  -- au(set_keymap('inoremap', '<C-CR>', '<CR>'))  -- FIXME: it does not work. <C-j> works though.

  au(set_keymap('vnoremap', 'gN', '<Cmd>RenumberSelection<CR>'))
  au(set_keymap('nnoremap', 'gN', '<Cmd>RenumberList<CR>'))

  au(set_keymap('nnoremap', '<LocalLeader>x', '<Cmd>ToggleCheckbox<CR>'))

  au(set_keymap('inoremap', '<Tab>', '<Cmd>BulletDemote<CR><C-o>A'))
  au(set_keymap('inoremap', '<S-Tab>', '<Cmd>BulletPromote<CR><C-o>A'))
  au(set_keymap('nnoremap', '>>', '<Cmd>BulletDemote<CR>'))
  au(set_keymap('nnoremap', '<<', '<Cmd>BulletPromote<CR>'))
  au(set_keymap('vnoremap', '>', '<Cmd>BulletDemoteVisual<CR>'))
  au(set_keymap('vnoremap', '<', '<Cmd>BulletPromoteVisual<CR>'))
end)
