local g = vim.g

require'lightspeed'.setup {
  exit_after_idle_msecs = {
    unlabeled = 1000,
    labeled = nil,
  },
}
g.mapleader = ';'
g.maplocalleader = ','
