require('nvim-treesitter.configs').setup({
  auto_install = true,
  sync_install = true,
  ignore_install = {},
  modules = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  endwise = { enable = true },
  indent = { enable = true },
  ensure_installed = { "vim", "lua", "javascript", "typescript", "tsx", "html", "css", "json", "bash", "rust", "elixir", "heex", "nix", "toml", "svelte", "go" }
})

-- Allows to comment JSX
require('ts_context_commentstring').setup {
  enable_autocmd = false,
}

local get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
  return option == "commentstring"
    and require("ts_context_commentstring.internal").calculate_commentstring()
    or get_option(filetype, option)
end
