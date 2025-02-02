return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "yioneko/nvim-vtsls" },
		config = function()
			require("lspconfig.configs")["vtsls"] = require("vtsls").lspconfig
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			require("lspconfig").vtsls.setup({ capabilities = capabilities })
			require("lspconfig").eslint.setup({ capabilities = capabilities })
			require("lspconfig").gopls.setup({ capabilities = capabilities })
			require("lspconfig").jsonls.setup({ capabilities = capabilities })
			require("lspconfig").lua_ls.setup({ capabilities = capabilities })
			require("lspconfig").ruby_lsp.setup({ capabilities = capabilities, filetypes = { "ruby", "eruby" } })
			require("lspconfig").tailwindcss.setup({ capabilities = capabilities })
			require("lspconfig").phpactor.setup({
				capabilities = capabilities,
				init_options = {
					["language_server_phpstan.enabled"] = false,
					["language_server_psalm.enabled"] = false,
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
					local_map("n", "<leader>ci", "<cmd>Telescope import<cr>", { desc = "LspInfo" })
					local_map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Goto Definition" })
					local_map("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "References" })
					local_map("n", "gI", "<cmd>Telescope lsp_implementations<CR>", { desc = "Goto Implementation" })
					local_map("n", "gy", "<cmd>Telescope lsp_typedefs<CR>", { desc = "Goto T[y]pe Definition" })
					local_map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
					local_map("i", "<c-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
					local_map("n", "<leader>cf", function()
						require("conform").format({ timeout_ms = 3000, lsp_fallback = true })
					end, { desc = "Format Document" })
					local_map("v", "<leader>cf", function()
						require("conform").format({ timeout_ms = 3000, lsp_fallback = true })
					end, { desc = "Format Range" })
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
	{ "j-hui/fidget.nvim", opts = {} },
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			vim.diagnostic.config({ virtual_text = false })
			return require("tiny-inline-diagnostic").setup()
		end,
	},
}
