local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
package.path = package.path .. ";" .. wezterm.home_dir .. "/.config/wezterm/lua/?.lua"
local background_manager = require("background_manager")

-- ── Maximize on startup ─────────────────────────────────────
wezterm.on("gui-startup", function()
  local _, _, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

local config = wezterm.config_builder and wezterm.config_builder() or {}

-- ── Appearance ──────────────────────────────────────────────
config.color_scheme = 'AdventureTime'
config.font = wezterm.font_with_fallback {
  { family = "JetBrainsMono Nerd Font", weight = "Medium" },
  "Apple Color Emoji",
}
config.font_size = 22
config.line_height = 1.1
config.cell_width = 0.9

config.window_background_opacity = 0.92
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.window_padding = { left = 8, right = 8, top = 8, bottom = 4 }

config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.7,
}

-- ── Tab bar (minimal — Zellij owns multiplexing) ────────────
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false

config.colors = {
  tab_bar = {
    background = "#11111b",
    active_tab = {
      bg_color = "#1e1e2e",
      fg_color = "#cdd6f4",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#181825",
      fg_color = "#6c7086",
    },
    inactive_tab_hover = {
      bg_color = "#313244",
      fg_color = "#cdd6f4",
    },
  },
}

background_manager.apply(config)

-- ── Scrollback ──────────────────────────────────────────────
config.scrollback_lines = 10000
config.enable_scroll_bar = false

-- ── Alt/Option key fix ──────────────────────────────────────
-- Send proper escape sequences so Alt+C (fzf), Alt+hjkl (Zellij) etc. work
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true

-- ── Quick select patterns ───────────────────────────────────
config.quick_select_patterns = {
  "[0-9a-f]{7,40}",                                              -- git hashes
  "[\\w\\-./]+\\.[a-zA-Z]{1,6}(?::\\d+)?",                      -- file paths
  "\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}(?::\\d+)?",       -- IPs
  "[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}", -- UUIDs
}

-- ── Keybindings (thin host — no pane/tab/split management) ──
-- All multiplexing is handled by Zellij.
-- WezTerm only handles: appearance, selection, clipboard, OS integration.
config.keys = {
  -- Quick select & copy mode
  { key = "Space", mods = "CMD|SHIFT", action = act.QuickSelect },
  { key = "x",     mods = "CMD|SHIFT", action = act.ActivateCopyMode },

  -- Fullscreen
  { key = "f", mods = "CMD|CTRL", action = act.ToggleFullScreen },

  -- Font size
  { key = "=", mods = "CMD",       action = act.IncreaseFontSize },
  { key = "-", mods = "CMD",       action = act.DecreaseFontSize },
  { key = "0", mods = "CMD",       action = act.ResetFontSize },

  -- Scroll (half-page, for scrollback outside Zellij scroll mode)
  { key = "u", mods = "CMD|SHIFT", action = act.ScrollByPage(-0.5) },
  { key = "d", mods = "CMD|SHIFT", action = act.ScrollByPage(0.5) },

  -- Open URL under cursor
  { key = "o", mods = "CMD|SHIFT", action = act.QuickSelectArgs {
      label = "open url",
      patterns = { "https?://\\S+" },
      action = wezterm.action_callback(function(window, pane)
        local url = window:get_selection_text_for_pane(pane)
        wezterm.open_with(url)
      end),
    }
  },
}

-- BEGIN background_manager integration
wezterm.on("background-manager-next", function(window, pane)
  background_manager.next(window)
end)

wezterm.on("background-manager-prev", function(window, pane)
  background_manager.prev(window)
end)

table.insert(config.keys, { key = "]", mods = "CMD|SHIFT", action = wezterm.action.EmitEvent "background-manager-next" })
table.insert(config.keys, { key = "[", mods = "CMD|SHIFT", action = wezterm.action.EmitEvent "background-manager-prev" })
-- END background_manager integration

-- ── Mouse ───────────────────────────────────────────────────
config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CMD",
    action = act.OpenLinkAtMouseCursor,
  },
}

return config
