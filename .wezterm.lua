-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices    

config.enable_tab_bar = false
config.window_background_opacity = 0.7
config.window_decorations = "RESIZE"

config.font =
  wezterm.font('JetBrains Mono')

config.keys = {
  {
    key = 'n',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}

-- For example, changing the color scheme:
config.color_scheme = 'Gruvbox Dark (Gogh)'
-- and finally, return the configuration to wezterm
return config
