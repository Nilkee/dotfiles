(import-macros {: map!} :hibiscus.vim)

(map! [:n] :<leader>cf
      (fn []
        ((. (require :conform) :format))))

{1 :stevearc/conform.nvim
 :opts {:formatters_by_ft {:fennel [:fnlfmt]
                           :html [:prettierd :prettier]
                           :eruby [:prettierd :prettier]
                           :ruby [:rubocop]
                           :json [:prettierd :prettier]
                           :javascript [:prettierd :prettier]
                           :javascriptreact [:prettierd :prettier]
                           :typescript [:prettierd :prettier]
                           :typescriptreact [:prettierd :prettier]}}}
