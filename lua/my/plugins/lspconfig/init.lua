local namespace = ...
local lspconfig = require 'lspconfig'
local assets = require 'my.assets'

local M = {}

-- Set floating window borders:
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#borders
local border = (function()
   local bchar = assets.border_chars
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

M.default_server_config = {}

M.default_server_config.handlers = (function()
   local h = vim.lsp.handlers
   local opts = { border = border }
   return {
      ['textDocument/hover'] = vim.lsp.with(h.hover, opts),
      ['textDocument/signatureHelp'] = vim.lsp.with(h.signature_help, opts),
   }
end)()

function M.default_server_config.on_attach(client, bufnr)
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

local function require_server_config(server)
   local server_config = require(namespace .. '.' .. server)
   return vim.tbl_deep_extend('force', M.default_server_config, server_config)
end

local function setup_servers()
   local servers = {
      bashls = 'bash-language-server',
      vimls = 'vim-language-server',
      lua_ls = 'lua-language-server',
      purescriptls = 'purescript-language-server',
   }
   for server, cmd in pairs(servers) do
      if vim.fn.executable(cmd) > 0 then
         lspconfig[server].setup(require_server_config(server))
      end
   end
end

local function setup_keymaps()
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
         vim.keymap.set(
            'n',
            '[workspace]a',
            vim.lsp.buf.add_workspace_folder,
            keymap_opts
         )
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
end

local function setup_diagnostic_signs()
   -- Change diagnostic signs in the gutter:
   -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#change-diagnostic-symbols-in-the-sign-column-gutter
   for type, text in pairs(assets.diagnostic_signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = text, texthl = hl, numhl = hl })
   end
end

function M.setup()
   setup_servers()
   setup_keymaps()
   setup_diagnostic_signs()
end

return M
