local M = {}

-- Set floating window borders:
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#borders
M.border = (function()
   local bchar = require('my.assets').border_chars
   local hl = 'FloatBorder'
   return {
      { bchar.northwest, hl },
      { bchar.north, hl },
      { bchar.northeast, hl },
      { bchar.east, hl },
      { bchar.southeast, hl },
      { bchar.south, hl },
      { bchar.southwest, hl },
      { bchar.west, hl },
   }
end)()

M.config = {}

M.config.handlers = (function()
   local h = vim.lsp.handlers
   local opts = { border = M.border }
   return {
      ['textDocument/hover'] = vim.lsp.with(h.hover, opts),
      ['textDocument/signatureHelp'] = vim.lsp.with(h.signature_help, opts),
   }
end)()

function M.config.on_attach(client, bufnr)
   -- NOTE: Highlight document only if available
   -- https://github.com/jose-elias-alvarez/null-ls.nvim/discussions/355#discussioncomment-1651619
   -- Also note that `resolved_capabilities` has been renamed to `server_capabilities`.
   if client.server_capabilities.document_highlight then
      local group = vim.api.nvim_create_augroup('lsp_doc_highlight', { clear = true })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
         group = group,
         buffer = bufnr,
         callback = function()
            vim.lsp.buf.document_highlight()
         end,
      })
      vim.api.nvim_create_autocmd('CursorMoved', {
         group = group,
         buffer = bufnr,
         callback = function()
            vim.lsp.buf.clear_references()
         end,
      })
   end
end

return M
