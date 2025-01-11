vim.keymap.set({ "n" }, "<leader><leader>", "<CMD>Telescope find_files workspace=CWD<CR>", { silent = true })
vim.keymap.set({ "n" }, "<leader>fg", "<CMD>Telescope live_grep<CR>", { silent = true })
vim.keymap.set({ "n" }, "<leader>fb", "<CMD>Telescope buffers<CR>", { silent = true })
vim.keymap.set({ "n" }, "<leader>gs", "<CMD>Telescope git_status<CR>", { silent = true })
vim.keymap.set({ "n" }, "<leader>gb", "<CMD>Telescope git_branches<CR>", { silent = true })
local function _1_()
	require("telescope").setup({
		extensions = { fzf = { fuzzy = true, override_generic_sorter = true, case_mode = "smart_case" } },
	})
	return require("telescope").load_extension("fzf")
end
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
	config = _1_,
}
