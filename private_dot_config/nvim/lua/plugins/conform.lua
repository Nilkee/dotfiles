local function _1_()
	return require("conform").format()
end
vim.keymap.set({ "n" }, "<leader>cf", _1_, { silent = true })
return {
	"stevearc/conform.nvim",
	opts = {
		default_format_opts = {
			timeout_ms = 3000,
			async = false, -- not recommended to change
			quiet = false, -- not recommended to change
			lsp_format = "fallback", -- not recommended to change
		},
		formatters_by_ft = {
			fennel = { "fnlfmt" },
			html = { "prettierd", "prettier" },
			eruby = { "prettierd", "prettier" },
			ruby = { "rubocop" },
			json = { "prettierd", "prettier" },
			javascript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			lua = { "stylua" },
		},
	},
}
