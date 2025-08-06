-- return {
--   'sainnhe/sonokai',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Optionally configure and load the colorscheme
--     -- directly inside the plugin declaration.
--     vim.g.sonokai_style = 'atlantis'
--     vim.g.sonokai_dim_inactive_windows = 1
--     vim.g.sonokai_diagnostic_line_highlight = 1
--     vim.g.sonokai_enable_italic = true
--     vim.cmd.colorscheme('sonokai')
--   end
--
-- }

return {
  'Mofiqul/dracula.nvim',
  lazy = false,
  priorty = 1000,
  config = function()
    require("dracula").setup({ })

    vim.cmd([[colorscheme dracula]])
  end
}
