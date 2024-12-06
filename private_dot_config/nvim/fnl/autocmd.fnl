(import-macros {: augroup!} :hibiscus.vim)

(augroup! :clear-jumplist-on-start [[VimEnter] * ":clearjumps"])

(augroup! :highlight-yank
          [[TextYankPost :desc "highlights yanked region."]
           *
           #(vim.highlight.on_yank {:timeout 80})])
