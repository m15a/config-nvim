local lspactions = require 'lspactions'

vim.ui.select = lspactions.select
vim.ui.input = lspactions.input

local handlers = vim.lsp.handlers
handlers['textDocument/codeAction'] = lspactions.codeaction
handlers['textDocument/references'] = lspactions.references
handlers['textDocument/definition'] = lspactions.definition
handlers['textDocument/declaration'] = lspactions.declaration
handlers['textDocument/implementation'] = lspactions.implementation
