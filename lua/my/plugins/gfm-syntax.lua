local g = vim.g
local v = require("my.utils.vimsl")

g.gfm_syntax_enable_always = false
g.gfm_syntax_enable_filetypes = {
  "markdown.gfm",
}
v.augroup("gfm_syntax", function(au)
  au([[BufNewFile,BufRead README.md setl filetype=markdown.gfm]])
end)
