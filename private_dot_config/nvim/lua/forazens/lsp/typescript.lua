-- require("lspconfig").tsserver.setup({
--   on_attach = function(client, _)
--     client.server_capabilities.documentFormattingProvider = false
--   end
-- })
--


-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig.configs").vtsls = require("vtsls").lspconfig
require("lspconfig").vtsls.setup({
  -- capabilities = capabilities
})
