require("blink.cmp").setup({
  sources = {
    { "blink.cmp.sources.lsp",      name = "LSP",     score_offset = 1 },
    { "blink.cmp.sources.snippets", name = "Snippets", score_offset = -1, keyword_length = 1 },
    { "blink.cmp.sources.path",     name = "Path",    score_offset = 3,   opts = { get_cwd = vim.uv.cwd } },
    { "blink.cmp.sources.buffer",   name = "buffer",  keyword_length = 3, score_offset = -3 }
  },
  trigger = {
    completion = {}
  },
  highlight = {
    use_nvim_cmp_as_default = true,
  },
  nerd_font_variant = "mono",
  windows = {
    documentation = {
      min_width = 15,
      max_width = 50,
      max_height = 15,
      border = vim.g.borderStyle,
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },
  kind_icons = {
    Text = "",
    Method = "󰊕",
    Function = "󰊕",
    Constructor = "",
    Field = "󰇽",
    Variable = "󰂡",
    Class = "⬟",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "󰒕",
    Color = "󰏘",
    Reference = "",
    File = "󰉋",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰅲",
  }
})
