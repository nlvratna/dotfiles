local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action

-- local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

local is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"

-- local function basename(s)
-- 	return string.gsub(s, "(.*[/\\])(.*)", "%2")
-- end

if is_windows then
	config.wsl_domains = {
		{
			name = "WSL:Ubuntu-24.04",
			distribution = "Ubuntu-24.04",
			default_cwd = "~",
		},
	}
	config.default_domain = "WSL:Ubuntu-24.04"
end

local theme = require("rosepine").main

config.colors = theme.colors()
config.window_frame = theme.window_frame()
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 14
config.adjust_window_size_when_changing_font_size = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 32
config.enable_tab_bar = false

config.window_decorations = "TITLE|RESIZE"

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.mouse_bindings = {
	-- Open URLs with Ctrl+Click
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.OpenLinkAtMouseCursor,
	},
}
config.window_close_confirmation = "NeverPrompt"

return config

-- config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
--
-- config.unix_domains = {
-- 	{
-- 		name = "unix",
-- 	},
-- }
--
-- config.keys = require("keys")
--
-- config.window_close_confirmation = "NeverPrompt"
--
-- -- to save state peroidically
-- resurrect.periodic_save()
--
-- -- Save only 5000 lines per pane
-- resurrect.set_max_nlines(5000)
--
-- -- wezterm smart workspace switcher
--
-- local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
-- workspace_switcher.apply_to_config(config)
-- workspace_switcher.workspace_formatter = function(label)
-- 	return wezterm.format({
-- 		{ Text = "󱂬 : " .. label },
-- 	})
-- end
--
-- wezterm.on("smart_workspace_switcher.workspace_switcher.created", function(window, path, label)
-- 	window:gui_window():set_right_status(wezterm.format({
--
-- 		{ Text = basename(path) .. "  " },
-- 	}))
-- 	local workspace_state = resurrect.workspace_state
--
-- 	workspace_state.restore_workspace(resurrect.load_state(label, "workspace"), {
-- 		window = window,
-- 		relative = true,
-- 		restore_text = true,
-- 		on_pane_restore = resurrect.tab_state.default_on_pane_restore,
-- 	})
-- end)
--
-- wezterm.on("smart_workspace_switcher.workspace_switcher.chosen", function(window, path, label)
-- 	window:gui_window():set_right_status(wezterm.format({
-- 		{ Attribute = { Intensity = "Bold" } },
--
-- 		{ Text = basename(path) .. "  " },
-- 	}))
-- end)
--
-- wezterm.on("smart_workspace_switcher.workspace_switcher.selected", function(window, path, label)
-- 	local workspace_state = resurrect.workspace_state
-- 	resurrect.save_state(workspace_state.get_workspace_state())
-- end)
--
-- local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
-- smart_splits.apply_to_config(config, {
-- 	direction_keys = { "h", "j", "k", "l" },
-- 	modifiers = {
-- 		move = "CTRL",
-- 		resize = "ALT",
-- 	},
-- })
--
-- wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
-- 	local zoomed = ""
-- 	if tab.active_pane.is_zoomed then
-- 		zoomed = " "
-- 	end
--
-- 	local index = ""
-- 	if #tabs > 1 then
-- 		index = string.format("(%d/%d) ", tab.tab_index + 1, #tabs)
-- 	end
--
-- 	return zoomed .. index .. tab.active_pane.title
-- end)
--
-- -- wezterm.on("update-right-status", function(window, pane)
-- -- 	window:set_right_status(window:active_workspace())
-- -- end)
--
-- wezterm.on("update-right-status", function(window, _)
-- 	local SOLID_LEFT_ARROW = ""
-- 	local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
-- 	local prefix = ""
--
-- 	if window:leader_is_active() then
-- 		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
-- 		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
-- 	end
--
-- 	if window:active_tab():tab_id() ~= 0 then
-- 		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
-- 	end -- arrow color based on if tab is first pane
--
-- 	window:set_left_status(wezterm.format({
-- 		{ Background = { Color = "#b7bdf8" } },
-- 		{ Text = prefix },
-- 		ARROW_FOREGROUND,
-- 		{ Text = SOLID_LEFT_ARROW },
-- 	}))
-- end)
-- local resurrect_event_listeners = {
-- 	"resurrect.error",
-- 	"resurrect.save_state.finished",
-- }
-- local is_periodic_save = false
-- wezterm.on("resurrect.periodic_save", function()
-- 	is_periodic_save = true
-- end)
-- for _, event in ipairs(resurrect_event_listeners) do
-- 	wezterm.on(event, function(...)
-- 		if event == "resurrect.save_state.finished" and is_periodic_save then
-- 			is_periodic_save = false
-- 			return
-- 		end
-- 		local args = { ... }
-- 		local msg = event
-- 		for _, v in ipairs(args) do
-- 			msg = msg .. " " .. tostring(v)
-- 		end
-- 		wezterm.gui.gui_windows()[1]:toast_notification("Wezterm - resurrect", msg, nil, 4000)
-- 	end)
-- end
-- wezterm.plugin.update_all()
-- return config
