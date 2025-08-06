local opt = vim.opt

opt.autowrite = true          -- Enable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.conceallevel = 3          -- Hide * markup for bold and italic
opt.confirm = true            -- Confirm to save changes before exiting modified buffer
opt.cursorline = true         -- Enable highlighting of the current line
opt.expandtab = true          -- Use spaces instead of tabs
opt.ignorecase = true         -- Ignore case
opt.inccommand = "split"    -- preview incremental substitute
opt.laststatus = 3
opt.list = false              -- Show some invisible characters (tabs...
opt.mouse = "a"               -- Enable mouse mode
opt.number = true             -- Print line number
opt.pumblend = 10             -- Popup blend
opt.pumheight = 10            -- Maximum number of entries in a popup
opt.relativenumber = true     -- Relative line numbers
opt.scrolloff = 4             -- Lines of context
opt.shiftround = true         -- Round indent
opt.shiftwidth = 2            -- Size of an indent
opt.showmode = false          -- Dont show mode since we have a statusline
opt.sidescrolloff = 8         -- Columns of context
opt.signcolumn = "yes"        -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true          -- Don't ignore case with capitals
opt.smartindent = true        -- Insert indents automatically
opt.cindent = true
opt.spelllang = { "en" }
opt.splitbelow = true         -- Put new windows below current
opt.splitright = true         -- Put new windows right of current
opt.tabstop = 2               -- Number of spaces tabs count for
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200               -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width
opt.wrap = false                   -- Disable line wrap


vim.filetype.add({
  extension = {
    njk = "html"
  }
})
