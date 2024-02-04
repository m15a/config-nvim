local ds = require('my.assets').diagnostic_signs

require('pqf').setup {
   signs = {
      error = ds.Error,
      warning = ds.Warn,
      info = ds.Info,
      hint = ds.Hint,
   },
}
