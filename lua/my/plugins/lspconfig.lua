local v = require'my.utils.vimsl'
local lspconfig = require'lspconfig'

local keymaps = {
  -- {'n', '', '<Cmd>lua vim.lsp.buf.declaration()<CR>'},
  {'n', '<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>'},
  {'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>'},
  {'n', '<LocalLeader>ss', '<Cmd>lua vim.lsp.buf.signature_help()<CR>'},
  {'n', '<LocalLeader>st', '<Cmd>lua vim.lsp.buf.type_definition()<CR>'},

  {'n', 'gr', '<Cmd>lua vim.lsp.buf.rename()<CR>'},
  {'n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>'},
  {'x', 'ga', ':<C-u>lua vim.lsp.buf.range_code_action()<CR>'},

  {'n', '<LocalLeader>er', '<Cmd>lua vim.lsp.buf.references()<CR>'},
  {'n', '<LocalLeader>ei', '<Cmd>lua vim.lsp.buf.implementation()<CR>'},
  {'n', '<LocalLeader>es', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>'},
  {'n', '<LocalLeader>ew', '<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>'},
  {'n', '<LocalLeader>ec', '<Cmd>lua vim.lsp.buf.incoming_calls()<CR>'},
  {'n', '<LocalLeader>eC', '<Cmd>lua vim.lsp.buf.outgoing_calls()<CR>'},

  {'n', '[d',              '<Cmd>lua vim.diagnostic.goto_prev()<CR>'},
  {'n', ']d',              '<Cmd>lua vim.diagnostic.goto_next()<CR>'},
  {'n', '<LocalLeader>ed', '<Cmd>lua vim.diagnostic.open_float()<CR>'},

  {'n', '<LocalLeader>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'},
  {'n', '<LocalLeader>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'},
  {'n', '<LocalLeader>ww', '<Cmd>lua vim.lsp.buf.list_workspace_folders()<CR>'},
}
for _, keymap in ipairs(keymaps) do
  table.insert(keymap, {noremap = true, silent = true})
end

local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

  for _, keymap in ipairs(keymaps) do
    vim.api.nvim_buf_set_keymap(bufnr, unpack(keymap))
  end

  --[[
  TODO: Usage of `vim.lsp.buf.document_highlight()` requires the following highlight groups to be
  defined or you won't be able to see the actual highlights:
    * `LspReferenceText`
    * `LspReferenceRead`
    * `LspReferenceWrite`
  ]]
  -- NOTE: Highlight document only if available; see
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/discussions/355#discussioncomment-1651619
  if client.resolved_capabilities.document_highlight then
    v.augroup('lsp_document_highlight', function(au)
      au [[CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
      au [[CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
    end)
  else
    v.augroup('lsp_document_highlight', function(_) end)
  end
end

local servers = {
  ['null-ls'] = false,
  bashls = 'bash-language-server',
  vimls = 'vim-language-server',
  pyright = 'pyright',
  dockerls = 'docker-langserver',
}
for server, cmd in pairs(servers) do
  if server == 'null-ls' or vim.fn.executable(cmd) > 0 then
    lspconfig[server].setup { on_attach = on_attach }
  end
end
