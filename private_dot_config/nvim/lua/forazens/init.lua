-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("forazens.colorscheme")
require("forazens.options")
require("forazens.keybindings")
require("forazens.autocmds")

-- LSPs
require("forazens.lsp.lua")
require("forazens.lsp.typescript")
require("forazens.lsp.eslint")
require("forazens.lsp.json")
require("forazens.lsp.go")
require("forazens.lsp.ruby")
require("forazens.lsp.tailwind")
require("forazens.lsp.svelte")
require("forazens.lsp.zig")
