local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font_size = 11.0
config.color_scheme = "Tokyo Night"
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.inactive_pane_hsb = {
  saturation = 1,
  brightness = 1,
}

--config.keys = {
--  key = 't',
--  mods = 'CRTL|SHIFT',
--  action = wezterm.action.SplitHorizontal
--}


return config
 
