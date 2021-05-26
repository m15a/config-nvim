local lsp = require'lspconfig'

local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- TODO: Customize key maps for my taste.
  local maps = {
    {'n', 'gD',              '<Cmd>lua vim.lsp.buf.declaration()<CR>'},
    {'n', 'gd',              '<Cmd>lua vim.lsp.buf.definition()<CR>'},
    {'n', 'K',               '<Cmd>lua vim.lsp.buf.hover()<CR>'},
    {'n', 'gi',              '<Cmd>lua vim.lsp.buf.implementation()<CR>'},
    {'n', '<C-k>',           '<Cmd>lua vim.lsp.buf.signature_help()<CR>'},
    {'n', '<LocalLeader>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'},
    {'n', '<LocalLeader>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'},
    {'n', '<LocalLeader>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>'},
    {'n', '<LocalLeader>D',  '<Cmd>lua vim.lsp.buf.type_definition()<CR>'},
    {'n', '<LocalLeader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>'},
    {'n', '<LocalLeader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>'},
    {'n', 'gr',              '<Cmd>lua vim.lsp.buf.references()<CR>'},
    {'n', '<LocalLeader>e',  '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>'},
    {'n', '[d',              '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'},
    {'n', ']d',              '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>'},
    {'n', '<LocalLeader>q',  '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>'},
    {'n', '<LocalLeader>s',  '<Cmd>lua vim.lsp.buf.formatting()<CR>'},
  }
  for _, map in ipairs(maps) do
    table.insert(map, {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, unpack(map))
  end
end

local servers = {
  'pyright',
}

for _, server in ipairs(servers) do
  lsp[server].setup { on_attach = on_attach }
end
