-- Pull in the wezterm API
local wezterm = require 'wezterm'
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()


-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'catppuccin-macchiato'
config.front_end = 'WebGpu'

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 15.0

config.window_background_opacity = 0.99

config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.9,
}

-- Show which key table is active in the status area
wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)

-- Keybindings
config.leader = { key = 'Space', mods = 'CTRL' }
config.keys = {
  {
    key = "c",
    mods = "LEADER",
    action = act.SpawnTab 'CurrentPaneDomain'
  },
  {
    key = "q",
    mods = "LEADER",
    action = act.CloseCurrentPane { confirm = true },
  },
  {
    key = "v",
    mods = "LEADER",
    action = act.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  {
    key = "s",
    mods = "LEADER",
    action = act.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    key = "z",
    mods = "LEADER",
    action = act.TogglePaneZoomState,
  },
  {
    key = "r",
    mods = "LEADER",
    action = act.RotatePanes 'Clockwise',
  },
  {
    key = "g",
    mods = "LEADER",
    action = act.SpawnCommandInNewTab {
      args = { '/opt/homebrew/bin/lazygit' }
    }
  },
  {
    key = "p",
    mods = "LEADER",
    action = workspace_switcher.switch_workspace(),
  },
  { key = "n", mods = "META", action = act.SwitchWorkspaceRelative(1) },
  { key = "p", mods = "META", action = act.SwitchWorkspaceRelative(-1) }
}


-- config.key_tables = {
--   window_management = {
--     {
--       key = "c",
--       action = act.CloseCurrentPane { confirm = true },
--     },
--     {
--       key = "v",
--       action = act.SplitHorizontal { domain = "CurrentPaneDomain" },
--     },
--     {
--       key = "s",
--       action = act.SplitVertical { domain = "CurrentPaneDomain" },
--     },
--     {
--       key = "z",
--       action = act.TogglePaneZoomState,
--     },
--     {
--       key = "r",
--       action = act.RotatePanes 'Clockwise',
--     },
--   }
-- }

config.tab_bar_at_bottom = true

-- Apply smart splits config
-- Must be just before the `return config` to work correctly
smart_splits.apply_to_config(config)


-- and finally, return the configuration to wezterm
return config
