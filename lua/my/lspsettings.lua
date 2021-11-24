local u = require'my.utils'
local lsp = require'lspconfig'

-- null-ls.nvim
require'null-ls'.config {
  sources = {
    require'null-ls'.builtins.diagnostics.luacheck,
    -- TODO: add more sources
  }
}

local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

  local keymaps = {
    -- {'n', '', '<Cmd>lua vim.lsp.buf.declaration()<CR>'},
    {'n', '<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>'},
    {'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>'},
    {'n', '<LocalLeader>s', '<Cmd>lua vim.lsp.buf.signature_help()<CR>'},
    {'n', '<LocalLeader>t', '<Cmd>lua vim.lsp.buf.type_definition()<CR>'},

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
    u.augroup('lsp_document_highlight', function(au)
      au [[CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
      au [[CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
    end)
  end

  -- nvim-lsputils
  vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
  vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
  vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
  vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
  vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
  vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
  vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
  vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

  -- lspkind-nvim
  require'lspkind'.init {
  }
end

local servers = {
  'bashls',
  'dockerls',
  'pyright',
  'rust_analyzer',
  'vimls',
  'null-ls',
}

for _, server in ipairs(servers) do
  lsp[server].setup { on_attach = on_attach }
end
