(import-macros {: exec! : set!} :hibiscus.vim)

{1 :nyoom-engineering/oxocarbon.nvim
 :lazy false
 :priority 1000
 :config (fn [] (exec! [colorscheme oxocarbon]) (set! background :dark))}
