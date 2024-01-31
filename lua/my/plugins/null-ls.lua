local null_ls = require 'null-ls'
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover
-- local completion = null_ls.builtins.completion
local lspconfig = require 'my.plugins.lspconfig'

local function has_executable(name)
   return function()
      return vim.fn.executable(name) > 0
   end
end

local function has_any_file(names)
   return function(utils)
      for _, name in ipairs(names) do
         if utils.root_has_file(name) then
            return true
         end
      end
      return false
   end
end

local function has_file(name_or_names)
   if type(name_or_names) == 'table' then
      return has_any_file(name_or_names)
   else
      return has_any_file { name_or_names }
   end
end

local sources = {
   -- General
   code_actions.gitsigns,

   -- Prose writing
   diagnostics.vale.with { condition = has_file '.vale.ini' },
   hover.dictionary.with { condition = has_executable 'curl' },

   -- Vim
   diagnostics.vint.with { condition = has_file { '.vintrc.yml', '.vintrc' } },

   -- Lua
   diagnostics.selene.with { condition = has_file 'selene.toml' },
   formatting.stylua.with { condition = has_file { 'stylua.toml', '.stylua.toml' } },

   -- Nix
   code_actions.statix.with { condition = has_file 'statix.toml' },
   diagnostics.statix.with { condition = has_file 'statix.toml' },
   diagnostics.deadnix.with { condition = has_executable 'deadnix' },
   formatting.nixfmt.with { condition = has_executable 'nixfmt' },
   formatting.nixpkgs_fmt.with { condition = has_executable 'nixpkgs-fmt' },

   -- Bash
   code_actions.shellcheck.with { condition = has_file '.shellcheckrc' },
   diagnostics.shellcheck.with { condition = has_file '.shellcheckrc' },
   formatting.shfmt.with { condition = has_file '.editorconfig' },

   -- Fish
   diagnostics.fish.with { condition = has_executable 'fish' },
   formatting.fish_indent.with { condition = has_executable 'fish_indent' },

   -- Python
   diagnostics.flake8.with { condition = has_file '.flake8' },
   formatting.black.with { condition = has_file 'pyproject.toml' },
   formatting.isort.with { condition = has_file { '.isort.cfg', 'pyproject.toml' } },
}

null_ls.setup {
   sources = sources,
   on_attach = lspconfig.on_attach['default'],
   on_init = lspconfig.on_init['default'],
   on_exit = lspconfig.on_exit['default'],
}
