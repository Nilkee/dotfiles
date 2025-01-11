-- Remove hiding qoutes in json files
vim.api.nvim_create_augroup("JsonQuotes", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "JsonQuotes",
  pattern = { "json", "jsonc" },
  callback = function()
    vim.opt.conceallevel = 0
  end
})

-- Clear jumplist on nvim start
vim.cmd "autocmd VimEnter * :clearjumps"
