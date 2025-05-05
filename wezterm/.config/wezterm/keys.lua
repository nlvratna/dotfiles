local wezterm = require("wezterm")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local act = wezterm.action
local mux = wezterm.mux

local leader = { key = "a", mods = "CTRL" }

local keys = {
	{
		key = "n",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "i",
		mods = "CTRL",
		action = act.ActivateCopyMode,
	},
	{
		key = "x",
		mods = "LEADER",
		action = act.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "f",
		mods = "CTRL",
		action = act.ActivateTabRelative(1),
	},

	{
		key = "s",
		mods = "CTRL",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = ";",
		mods = "CTRL",
		action = workspace_switcher.switch_workspace(),
	},
}

return keys
