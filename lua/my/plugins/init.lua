local namespace = ...

local function require_(basename)
  require(namespace .. "." .. basename)
end

require_("paq")

require_("lightspeed")
require_("lsputils")
require_("lspkind")
require_("null-ls")
require_("lspconfig")
require_("treesitter")
require_("sandwich")
require_("telescope")
require_("telescope-symbols")
require_("srcery")
require_("web-devicons")
require_("feline")
require_("gitsigns")
require_("bullets")
require_("glow")
require_("gfm-syntax")
require_("pandoc-syntax")
require_("table-mode")
require_("telescope-heading")
require_("telescope-bibtex")
require_("iron")
