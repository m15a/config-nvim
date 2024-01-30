local v = require 'my.utils.vimsl'
local lspconfig = require 'lspconfig'

-- Change diagnostic symbols in the gutter.
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#change-diagnostic-symbols-in-the-sign-column-gutter
local diagnostic_signs = {
   Error = ' ',
   Warn = ' ',
   Hint = ' ',
   Info = ' ',
}

-- Set floating window borders.
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#borders
local float_border = {
   { '╭', 'FloatBorder' },
   { '─', 'FloatBorder' },
   { '╮', 'FloatBorder' },
   { '│', 'FloatBorder' },
   { '╯', 'FloatBorder' },
   { '─', 'FloatBorder' },
   { '╰', 'FloatBorder' },
   { '│', 'FloatBorder' },
}

local M = {}

function M.rename()
   vim.lsp.buf.rename()
end

function M.code_action()
   vim.lsp.buf.code_action()
end

function M.range_code_action()
   vim.lsp.buf.range_code_action()
end

M.diagnostic = {}

function M.diagnostic.show_line_diagnostics()
   vim.diagnostic.open_float(0, { scope = 'line', border = float_border })
end

function M.diagnostic.goto_prev()
   vim.diagnostic.goto_prev { float = { border = float_border } }
end

function M.diagnostic.goto_next()
   vim.diagnostic.goto_next { float = { border = float_border } }
end

local bare_keymaps = {
   { 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>' },
   { 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>' },
   -- { "gt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>" }, -- I don't use tabs
   { 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>' },
   {
      'D',
      "<Cmd>lua require'my.plugins.lspconfig'.diagnostic.show_line_diagnostics()<CR>",
   },

   { '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>' },
   { 'gr', "<Cmd>lua require'my.plugins.lspconfig'.rename()<CR>" },
   { 'ga', "<Cmd>lua require'my.plugins.lspconfig'.code_action()<CR>" },
   {
      'ga',
      ":<C-u>lua require'my.plugins.lspconfig'.range_code_action()<CR>",
      { mode = 'x' },
   },

   { '[d', "<Cmd>lua require'my.plugins.lspconfig'.diagnostic.goto_prev()<CR>" },
   { ']d', "<Cmd>lua require'my.plugins.lspconfig'.diagnostic.goto_next()<CR>" },
}

local workspace_keymaps = {
   { 'a', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>' },
   { 'r', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>' },
   { 'w', '<Cmd>lua vim.lsp.buf.list_workspace_folders()<CR>' },
}

local lsp_keymaps = {
   { 'f', '<Cmd>lua vim.lsp.buf.formatting()<CR>' },
}

function M.on_attach(client, buf)
   vim.api.nvim_buf_set_option(buf, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
   vim.api.nvim_buf_set_option(buf, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

   local keymaps = require 'my.keymaps'

   for _, keymap in ipairs(bare_keymaps) do
      keymaps.buf_set_keymap(buf, unpack(keymap))
   end

   for _, keymap in ipairs(workspace_keymaps) do
      keymaps.buf_set_workspace_keymap(buf, unpack(keymap))
   end

   for _, keymap in ipairs(lsp_keymaps) do
      keymaps.buf_set_lsp_keymap(buf, unpack(keymap))
   end

   -- NOTE: Highlight document only if available
   -- https://github.com/jose-elias-alvarez/null-ls.nvim/discussions/355#discussioncomment-1651619
   -- Also note that `resolved_capabilities` has been renamed to `server_capabilities`.
   if client.server_capabilities.document_highlight then
      v.augroup('lsp_document_highlight', function(au)
         au [[CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
         au [[CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
      end)
   else
      v.augroup('lsp_document_highlight', function(_) end)
   end
end

local servers = {
   bashls = 'bash-language-server',
   vimls = 'vim-language-server',
   pyright = 'pyright',
   dockerls = 'docker-langserver',
}

function M.setup()
   for type, sign in pairs(diagnostic_signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = sign, texthl = hl, numhl = hl })
   end

   local handlers = vim.lsp.handlers
   handlers['textDocument/hover'] =
      vim.lsp.with(handlers.hover, { border = float_border })
   handlers['textDocument/signatureHelp'] =
      vim.lsp.with(handlers.signature_help, { border = float_border })

   for server, cmd in pairs(servers) do
      if vim.fn.executable(cmd) > 0 then
         lspconfig[server].setup { on_attach = M.on_attach }
      end
   end

   -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
   if vim.fn.executable 'lua-language-server' > 0 then
      lspconfig.lua_ls.setup {
         on_attach = M.on_attach,
         on_init = function(client)
            local path = client.workspace_folders[1].name
            if
               not vim.loop.fs_stat(path .. '/.luarc.json')
               and not vim.loop.fs_stat(path .. '/.luarc.jsonc')
            then
               client.config.settings =
                  vim.tbl_deep_extend('force', client.config.settings, {
                     Lua = {
                        runtime = {
                           version = 'LuaJIT',
                        },
                        workspace = {
                           checkThirdParty = false,
                           library = {
                              vim.env.VIMRUNTIME,
                           },
                        },
                     },
                  })
               client.notify(
                  'workspace/didChangeConfiguration',
                  { settings = client.config.settings }
               )
            end
            return true
         end,
      }
   end
end

return M
