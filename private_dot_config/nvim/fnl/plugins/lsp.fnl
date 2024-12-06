(import-macros {: augroup! : map!} :hibiscus.vim)

;; Load keymaps when loading LSP
(local lsp-callback
       (fn [ev]
         (map! [:n :buffer] :<leader>cl :<CMD>LspInfo<CR>)))

(augroup! :UserLspConfig [[:LspAttach] * `lsp-callback])

[{1 :neovim/nvim-lspconfig
  :dependencies [:yioneko/nvim-vtsls]
  :config (fn []
            ;; Set vtls lspconfig
            (tset (require :lspconfig.configs) :vtsls
                  (. (require :vtsls) :lspconfig))
            ;; Get capabilities of blink.cmp
            (local capabilities
                   ((. (require :blink.cmp) :get_lsp_capabilities)))
            ;; Configure different LSPs
            ((. (require :lspconfig) :vtsls :setup) {: capabilities})
            ((. (require :lspconfig) :eslint :setup) {: capabilities})
            ((. (require :lspconfig) :gopls :setup) {: capabilities})
            ((. (require :lspconfig) :jsonls :setup) {: capabilities})
            ((. (require :lspconfig) :lua_ls :setup) {: capabilities})
            ((. (require :lspconfig) :ruby_lsp :setup) {: capabilities
                                                        :filetypes [:ruby
                                                                    :eruby]})
            ((. (require :lspconfig) :tailwindcss :setup) {: capabilities}))}
 {1 :j-hui/fidget.nvim :opts {}}
 {1 :rachartier/tiny-inline-diagnostic.nvim
  :event :VeryLazy
  :priority 1000
  :config (fn []
            (vim.diagnostic.config {:virtual_text false})
            ((. (require :tiny-inline-diagnostic) :setup)))}]
