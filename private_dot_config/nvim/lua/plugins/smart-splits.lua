vim.keymap.set({ "n" }, "<A-h>", "<CMD>SmartResizeLeft<CR>", { silent = true })
vim.keymap.set({ "n" }, "<A-j>", "<CMD>SmartResizeDown<CR>", { silent = true })
vim.keymap.set({ "n" }, "<A-k>", "<CMD>SmartResizeUp<CR>", { silent = true })
vim.keymap.set({ "n" }, "<A-l>", "<CMD>SmartResizeRight<CR>", { silent = true })
vim.keymap.set({ "n" }, "<C-h>", "<CMD>SmartCursorMoveLeft<CR>", { silent = true })
vim.keymap.set({ "n" }, "<C-j>", "<CMD>SmartCursorMoveDown<CR>", { silent = true })
vim.keymap.set({ "n" }, "<C-k>", "<CMD>SmartCursorMoveUp<CR>", { silent = true })
vim.keymap.set({ "n" }, "<C-l>", "<CMD>SmartCursorMoveRight<CR>", { silent = true })
return { "mrjones2014/smart-splits.nvim" }
