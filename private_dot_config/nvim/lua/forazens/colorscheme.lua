require("catppuccin").setup({
  flavour = "macchiato",
  dim_inactive = {
    enabled = true,
    shade = "light",
    percentage = 0.30
  },
  default_integrations = false,
  integrations = {
    cmp = true,
    fidget = false,
    gitsigns = true,
    grug_far = true,
    harpoon = true,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
        ok = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
    nvim_surround = true,
    treesitter = true,
    treesitter_context = true,
    telescope = true,
    which_key = true
  }

})
vim.cmd.colorscheme "catppuccin-macchiato"
