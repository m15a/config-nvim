local null_ls = require 'null-ls'

local function has_executable(name)
   return function()
      return vim.fn.executable(name) > 0
   end
end

local function has_file(name)
   return function(utils)
      return utils.root_has_file(name)
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

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.config {
   sources = {
      -- General
      code_actions.gitsigns,

      -- Vim
      diagnostics.vint.with { condition = has_any_file { '.vintrc.yml', '.vintrc' } },

      -- Lua
      diagnostics.selene.with { condition = has_file 'selene.toml' },
      formatting.stylua.with { condition = has_any_file { 'stylua.toml', '.stylua.toml' } },

      -- Nix
      -- code_actions.statix.with({ condition = has_file("statix.toml") }),
      -- formatting.nixfmt.with({ condition = has_executable("nixfmt") }),

      -- Bash
      diagnostics.shellcheck.with { condition = has_file '.shellcheckrc' },
      -- formatting.shfmt.with({ condition = has_file(".editorconfig") }),

      -- Fish
      formatting.fish_indent.with { condition = has_executable 'fish_indent' },

      -- Python
      diagnostics.flake8.with { condition = has_file 'pyproject.toml' },
      formatting.black.with { condition = has_file 'pyproject.toml' },
      formatting.isort.with { condition = has_file 'pyproject.toml' },
   },
}
