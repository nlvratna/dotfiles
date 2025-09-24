local wezterm = require("wezterm")
local act = wezterm.action
local session = require("session")

local keys = {
	{
		key = "e",
		mods = "CTRL",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "i",
		mods = "LEADER",
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
		key = "g",
		mods = "CTRL",
		action = wezterm.action_callback(session.toggle),
	},
}

return keys
