local wezterm = require("wezterm")
local config = wezterm.config_builder()

local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

local keys = require("keys")
local theme = require("rosepine")

config.colors = theme.colors()
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 14

config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.enable_tab_bar = true
config.default_cursor_style = "SteadyBlock"

config.window_close_confirmation = "NeverPrompt"
config.enable_wayland = true

config.disable_default_key_bindings = true
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = keys

return config
