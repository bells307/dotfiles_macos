local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Everforest Dark (Gogh)"
config.font = wezterm.font("Fira Code")
config.font_size = 16
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95

return config
