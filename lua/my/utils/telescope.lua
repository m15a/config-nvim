local builtin = require'telescope.builtin'

local M = {}

local function set_keymap(prefix, key, cmd, opts)
  opts = opts or {silent = true}
  local mode
  if opts.mode then
    mode = opts.mode
    opts.mode = nil
  else
    mode = 'n'
  end
  vim.api.nvim_set_keymap(mode, prefix .. key, cmd, opts)
end

function M.set_keymap(key, cmd, opts)
  set_keymap('[telescope]', key, cmd, opts)
end

function M.set_lsp_keymap(key, cmd, opts)
  set_keymap('[lsp]', key, cmd, opts)
end

function M.set_git_keymap(key, cmd, opts)
  set_keymap('[git]', key, cmd, opts)
end

function M.git_files_or_find_files(opts)
  opts = opts or {}
  local ok = pcall(builtin.git_files, opts)
  if not ok then
    builtin.find_files(opts)
  end
end

return M
