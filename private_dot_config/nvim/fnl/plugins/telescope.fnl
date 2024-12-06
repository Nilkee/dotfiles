(import-macros {: map!} :hibiscus.vim)

(map! [n] :<leader><leader> "<CMD>Telescope find_files workspace=CWD<CR>")
(map! [n] :<leader>fg "<CMD>Telescope live_grep<CR>")
(map! [n] :<leader>fb "<CMD>Telescope buffers<CR>")

{1 :nvim-telescope/telescope.nvim
 :tag :0.1.8
 :dependencies [{1 :nvim-telescope/telescope-fzf-native.nvim :build :make}]
 :config (fn []
           ((. (require :telescope) :setup) {:extensions {:fzf {:fuzzy true
                                                                :override_generic_sorter true
                                                                :case_mode :smart_case}}})
           ((. (require :telescope) :load_extension) :fzf))}
