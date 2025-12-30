local wezterm = require("wezterm")
local config = wezterm.config_builder()

local keys = require("keys")
local theme = require("rosepine")

config.colors = theme.colors()

config.font = wezterm.font("JetBrains Mono")
config.font_size = 14
config.window_background_opacity = 0.9

config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.enable_tab_bar = true
config.default_cursor_style = "SteadyBlock"

config.window_close_confirmation = "NeverPrompt"
config.enable_wayland = false
config.hide_mouse_cursor_when_typing = true
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = keys

return config
