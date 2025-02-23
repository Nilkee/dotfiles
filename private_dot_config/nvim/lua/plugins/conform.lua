local function select_formatting_frontend()
	local prettier_configs = {
		".prettierrc",
		".prettierrc.json",
		".prettierrc.js",
		".prettierrc.yml",
		".prettierrc.yaml",
		"prettier.config.js",
		".prettier.config.js",
	}

	local eslint_configs = {
		"eslint.config.js",
		"eslint.config.mjs",
		"eslint.config.cjs",
		"eslint.config.ts",
		".eslintrc",
		".eslintrc.js",
		".eslintrc.json",
		".eslintrc.yml",
		".eslintrc.yaml",
	}

	local function file_exists(name)
		local f = io.open(name, "r")
		if f ~= nil then
			io.close(f)
			return true
		end
		return false
	end

	local cwd = vim.fn.getcwd()

	-- Check for prettier configs in current directory
	for _, config in ipairs(prettier_configs) do
		if file_exists(cwd .. "/" .. config) then
			return { "prettier" }
		end
	end

	-- Check for eslint configs in current directory
	for _, config in ipairs(eslint_configs) do
		if file_exists(cwd .. "/" .. config) then
			return { "eslint_d" }
		end
	end

	return {}
end

local function _1_()
	return require("conform").format()
end
vim.keymap.set({ "n" }, "<leader>cf", _1_, { silent = true, desc = "Format code" })
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
			html = select_formatting_frontend,
			css = { "stylelint" },
			scss = { "stylelint" },
			eruby = { "prettierd", "prettier", "eslint_d" },
			ruby = { "rubocop" },
			json = { "prettierd", "prettier" },
			javascript = select_formatting_frontend,
			javascriptreact = select_formatting_frontend,
			typescript = select_formatting_frontend,
			typescriptreact = select_formatting_frontend,
			lua = { "stylua" },
			php = { "pretty-php" },
		},
	},
	keys = {},
}
