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

local user_home = "C:\\Users\\ADMIN\\"-- Lấy thư mục User trên Windows
-- local background_folder = user_home .. "\\Pictures\\Genshin Impact\\"
-- Hàm chọn ngẫu nhiên ảnh nền
-- local function pick_random_background(folder)
   -- local handle = io.popen('dir "' .. folder .. '"')  -- Dùng dir /b /s cho Windows

    -- if not handle then
       -- wezterm.log_error("Could not list files in " .. folder)
        -- return nil
    -- end

    -- local files = handle:read("*a")
    -- handle:close()

    -- local images = {}
    -- for file in string.gmatch(files, "[^\r\n]+") do
      --  table.insert(images, file)
    -- end

    -- if #images > 1 then
       -- math.randomseed(os.time())  -- Đảm bảo ảnh chọn ra là ngẫu nhiên
       -- return images[math.random(#images)]
--    else
--        wezterm.log_error("No images found in " .. folder)
--        return nil
--    end
-- end
-- Đây là phần bị lỗi - phải nằm trong cấu hình keys
config.keys = {
    {
        key = "v",
        mods = "CTRL",
        action = wezterm.action.PasteFrom("Clipboard")
    },
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
                    window_background_image = bg_image,  -- Cập nhật ảnh nền
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
