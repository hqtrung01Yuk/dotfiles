-- Pull in the wezterm API 
local wezterm = require 'wezterm'
-- This will hold the configuration.
local config = wezterm.config_builder()
config.enable_tab_bar = false
config.window_decorations = 'RESIZE'
-- tab_bar_at_bottom = true
-- config.use_fancy_tab_bar = true
config.font = wezterm.font('FiraMono Nerd Font', {
    italic = true,  weight = 'Medium' 
})
config.font_size = 11
-- config.underline_thickness = '2px'
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

local dimmer = { brightness = 0.1 }
config.window_background_opacity = 0.3
-- print(os.getevn("HOME"))
-- local user_home = os.getenv("~")

-- home in window
local user_home = "userprofile"
print(os.getenv(user_home))
-- block image

config.keys = {
    {
        key = "v",
        mods = "CTRL|SHIFT",
        action = wezterm.action.PasteFrom("Clipboard")
    },
    {
        key = 'C',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.CopyTo('Clipboard'),
    }
    {
        key = "l",
        mods = "CTRL|ALT",
        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
    },
    {
        key = "b",
        mods = "CTRL|SHIFT",
        action = wezterm.action_callback(function(window, pane)
            local bg_image = pick_random_background(background_folder)

            if bg_image then
                window:set_config_overrides({
                    window_background_image = bg_image,
                })
                wezterm.log_info("New background: " .. bg_image)
            else
                wezterm.log_error("Could not set new background")
            end
        end),
    },
}

config.background = {
    {
        source = {
            File = user_home.."Pictures\\Genshin Impact\\90015173_p0_master1200.jpg"
        },
        -- repeat_x = '',
        hsb = dimmer,
        width = '100%',
        repeat_x = 'NoRepeat',
    }
}
-- config.cursor_blink_rate = 800
-- Spawn a powershell in login mode
config.default_prog = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe', }
-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night Storm'
-- and finally, return the configuration to weztermr

config.default_cursor_style = "BlinkingUnderline"
return config


