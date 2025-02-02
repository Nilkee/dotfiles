local header =
	"____________/\\\\\\_________________________________        \n __________/\\\\\\\\\\_________________________________       \n  ________/\\\\\\/\\\\\\_________________________________      \n   ______/\\\\\\/\\/\\\\\\_____/\\\\\\\\\\\\\\\\\\_____/\\\\\\\\\\\\\\\\\\\\\\_     \n    ____/\\\\\\/__\\/\\\\\\____\\////////\\\\\\___\\///////\\\\\\/__    \n     __/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\___/\\\\\\\\\\\\\\\\\\\\_______/\\\\\\/____   \n      _\\///////////\\\\\\//___/\\\\\\/////\\\\\\_____/\\\\\\/______  \n       ___________\\/\\\\\\____\\//\\\\\\\\\\\\\\\\/\\\\__/\\\\\\\\\\\\\\\\\\\\\\_ \n        ___________\\///______\\////////\\//__\\///////////__"
return {
	"folke/snacks.nvim",
	priority = 1000,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			preset = {
				header = header,
				keys = {
					{
						action = ":lua Snacks.dashboard.pick('files')",
						desc = "Find File",
						icon = "\239\128\130 ",
						key = "f",
					},
					{ action = ":ene | startinsert", desc = "New File", icon = "\239\133\155 ", key = "n" },
					{
						action = ":lua Snacks.dashboard.pick('live_grep')",
						desc = "Find Text",
						icon = "\239\128\162 ",
						key = "g",
					},
					{
						action = ":lua Snacks.dashboard.pick('oldfiles')",
						desc = "Recent Files",
						icon = "\239\131\133 ",
						key = "r",
					},
					{
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
						desc = "Config",
						icon = "\239\144\163 ",
						key = "c",
					},
					{
						action = ":Lazy",
						desc = "Lazy",
						enabled = (package.loaded.lazy ~= nil),
						icon = "\243\176\146\178 ",
						key = "L",
					},
					{ action = ":qa", desc = "Quit", icon = "\239\144\166 ", key = "q" },
				},
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup", padding = 1 },
				-- { section = "terminal", cmd = "pokemon-colorscripts -r --no-title; sleep .1", random = 10, height = 30 },
			},
		},
	},
	lazy = false,
}
