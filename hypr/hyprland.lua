hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = "1" })

local terminal = "ghostty"
local menu = "rofi -show drun"
local browser = "brave-origin"
-- local browser = "helium-browser"
local mainMod = "ALT"

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd(terminal)
	hl.exec_cmd("swaync")
	hl.exec_cmd("touchpad-disable")
	hl.exec_cmd("swaybg -i ~/dotfiles/hypr/mysticforset.png -m fill")
end)

hl.env("XCURSOR_THEME", "BreezeX-RosePine-Linux")
hl.env("XCURSOR_SIZE", "18")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

hl.config({
	cursor = {
		inactive_timeout = 10,
		no_hardware_cursors = true,
	},

	general = {
		gaps_in = 4,
		gaps_out = {
			top = 3,
			left = 10,
			right = 12,
			bottom = 10,
		},
		border_size = 0,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		layout = "dwindle",
		allow_tearing = false,
	},

	decoration = {
		rounding = 6,

		fullscreen_opacity = 1.00,
		active_opacity = 1.00,
		inactive_opacity = 1.00,

		blur = {
			enabled = false,
			size = 5,
			passes = 3,
			vibrancy = 0.1696,
		},

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
	},

	animations = {
		enabled = false,
	},

	dwindle = {
		preserve_split = true,
		force_split = 2,
	},

	master = {
		new_status = "master",
	},

	gestures = {
		workspace_swipe_distance = 100,
		workspace_swipe_invert = true,
		workspace_swipe_min_speed_to_force = 30,
		workspace_swipe_cancel_ratio = 0.5,
		workspace_swipe_create_new = true,
		workspace_swipe_forever = true,
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		mouse_move_enables_dpms = true,
		enable_swallow = true,
		swallow_regex = "^(kitty|alacritty|foot|ghostty)$",
		force_default_wallpaper = -1,
		vrr = 2,
	},

	binds = {
		drag_threshold = 10,
	},
})

hl.config({
	input = {
		kb_layout = "us",
		follow_mouse = 1,
		sensitivity = 0,

		repeat_rate = 35,
		repeat_delay = 250,

		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			middle_button_emulation = true,
			scroll_factor = 0.4,
			clickfinger_behavior = true,
		},
	},
})

hl.window_rule({ match = { class = "^()$", title = "^()$" } })
hl.window_rule({ match = { title = "^(Volume Control)$" }, float = true, size = "(monitor_w*.45) (monitor_h*.45)" })

hl.window_rule({ match = { title = "^(Open File)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(Select a File)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(Open Folder)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(Save As)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(Library)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(File Upload)(.*)$" }, float = true, size = "(monitor_w *.45) (monitor_h * .45)" })
hl.window_rule({ match = { title = "^(.*)(wants to save)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(.*)(wants to open)$" }, float = true, size = "900 600" })

hl.window_rule({
	match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
	float = true,
	keep_aspect_ratio = true,
	move = "(monitor_w*.73) (monitor_h*.72)",
	size = "(monitor_w*.25) (monitor_h*.25)",
	pin = true,
})

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. "+ b", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + c ", hl.dsp.window.close())
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(
	mainMod .. " + p",
	hl.dsp.exec_cmd("sh -c 'killall firefox chrome brave helium 2>/dev/null; systemctl poweroff'")
)
hl.bind(mainMod .. " + SHIFT +  f", hl.dsp.window.fullscreen("0"))
hl.bind(mainMod .. " + v", hl.dsp.exec_cmd("killall waybar || waybar"))

hl.bind("META + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + f", hl.dsp.window.float({ action = "toggle" }))
hl.bind("META + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+0" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

local repLock = { locked = true, repeating = true }

hl.bind(mainMod .. " + w", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"), repLock)
hl.bind(mainMod .. " + e", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), repLock)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), repLock)
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), repLock)

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

hl.bind(mainMod .. " + s", hl.dsp.exec_cmd("brightnessctl set 5%-"), repLock)
hl.bind(mainMod .. " + d", hl.dsp.exec_cmd("brightnessctl set 5%+"), repLock)

hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("grim - | wl-copy"))

hl.bind(mainMod .. " + SHIFT + e", hl.dsp.exit())
