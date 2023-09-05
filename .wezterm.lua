local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

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

local function scheme_for_appearance(appearance)
	--print(appearance)
	--if appearance:find("Dark") then
	return "Catppuccin Mocha"
	--else
	--	return "Catppuccin Latte"
	--end
end

config.max_fps = 120
config.enable_wayland = true
config.pane_focus_follows_mouse = false
config.warn_about_missing_glyphs = true
config.check_for_updates = true
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "NONE"
config.audible_bell = "Disabled"
config.tab_bar_at_bottom = true
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.window_background_opacity = 0.7
config.initial_rows = 35
config.initial_cols = 150
config.hide_tab_bar_if_only_one_tab = true

config.launch_menu = launch_menu

config.font = wezterm.font_with_fallback({
	--{ family = "JetBrains Mono", weight = "Thin", stretch = "Normal", style = "Normal" },
	{ family = "JetBrains Mono", weight = "Regular" },
	"Cascadia Code",
	{ family = "Symbols Nerd Font", scale = 0.7 },
	"Fira Code",
})

config.font_size = 12

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
