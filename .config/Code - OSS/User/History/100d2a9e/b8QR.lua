local wezterm = require 'wezterm'
local config = {}

-- Define the path to the Wallust generated TOML file
local wallust_colors_file = os.getenv("HOME") .. "/.config/wezterm/wallust.toml"

-- Check if the file exists and load the scheme
local f = io.open(wallust_colors_file, "r")
if f then
    io.close(f)
    -- Load the scheme from the file path
    -- The name 'wallust_generated' is arbitrary; wezterm parses the file contents.
    wezterm.color.load_scheme(wallust_colors_file)
    config.color_scheme = 'wallust_generated' -- Set this name as the active scheme
else
    -- Fallback to a default scheme if Wallust hasn't run yet or file is missing
    config.color_scheme = 'Builtin Solarized Dark'
end

return config


-- local Config = require('config')

-- require('utils.backdrops')
--    -- :set_focus('#000000')
--    -- :set_images_dir(require('wezterm').home_dir .. '/Pictures/Wallpapers/')
--    :set_images()
--    :random()

-- require('events.left-status').setup()
-- require('events.right-status').setup({ date_format = '%a %H:%M:%S' })
-- require('events.tab-title').setup({ hide_active_tab_unseen = false, unseen_icon = 'numbered_box' })
-- require('events.new-tab-button').setup()
-- require('events.gui-startup').setup()

-- return Config:init()
--    :append(require('config.appearance'))
--    :append(require('config.bindings'))
--    :append(require('config.domains'))
--    :append(require('config.fonts'))
--    :append(require('config.general'))
--    :append(require('config.launch')).options
