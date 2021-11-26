local g = vim.g

-- Use vim-surround keymaps to resolve conflicts with lightspeed.nvim
vim.cmd [[runtime macros/sandwich/keymap/surround.vim]]

g['sandwich#recipes'] = (function()
  local recipes = g['sandwich#recipes']
  local extra_recipes = {
    { buns = {'( ', ' )'}, input = {'('} },
    { buns = {'[ ', ' ]'}, input = {'['} },
    { buns = {'{ ', ' }'}, input = {'{'} },
  }
  local options = {
    nesting = true,
    match_syntax = true,
    kind = {'add', 'replace'},
    action = {'add'},
  }
  for _, recipe in ipairs(extra_recipes) do
    for k, v in pairs(options) do recipe[k] = v end
    table.insert(recipes, recipe)
  end
  extra_recipes = {
    { buns = {'(\\s*', '\\s*)'}, input = {'('} },
    { buns = {'\\[\\s*', '\\s*\\]'}, input = {'['} },
    { buns = {'{\\s*', '\\s*}'}, input = {'{'} },
  }
  options = {
    nesting = true,
    match_syntax = true,
    regex = true,
    kind = {'delete', 'replace', 'textobj'},
    action = {'delete'},
  }
  for _, recipe in ipairs(extra_recipes) do
    for k, v in pairs(options) do recipe[k] = v end
    table.insert(recipes, recipe)
  end
  return recipes
end)()
