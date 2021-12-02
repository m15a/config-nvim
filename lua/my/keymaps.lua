local M = {}

M.leader_prefixes = {
  ["[telescope]"] = "e",
  ["[lsp]"] = "l",
  ["[workspace]"] = "w",
  ["[git]"] = "g",
}

function M.setup()
  local g = vim.g
  g.mapleader = ";"
  g.maplocalleader = ","

  local map = vim.api.nvim_set_keymap
  for prefix, key in pairs(M.leader_prefixes) do
    map("", prefix, "<Nop>", { noremap = true })
    map("", "<Leader>" .. key, prefix, {})
  end
end

local function set_keymap_by(mapper, key, cmd, opts, default_opts)
  opts = opts or {}
  default_opts = default_opts or {}

  local mode
  if opts.mode then
    mode = opts.mode
    opts.mode = nil
  else
    mode = "n"
  end

  if not next(opts) then
    opts = default_opts
  end

  mapper(mode, key, cmd, opts)
end

function M.set_keymap(key, cmd, opts)
  set_keymap_by(vim.api.nvim_set_keymap, key, cmd, opts, { noremap = true, silent = true })
end

function M.buf_set_keymap(buf, key, cmd, opts)
  local function mapper(...)
    vim.api.nvim_buf_set_keymap(buf, ...)
  end
  set_keymap_by(mapper, key, cmd, opts, { noremap = true, silent = true })
end

local function set_prefixed_keymap(prefix, key, cmd, opts)
  set_keymap_by(vim.api.nvim_set_keymap, prefix .. key, cmd, opts, { silent = true })
end

local function buf_set_prefixed_keymap(buf, prefix, key, cmd, opts)
  local function mapper(...)
    vim.api.nvim_buf_set_keymap(buf, ...)
  end
  set_keymap_by(mapper, prefix .. key, cmd, opts, { silent = true })
end

function M.set_telescope_keymap(key, cmd, opts)
  set_prefixed_keymap("[telescope]", key, cmd, opts)
end

function M.buf_set_telescope_keymap(buf, key, cmd, opts)
  buf_set_prefixed_keymap(buf, "[telescope]", key, cmd, opts)
end

function M.set_lsp_keymap(key, cmd, opts)
  set_prefixed_keymap("[lsp]", key, cmd, opts)
end

function M.buf_set_lsp_keymap(buf, key, cmd, opts)
  buf_set_prefixed_keymap(buf, "[lsp]", key, cmd, opts)
end

function M.set_workspace_keymap(key, cmd, opts)
  set_prefixed_keymap("[workspace]", key, cmd, opts)
end

function M.buf_set_workspace_keymap(buf, key, cmd, opts)
  buf_set_prefixed_keymap(buf, "[workspace]", key, cmd, opts)
end

function M.set_git_keymap(key, cmd, opts)
  set_prefixed_keymap("[git]", key, cmd, opts)
end

function M.buf_set_git_keymap(buf, key, cmd, opts)
  buf_set_prefixed_keymap(buf, "[git]", key, cmd, opts)
end

return M
