require("conform").setup({
  formatters_by_ft = {
    svelte = { "prettierd", "prettier", "biome" },
    html = { "prettierd", "prettier", "biome" },
    eruby = { "prettierd", "prettier", "biome" },
    json = { "prettierd", "prettier", "biome" },
    javascript = { "prettierd", "prettier", "biome" },
    javascriptreact = { "prettierd", "prettier", "biome" },
    typescript = { "prettierd", "prettier", "biome" },
    typescriptreact = { "prettierd", "prettier", "biome" },
    astro = { "prettierd", "prettier" },
    go = { "gofmt" },
    zig = { "zigfmt" },
    ruby = { "rubocop" },
  }
})
