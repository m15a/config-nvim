require('autoclose').setup {
   -- Leave Lispy languages to parinfer.
   disabled_filetypes = {
      'lisp',
      'scheme',
      'clojure',
      'fennel',
   },
}
