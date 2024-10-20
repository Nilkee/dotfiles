local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Search word under cursor
map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- open filetree
map("n", "<leader>e", "<CMD>Oil<CR>",
  { desc = "File tree", silent = true })
map("n", "<leader>E", ":lua MiniFiles.open()<cr>", { desc = "File tree", silent = true })

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })


-- Oopen quickfix and localfix list
map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- Quickfix list navigation
map("n", "<C-n>", "<cmd>cnext<CR>zz")
map("n", "<C-p>", "<cmd>cprev<CR>zz")
map("n", "<leader>n", "<cmd>lnext<CR>zz")
map("n", "<leader>p", "<cmd>lprev<CR>zz")

-- Kakoune-like keybindings
map("n", "gl", "$")
map("n", "gh", "0")

-- Map jk to exit insert mode
map("i", "jk", "<esc>")

-- remap Ctrl-C to ESC, as C-c by default does not trigger InsertLeave
map("i", "<C-c>", "<esc>", { remap = true })

-- Windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- Window Movements
vim.keymap.set("n", "<A-h>", function() require("smart-splits").resize_left() end, { desc = "Resize left" })
vim.keymap.set("n", "<A-j>", function() require("smart-splits").resize_down() end, { desc = "Resize down" })
vim.keymap.set("n", "<A-k>", function() require("smart-splits").resize_up() end, { desc = "Resize up" })
vim.keymap.set("n", "<A-l>", function() require("smart-splits").resize_right() end, { desc = "Resize right" })
-- moving between splits
vim.keymap.set("n", "<C-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Move left" })
vim.keymap.set("n", "<C-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Move down" })
vim.keymap.set("n", "<C-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Move up" })
vim.keymap.set("n", "<C-l>", function() require("smart-splits").move_cursor_right() end, { desc = "Move right" })

map("n", "<leader><leader>", "<cmd>Telescope find_files workspace=CWD<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")

-- #####################
-- Substitute plugin
-- #####################
map("n", "s", function() require('substitute').operator() end, { noremap = true })
map("n", "ss", function() require('substitute').line() end, { noremap = true })
map("n", "S", function() require('substitute').eol() end, { noremap = true })
map("x", "s", function() require('substitute').visual() end, { noremap = true })

-- Substitute over range motion
map("n", "<leader>s", function() require('substitute.range').operator() end, { noremap = true })
map("x", "<leader>s", function() require('substitute.range').visual() end, { noremap = true })
map("n", "<leader>ss", function() require('substitute.range').word() end, { noremap = true })

--  Exchange operator
map("n", "sx", function() require('substitute.exchange').operator() end, { noremap = true })
map("n", "sxx", function() require('substitute.exchange').line() end, { noremap = true })
map("x", "X", function() require('substitute.exchange').visual() end, { noremap = true })
map("n", "sxc", function() require('substitute.exchange').cancel() end, { noremap = true })

-- ################
-- Yeet.nvim
-- ################
map("n", "<leader>yt", function() require("yeet").select_target() end, { desc = "Select yeet target" })
map("n", "\\\\", function() require("yeet").execute() end, { desc = "Yeet" })
map("n", "<leader>yo", function() require("yeet").toggle_post_write() end, { desc = "Toggle yeet after write" })

-- NoNeckPain
map("n", "<leader>z", "<CMD>:NoNeckPain<CR>", { desc = "No neck pain mode" })

-- Grug-far
map("n", "<leader>sr", function() require("grug-far").open({ transient = true }) end, { desc = "Search & replace" })
map("n", "<leader>sR",
  function() require("grug-far").open({ transient = true, prefills = { paths = vim.fn.expand("%") } }) end,
  { desc = "Search & replace current file" })
map("v", "<leader>sr", function() require("grug-far").with_visual_selection({ transient = true }) end,
  { desc = "Search & replace" })
map("v", "<leader>sR",
  function() require("grug-far").with_visual_selection({ transient = true, prefills = { paths = vim.fn.expand("%") } }) end,
  { desc = "Search & replace current file" })
