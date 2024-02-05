local null_ls = require 'null-ls'
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover
-- local completion = null_ls.builtins.completion
local u = require 'my.plugins.null-ls.utils'

local sources = {
   -- General
   code_actions.gitsigns,

   -- Prose writing
   diagnostics.vale.with { condition = u.has_file '.vale.ini' },
   hover.dictionary.with { condition = u.has_exec 'curl' },

   -- Markdown
   diagnostics.markdownlint.with { condition = u.has_exec 'markdownlint' },
   formatting.markdownlint.with { condition = u.has_exec 'markdownlint' },

   -- Vim
   diagnostics.vint.with { condition = u.has_file { '.vintrc.yml', '.vintrc' } },

   -- Lua
   diagnostics.selene.with { condition = u.has_file 'selene.toml' },
   formatting.stylua.with { condition = u.has_file { 'stylua.toml', '.stylua.toml' } },

   -- Nix
   code_actions.statix.with { condition = u.has_file 'statix.toml' },
   diagnostics.statix.with { condition = u.has_file 'statix.toml' },
   diagnostics.deadnix.with { condition = u.has_exec 'deadnix' },
   formatting.nixfmt.with { condition = u.has_exec 'nixfmt' },
   formatting.nixpkgs_fmt.with { condition = u.has_exec 'nixpkgs-fmt' },

   -- Bash
   code_actions.shellcheck.with { condition = u.has_file '.shellcheckrc' },
   diagnostics.shellcheck.with { condition = u.has_file '.shellcheckrc' },
   formatting.shfmt.with { condition = u.has_file '.editorconfig' },

   -- Fish
   diagnostics.fish.with { condition = u.has_exec 'fish' },
   formatting.fish_indent.with { condition = u.has_exec 'fish_indent' },

   -- Python
   diagnostics.flake8.with { condition = u.has_file '.flake8' },
   formatting.black.with { condition = u.has_file 'pyproject.toml' },
   formatting.isort.with { condition = u.has_file { '.isort.cfg', 'pyproject.toml' } },
}

local common_lsp = require 'my.plugins.lspconfig.common'
null_ls.setup(vim.tbl_extend('force', common_lsp.config, { sources = sources }))
