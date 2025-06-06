return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	config = function()
		require("barbecue").setup({
			theme = "catppuccin-macchiato",
			create_autocmd = false, -- prevent barbecue from updating itself automatically
			attach_navic = false,
			show_dirname = true,
			show_modified = true,
		})
		vim.api.nvim_create_autocmd({
			"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
			"BufWinEnter",
			"CursorHold",
			"InsertLeave",
			-- include this if you have set `show_modified` to `true`
			"BufModifiedSet",
		}, {
			group = vim.api.nvim_create_augroup("barbecue.updater", {}),
			callback = function()
				require("barbecue.ui").update()
			end,
		})
	end,
}
