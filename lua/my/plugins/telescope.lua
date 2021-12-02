require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        -- ['<C-a>'] = '',
      },
    },
  },
})

do
  local map = vim.api.nvim_set_keymap

  map("", "[telescope]", "<Nop>", { noremap = true })
  map("", "<Leader>e", "[telescope]", {})

  map("n", "<Leader>E", "<Cmd>Telescope builtin<CR>", { silent = true })

  map("", "[lsp]", "<Nop>", { noremap = true })
  map("", "<Leader>l", "[lsp]", {})

  map("", "[git]", "<Nop>", { noremap = true })
  map("", "<Leader>g", "[git]", {})
end

do
  local map = require("my.utils.telescope").set_keymap
  local lmap = require("my.utils.telescope").set_lsp_keymap
  local gmap = require("my.utils.telescope").set_git_keymap

  map("F", "<Cmd>Telescope find_files<CR>")
  map("f", "<Cmd>lua require'my.utils.telescope'.git_files_or_find_files()<CR>")
  map("*", "<Cmd>Telescope grep_string<CR>")
  map("g", "<Cmd>Telescope live_grep<CR>")
  map("o", "<Cmd>Telescope file_browser sorting_strategy=ascending<CR>")

  map("b", "<Cmd>Telescope buffers<CR>")
  map("O", "<Cmd>Telescope oldfiles<CR>")
  map(":", "<Cmd>Telescope commands<CR>")
  -- map('t', '<Cmd>Telescope tags<CR>')
  map(";", "<Cmd>Telescope command_history<CR>")
  map("?", "<Cmd>Telescope search_history<CR>")
  map("h", "<Cmd>Telescope help_tags<CR>")
  map("m", "<Cmd>Telescope man_pages<CR>")
  map("M", "<Cmd>Telescope marks<CR>")
  map("q", "<Cmd>Telescope quickfix<CR>")
  map("l", "<Cmd>Telescope loclist<CR>")
  map("<C-o>", "<Cmd>Telescope jumplist<CR>")
  map("r", "<Cmd>Telescope registers<CR>")
  map("s", "<Cmd>Telescope spell_suggest<CR>")
  map("/", "<Cmd>Telescope current_buffer_fuzzy_find<CR>")
  map("e", "<Cmd>Telescope resume<CR>")

  lmap("r", "<Cmd>Telescope lsp_references<CR>")
  lmap("s", "<Cmd>Telescope lsp_document_symbols<CR>") -- TODO: fall back to treesitter
  lmap("S", "<Cmd>Telescope lsp_workspace_symbols<CR>")
  -- lmap('', '<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>')
  lmap("a", "<Cmd>Telescope lsp_code_actions<CR>")
  lmap("a", ":<C-u>Telescope lsp_range_code_actions<CR>", { mode = "x" })
  lmap("d", "<Cmd>Telescope lsp_document_diagnostics<CR>")
  lmap("D", "<Cmd>Telescope lsp_workspace_diagnostics<CR>")
  -- lmap('i', '<Cmd>Telescope lsp_implementations<CR>')
  -- lmap('', '<Cmd>Telescope lsp_definitions<CR>')
  -- lmap('t', '<Cmd>Telescope lsp_type_definitions<CR>')

  gmap("l", "<Cmd>Telescope git_commits<CR>")
  gmap("L", "<Cmd>Telescope git_bcommits<CR>")
  gmap("b", "<Cmd>Telescope git_branches<CR>")
  gmap("w", "<Cmd>Telescope git_status<CR>")
  gmap("s", "<Cmd>Telescope git_stash<CR>")

  map("t", "<Cmd>Telescope treesitter<CR>")
end
