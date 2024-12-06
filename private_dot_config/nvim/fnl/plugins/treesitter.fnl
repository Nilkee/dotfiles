{1 :nvim-treesitter/nvim-treesitter
 :dependencies [:RRethy/nvim-treesitter-endwise]
 :event :VeryLazy
 :config (fn []
           (local treesitter (require :nvim-treesitter.configs))
           (treesitter.setup {:auto_install true
                              :sync_install true
                              :highlight {:enable true}
                              :endwise {:enable true}
                              :indent {:enable true}
                              :ensure_installed [:vim
                                                 :lua
                                                 :javascript
                                                 :typescript
                                                 :tsx
                                                 :html
                                                 :css
                                                 :json
                                                 :bash
                                                 :rust
                                                 :elixir
                                                 :heex
                                                 :nix
                                                 :toml
                                                 :svelte
                                                 :go
                                                 :zig
                                                 :fennel]}))}
