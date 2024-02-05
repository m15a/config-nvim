local namespace = ...

local lspconfig = require 'lspconfig'
local assets = require 'my.assets'
local common = require 'my.plugins.lspconfig.common'

local M = {}

local function require_server_config(server)
   local server_config = require(namespace .. '.' .. server)
   return vim.tbl_deep_extend('force', common.config, server_config)
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

         local opts = { buffer = buf }
         local function diagnostic_goto_prev()
            vim.diagnostic.goto_prev { float = { border = common.border } }
         end
         local function diagnostic_goto_next()
            vim.diagnostic.goto_next { float = { border = common.border } }
         end
         local function format()
            vim.lsp.buf.format { async = true }
         end
         local map = vim.keymap.set
         map('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', opts)
         map('n', 'gD', '<Cmd>Telescope lsp_type_definitions<CR>', opts)
         map('n', 'gx', '<Cmd>Telescope lsp_implementations<CR>', opts)
         map('n', 'gr', vim.lsp.buf.rename, opts)
         map({ 'n', 'v' }, 'ga', vim.lsp.buf.code_action, opts)
         map('n', 'K', vim.lsp.buf.hover, opts)
         map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
         map('n', '[d', diagnostic_goto_prev, opts)
         map('n', ']d', diagnostic_goto_next, opts)
         local lmap = require('my.keymap').set_lsp
         lmap('d', '<Cmd>Telescope diagnostics<CR>', opts)
         lmap('r', '<Cmd>Telescope lsp_references<CR>', opts)
         lmap('i', '<Cmd>Telescope lsp_incoming_calls<CR>', opts)
         lmap('o', '<Cmd>Telescope lsp_outgoing_calls<CR>', opts)
         lmap('s', '<Cmd>Telescope lsp_document_symbols<CR>', opts)
         lmap('S', '<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>', opts)
         map({ 'n', 'v' }, '[lsp]=', format, opts)
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
