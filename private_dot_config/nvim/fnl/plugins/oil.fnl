(import-macros {: map!} :hibiscus.vim)

(map! [n] "-" :<CMD>Oil<CR>)

{1 :stevearc/oil.nvim
 :opts {:watch_for_changes true}
 :dependencies [:echasnovski/mini.nvim]}
