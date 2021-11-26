local ca = require'lsputil.codeAction'
local loc = require'lsputil.locations'
local sym = require'lsputil.symbols'
local handlers = vim.lsp.handlers

handlers['textDocument/codeAction'] = ca.code_action_handler
handlers['textDocument/references'] = loc.references_handler
handlers['textDocument/definition'] = loc.definition_handler
handlers['textDocument/declaration'] = loc.declaration_handler
handlers['textDocument/typeDefinition'] = loc.typeDefinition_handler
handlers['textDocument/implementation'] = loc.implementation_handler
handlers['textDocument/documentSymbol'] = sym.document_handler
handlers['workspace/symbol'] = sym.workspace_handler
