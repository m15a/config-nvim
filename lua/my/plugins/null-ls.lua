local nullls = require'null-ls'

nullls.config {
  sources = {
    nullls.builtins.diagnostics.luacheck,
    -- TODO: add more sources
  },
}
