-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").ruby_lsp.setup({

  filetypes = { "ruby", "eruby" }
})
