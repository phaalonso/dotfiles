local wezterm = require("wezterm")

local launch_menu = {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	table.insert(launch_menu, {
		label = "PowerShell",
		args = { "powershell.exe", "-NoLogo" },
	})

	-- Find installed visual studio version(s) and add their compilation
	-- environment command prompts to the menu
	for _, vsvers in ipairs(wezterm.glob("Microsoft Visual Studio/20*", "C:/Program Files (x86)")) do
		local year = vsvers:gsub("Microsoft Visual Studio/", "")
		table.insert(launch_menu, {
			label = "x64 Native Tools VS " .. year,
			args = {
				"cmd.exe",
				"/k",
				"C:/Program Files (x86)/" .. vsvers .. "/BuildTools/VC/Auxiliary/Build/vcvars64.bat",
			},
		})
	end
end

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

local config = {
	max_fps = 120,
	enable_wayland = false,
	pane_focus_follows_mouse = false,
	warn_about_missing_glyphs = true,
	check_for_updates = true,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "NONE",
	audible_bell = "Disabled",
	tab_bar_at_bottom = true,
	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
	window_background_opacity = 0.9,
	initial_rows = 35,
	initial_cols = 150,
	hide_tab_bar_if_only_one_tab = true,
}

config.launch_menu = launch_menu

config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	{ family = "Symbols Nerd Font", scale = 0.7 },
})

config.font_size = 13

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.keys = {
	-- This will create a new split and run your default program inside it
	{
		key = "%",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = '"',
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

return config
