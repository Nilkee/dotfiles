local harpoon = require("harpoon")

harpoon:setup({
  settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
  },
  yeet = {
    select = function(list_item, _, _)
      require("yeet").execute(list_item.value)
    end,
  },
})

vim.keymap.set("n", "<leader><BS>",
  function() harpoon.ui:toggle_quick_menu(harpoon:list("yeet")) end
)

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { noremap = true })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { noremap = true })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { noremap = true })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { noremap = true })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
