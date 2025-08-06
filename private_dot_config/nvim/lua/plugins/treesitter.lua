-- :fennel:1733326726
local function _1_()
  local treesitter = require("nvim-treesitter.configs")
  return treesitter.setup({
    auto_install = true,
    sync_install = true,
    highlight = { enable = true },
    endwise = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "vim",
      "lua",
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
      "json",
      "bash",
      "rust",
      "elixir",
      "heex",
      "nix",
      "toml",
      "svelte",
      "go",
      "zig",
      "php",
    },
    textobjects = {
      move = {
        enable = true,
        goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
        goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[c"] = "@class.outer",
          ["[a"] = "@parameter.inner",
        },
        goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
      },
    },
  })
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = _1_,
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "jsonc",
      "typescript",
      "typescriptreact",
    },
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      enabled = true,
      max_lines = 3,
      multiline_threshold = 1,
      separator = '-',
      min_window_height = 20,
      line_numbers = true,
    },
  },
}
