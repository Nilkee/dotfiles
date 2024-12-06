(import-macros {: map!} :hibiscus.vim)

;; Kakoune-like line movement keybindings
(map! [n] :gl "$")
(map! [n] :gh :0)

;; Clear search with <esc>
(map! [ni :silent] :<esc> :<CMD>noh<cr><esc>)
