local v = require("my.utils.vimsl")
local g = vim.g

g.glow_border = "rounded"

local toggle_map = "<Space>"
local filetypes = {
  "markdown",
  "markdown.gfm",
  "markdown.pandoc",
  "glowpreview",
}

v.augroup("glow", function(au)
  au({
    "FileType",
    table.concat(filetypes, ","),
    "nnoremap",
    "<buffer>",
    "<silent>",
    toggle_map,
    "<Cmd>Glow<CR>",
  })
end)
