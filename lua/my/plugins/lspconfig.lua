local v = require("my.utils.vimsl")
local lspconfig = require("lspconfig")

local bare_keymaps = {
   { "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>" },
   { "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>" },
   { "gt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>" }, -- I don't use tabs
   { "K", "<Cmd>lua vim.lsp.buf.hover()<CR>" },
   { "D", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" },

   { "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>" },
   { "gr", "<Cmd>lua vim.lsp.buf.rename()<CR>" },
   { "ga", "<Cmd>lua vim.lsp.buf.code_action()<CR>" },
   { "ga", ":<C-u>lua vim.lsp.buf.range_code_action()<CR>", { mode = "x" } },

   { "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>" },
   { "]d", "<Cmd>lua vim.diagnostic.goto_next()<CR>" },
}

local workspace_keymaps = {
   { "a", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>" },
   { "r", "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>" },
   { "w", "<Cmd>lua vim.lsp.buf.list_workspace_folders()<CR>" },
}

local lsp_keymaps = {
   { "f", "<Cmd>lua vim.lsp.buf.formatting()<CR>" },
}

local function on_attach(client, buf)
   vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
   vim.api.nvim_buf_set_option(buf, "formatexpr", "v:lua.vim.lsp.formatexpr()")

   local keymaps = require("my.keymaps")

   for _, keymap in ipairs(bare_keymaps) do
      keymaps.buf_set_keymap(buf, unpack(keymap))
   end

   for _, keymap in ipairs(workspace_keymaps) do
      keymaps.buf_set_workspace_keymap(buf, unpack(keymap))
   end

   for _, keymap in ipairs(lsp_keymaps) do
      keymaps.buf_set_lsp_keymap(buf, unpack(keymap))
   end

   -- NOTE: Highlight document only if available; see
   -- https://github.com/jose-elias-alvarez/null-ls.nvim/discussions/355#discussioncomment-1651619
   if client.resolved_capabilities.document_highlight then
      v.augroup("lsp_document_highlight", function(au)
         au([[CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
         au([[CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
      end)
   else
      v.augroup("lsp_document_highlight", function(_) end)
   end
end

local servers = {
   ["null-ls"] = false,
   bashls = "bash-language-server",
   vimls = "vim-language-server",
   pyright = "pyright",
   dockerls = "docker-langserver",
}
for server, cmd in pairs(servers) do
   if server == "null-ls" or vim.fn.executable(cmd) > 0 then
      lspconfig[server].setup({ on_attach = on_attach })
   end
end
