local wezterm = require("wezterm")
local action = wezterm.action
local config = wezterm.config_builder()

-- General behavior
config.use_dead_keys = false
config.scrollback_lines = 5000

-- Theme/colors
config.color_scheme = "Gruvbox Material (Gogh)"
-- config.window_decorations = "RESIZE" - Disable window decorations

config.window_background_opacity = 0.9

config.colors = {
	tab_bar = {
		background = "#282828",
	},
}

config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.7,
}

-- Tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.show_tabs_in_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = false
config.tab_and_split_indices_are_zero_based = true
config.tab_bar_at_bottom = false
config.tab_max_width = 25
config.use_fancy_tab_bar = true

-- Keybindings
config.leader = { key = "q", mods = "ALT", timeout_milliseconds = 2000 }
config.keys = {
	-- Open a new tab
	{
		mods = "CTRL",
		key = "t",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},

	-- Close current tab
	{
		mods = "CTRL",
		key = "w",
		action = action.CloseCurrentTab({ confirm = false }),
	},

	-- Close current pane
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},

	-- Rename tab
	{
		key = "r",
		mods = "LEADER",
		action = action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},

	-- Split panes
	{
		mods = "LEADER",
		key = "\\", -- single backslash
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- Activate panes
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},

	-- Resize panes
	{
		mods = "LEADER",
		key = "LeftArrow",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "LEADER",
		key = "RightArrow",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "LEADER",
		key = "DownArrow",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "LEADER",
		key = "UpArrow",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	  { key = 'UpArrow', mods = 'SHIFT', action = act.ScrollByLine(-1) },
  -- Scroll down by one line
  { key = 'DownArrow', mods = 'SHIFT', action = act.ScrollByLine(1) },
  -- Scroll up by one page
  { key = 'PageUp', mods = 'SHIFT', action = act.ScrollByPage(-1) },
  -- Scroll down by one page
  { key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) },
}

-- Add keybindings to switch to tabs 0-9 with leader + number
for i = 0, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end

config.key_tables = {
	-- Defines the keys that are active in our resize-pane mode.
	-- Since we're likely to want to make multiple adjustments,
	-- we made the activation one_shot=false. We therefore need
	-- to define a key assignment for getting out of this mode.
	-- 'resize_pane' here corresponds to the name="resize_pane" in
	-- the key assignments above.
	resize_pane = {
		{ key = "LeftArrow", action = action.AdjustPaneSize({ "Left", 1 }) },
		{ key = "h", action = action.AdjustPaneSize({ "Left", 1 }) },

		{ key = "RightArrow", action = action.AdjustPaneSize({ "Right", 1 }) },
		{ key = "l", action = action.AdjustPaneSize({ "Right", 1 }) },

		{ key = "UpArrow", action = action.AdjustPaneSize({ "Up", 1 }) },
		{ key = "k", action = action.AdjustPaneSize({ "Up", 1 }) },

		{ key = "DownArrow", action = action.AdjustPaneSize({ "Down", 1 }) },
		{ key = "j", action = action.AdjustPaneSize({ "Down", 1 }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},

	-- Defines the keys that are active in our activate-pane mode.
	-- 'activate_pane' here corresponds to the name="activate_pane" in
	-- the key assignments above.
	activate_pane = {
		{ key = "LeftArrow", action = action.ActivatePaneDirection("Left") },
		{ key = "h", action = action.ActivatePaneDirection("Left") },

		{ key = "RightArrow", action = action.ActivatePaneDirection("Right") },
		{ key = "l", action = action.ActivatePaneDirection("Right") },

		{ key = "UpArrow", action = action.ActivatePaneDirection("Up") },
		{ key = "k", action = action.ActivatePaneDirection("Up") },

		{ key = "DownArrow", action = action.ActivatePaneDirection("Down") },
		{ key = "j", action = action.ActivatePaneDirection("Down") },
	},
}

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#32302f" --bg_statusline2
	local foreground = "#7c6f64" --grey0

	if tab.is_active then
		background = "#504945" -- bg_statusline3
		foreground = "#a89984" -- grey2
	elseif hover then
		background = "#32302f" --bg_statusline2
		foreground = "#928374" --grey1
	end

	local title = tab_title(tab)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = " " .. title .. " " },
	}
end)

-- Leader key status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#FFFFFF" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. wezterm.nerdfonts.cod_terminal_tmux .. "  " -- robot emoji
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 1 then
		ARROW_FOREGROUND = { Foreground = { Color = "#504945" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#282828" } },
		{ Foreground = { Color = "#d3869b" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
