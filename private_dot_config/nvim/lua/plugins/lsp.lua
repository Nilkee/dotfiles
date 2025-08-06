return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("lspconfig")

      vim.lsp.enable({
        "eslint",
        "jsonls",
        "lua_ls",
        "vtsls",
        "stylelint_lsp",
        "ansiblels",
        "bashls",
      })

      vim.lsp.config("vtsls", {
        settings = {
          complete_function_calls = true,
          vtsls = {
            enableMoveToFileCodeAction = true,
            autoUseWorkspaceTsdk = true,
            experimental = {
              maxInlayHintLength = 30,
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
        },
      })

      -- LSP Commands
      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local local_map = function(mode, lhs, rhs, opts)
            local shared_opts = { buffer = ev.buf }
            vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", shared_opts, opts or {}))
          end

          local_map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
          local_map("n", "<leader>cl", "<cmd>LspInfo<cr>", { desc = "LspInfo" })
          local_map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
          local_map("i", "<c-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
          local_map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
          local_map("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
          local_map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
        end,
      })

      -- Change text into icons in sign gutter
      local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {}
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    config = function()
      vim.diagnostic.config({ virtual_text = false })
      return require("tiny-inline-diagnostic").setup()
    end,
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  { 'dmmulroy/ts-error-translator.nvim' },
}
