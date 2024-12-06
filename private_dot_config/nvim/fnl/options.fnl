(import-macros {: set! : g!} :hibiscus.vim)

(g! mapleader " ")
(g! maplocalleader " ")

;; Indentation
(set! expandtab)
(set! shiftwidth 2)
(set! tabstop 2)
(set! smartindent)

;; Line numbers
(set! number)
(set! relativenumber)
(set! numberwidth 3)
(set! wrap false)
(set! signcolumn :yes)
(set! cursorline)

;; Undofile
(set! undofile)
(set! undolevels 10000)

;; Mouse
(set! mouse :a)

;; Clipboard
(set! clipboard :unnamedplus)

;; Others
(set! sidescrolloff 8)

;; Window splits
(set! splitbelow true)
(set! splitright true)
