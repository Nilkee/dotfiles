-- For `plugins/markview.lua` users.
return {
	"OXY2DEV/markview.nvim",
  event = { "BufReadPre" },
	opts = {
		preview = {
			icon_provider = "mini", -- "mini" or "devicons"
		},
	},
}
