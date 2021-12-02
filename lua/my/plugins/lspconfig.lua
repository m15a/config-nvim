local v = require("my.utils.vimsl")
local lspconfig = require("lspconfig")

local keymaps = {
  { "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>" },
  { "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>" },
  { "n", "gt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>" }, -- I don't use tabs
  { "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>" },
  { "n", "D", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" },

  { "n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>" },
  { "n", "gr", "<Cmd>lua vim.lsp.buf.rename()<CR>" },
  { "n", "ga", "<Cmd>lua vim.lsp.buf.code_action()<CR>" },
  { "x", "ga", ":<C-u>lua vim.lsp.buf.range_code_action()<CR>" },

  { "n", "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>" },
  { "n", "]d", "<Cmd>lua vim.diagnostic.goto_next()<CR>" },
}
for _, keymap in ipairs(keymaps) do
  table.insert(keymap, { noremap = true, silent = true })
end

local workspace_keymaps = {
  { "n", "[workspace]a", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>" },
  { "n", "[workspace]r", "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>" },
  { "n", "[workspace]w", "<Cmd>lua vim.lsp.buf.list_workspace_folders()<CR>" },
}
for _, keymap in ipairs(workspace_keymaps) do
  table.insert(keymap, { silent = true })
end

local lsp_keymaps = {
  { "n", "[lsp]f", "<Cmd>lua vim.lsp.buf.formatting()<CR>" },
}
for _, keymap in ipairs(lsp_keymaps) do
  table.insert(keymap, { silent = true })
end

local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  for _, keymap in ipairs(keymaps) do
    vim.api.nvim_buf_set_keymap(bufnr, unpack(keymap))
  end

  vim.api.nvim_buf_set_keymap(bufnr, "", "[workspace]", "<Nop>", { noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, "", "<LocalLeader>w", "[workspace]", {})
  for _, keymap in ipairs(workspace_keymaps) do
    vim.api.nvim_buf_set_keymap(bufnr, unpack(keymap))
  end

  -- The prefix [lsp] is defined in my.plugins.telescope
  for _, keymap in ipairs(lsp_keymaps) do
    vim.api.nvim_buf_set_keymap(bufnr, unpack(keymap))
  end

  -- NOTE: Highlight document only if available; see
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/discussions/355#discussioncomment-1651619
  if client.resolved_capabilities.document_highlight then
    v.augroup("lsp_document_highlight", function(au)
      au([[CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
      au([[CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
    end)
  else
    v.augroup("lsp_document_highlight", function(_) end)
  end
end

local servers = {
  ["null-ls"] = false,
  bashls = "bash-language-server",
  vimls = "vim-language-server",
  pyright = "pyright",
  dockerls = "docker-langserver",
}
for server, cmd in pairs(servers) do
  if server == "null-ls" or vim.fn.executable(cmd) > 0 then
    lspconfig[server].setup({ on_attach = on_attach })
  end
end
