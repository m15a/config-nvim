local lspconfig = require 'lspconfig'
local diagnostic_symbols = require('my.assets').diagnostic_symbols

local M = {}

-- Set floating window borders:
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#borders
local border = {
   { '┌', 'FloatBorder' },
   { '─', 'FloatBorder' },
   { '┐', 'FloatBorder' },
   { '│', 'FloatBorder' },
   { '┘', 'FloatBorder' },
   { '─', 'FloatBorder' },
   { '└', 'FloatBorder' },
   { '│', 'FloatBorder' },
}

vim.api.nvim_create_autocmd('LspAttach', {
   callback = function(args)
      local buf = args.buf

      local keymap_opts = { buffer = buf }
      local function diagnostic_goto_prev()
         vim.diagnostic.goto_prev { float = { border = border } }
      end
      local function diagnostic_goto_next()
         vim.diagnostic.goto_next { float = { border = border } }
      end
      local function diagnostic_show_all_in_buffer()
         vim.diagnostic.open_float { scope = 'buffer', border = border }
      end
      local function list_workspace_folders()
         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end
      local function format()
         vim.lsp.buf.format { async = true }
      end
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, keymap_opts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, keymap_opts)
      vim.keymap.set('n', 'g<C-i>', vim.lsp.buf.implementation, keymap_opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.rename, keymap_opts)
      vim.keymap.set({ 'n', 'v' }, 'ga', vim.lsp.buf.code_action, keymap_opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, keymap_opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, keymap_opts)
      vim.keymap.set('n', '[d', diagnostic_goto_prev, keymap_opts)
      vim.keymap.set('n', ']d', diagnostic_goto_next, keymap_opts)
      vim.keymap.set('n', '[lsp]d', diagnostic_show_all_in_buffer, keymap_opts)
      vim.keymap.set('n', '[lsp]r', vim.lsp.buf.references, keymap_opts)
      vim.keymap.set('n', '[lsp]i', vim.lsp.buf.incoming_calls, keymap_opts)
      vim.keymap.set('n', '[lsp]o', vim.lsp.buf.outgoing_calls, keymap_opts)
      vim.keymap.set('n', '[lsp]s', vim.lsp.buf.document_symbol, keymap_opts)
      vim.keymap.set('n', '[workspace]s', vim.lsp.buf.workspace_symbol, keymap_opts)
      vim.keymap.set('n', '[workspace]a', vim.lsp.buf.add_workspace_folder, keymap_opts)
      vim.keymap.set(
         'n',
         '[workspace]d',
         vim.lsp.buf.remove_workspace_folder,
         keymap_opts
      )
      vim.keymap.set('n', '[workspace]w', list_workspace_folders, keymap_opts)
      vim.keymap.set({ 'n', 'v' }, '[lsp]=', format, keymap_opts)
   end,
})

local servers = {
   bashls = 'bash-language-server',
   vimls = 'vim-language-server',
   lua_ls = 'lua-language-server',
}

local handlers = {}
setmetatable(handlers, {
   __index = function()
      local h = vim.lsp.handlers
      local opts = { border = border }
      return {
         ['textDocument/hover'] = vim.lsp.with(h.hover, opts),
         ['textDocument/signatureHelp'] = vim.lsp.with(h.signature_help, opts),
      }
   end,
})

local on_attach = {}
setmetatable(on_attach, {
   __index = function()
      return function(client, bufnr)
         -- NOTE: Highlight document only if available
         -- https://github.com/jose-elias-alvarez/null-ls.nvim/discussions/355#discussioncomment-1651619
         -- Also note that `resolved_capabilities` has been renamed to `server_capabilities`.
         if client.server_capabilities.document_highlight then
            local group =
               vim.api.nvim_create_augroup('lsp_doc_highlight', { clear = true })
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
   end,
})

local on_init = {}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
function on_init.lua_ls(client)
   local path = client.workspace_folders[1].name
   if
      not vim.loop.fs_stat(path .. '/.luarc.json')
      and not vim.loop.fs_stat(path .. '/.luarc.jsonc')
   then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
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
end

function M.setup()
   -- Change diagnostic symbols in the gutter:
   -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#change-diagnostic-symbols-in-the-sign-column-gutter
   for type, text in pairs(diagnostic_symbols) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = text, texthl = hl, numhl = hl })
   end
   for server, cmd in pairs(servers) do
      if vim.fn.executable(cmd) > 0 then
         lspconfig[server].setup {
            handlers = handlers[server],
            on_attach = on_attach[server],
            on_init = on_init[server],
         }
      end
   end
end

return M
