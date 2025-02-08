return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		spec = {
			{ "<leader>b", group = "[B]uffers" },
			{ "<leader>c", group = "[C]ode", mode = { "n", "x" } },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>f", group = "[F]iles" },
			-- { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
			-- { "<leader>r", group = "[R]ename" },
			{ "<leader>s", group = "[S]earch" },
			-- { "<leader>w", group = "[W]orkspace" },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>u", group = "[U]I Toggles" },
			{ "<leader>x", group = "Trouble" },
			{ "<leader>y", group = "[Y]ank" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
