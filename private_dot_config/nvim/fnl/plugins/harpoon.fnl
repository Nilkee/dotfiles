(import-macros {: map!} :hibiscus.vim)

{1 :ThePrimeagen/harpoon
 :branch :harpoon2
 :dependencies [:nvim-lua/plenary.nvim]
 :config (fn []
           (local harpoon (require :harpoon))
           (harpoon.setup {:settings {:save_on_toggle true
                                      :sync_on_ui_close true}})
           (map! [n] :<leader>a (fn [] (: (harpoon:list) :add)))
           (map! [n] :<C-e>
                 (fn []
                   (harpoon.ui:toggle_quick_menu (harpoon:list))))
           (map! [n] :<leader>1
                 (fn []
                   (: (harpoon:list) :select 1)))
           (map! [n] :<leader>2
                 (fn []
                   (: (harpoon:list) :select 2)))
           (map! [n] :<leader>3
                 (fn []
                   (: (harpoon:list) :select 3)))
           (map! [n] :<leader>4
                 (fn []
                   (: (harpoon:list) :select 4))))}
