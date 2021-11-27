local M = {}

function M.set_keymap(key, cmd, mode, opts)
  mode = mode or 'n'
  opts = opts or {silent = true}
  vim.api.nvim_set_keymap(mode, '[telescope]' .. key, cmd, opts)
end

return M
