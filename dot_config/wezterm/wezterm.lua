local wezterm = require("wezterm")
local catppuccin = require"colors/catppuccin".setup {
  -- whether or not to sync with the system's theme
  sync = false,
  -- the flavours to switch between when syncing
  -- available flavours: "latte" | "frappe" | "macchiato" | "mocha"
  sync_flavours = {
    light = "latte",
    dark = "mocha"
  },
  -- the default/fallback flavour, when syncing is disabled
  flavour = "mocha"
}

return {
    -- your config
    -- ...
    colors = catppuccin,
    hide_tab_bar_if_only_one_tab = true,
    window_padding = {
      left = 20,
      right = 20,
      top = 20,
      bottom = 20,
    },
    font = wezterm.font("JetBrainsMonoMedium Nerd Font"),
    font_size = 12,
    default_cursor_style = "SteadyBar",
    use_fancy_tab_bar = false,
    window_close_confirmation = "NeverPrompt",
}
