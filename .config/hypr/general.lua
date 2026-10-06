---@module 'hl'

local themes_current = require("themes.current")

hl.config({
    general = {
        border_size = 2,

        gaps_in = 5,
        gaps_out = 10,
        gaps_workspaces = 100,
        float_gaps = 18,
        
        layout = "scrolling",
        
        resize_on_border = true,
        
        allow_tearing = false,
        
        no_focus_fallback = true,
        
        col = {
            active_border = "rgba(" .. themes_current.color .. ")",
            inactive_border = "rgba(" .. themes_current.inactive_color .. ")",
        },

        snap = {
            enabled = true,
            border_overlap = true,
            respect_gaps = false,
            monitor_gap = 15,
            window_gap = 18,
        },
    },
})

hl.config({
    misc = {
        force_default_wallpaper = 0,
        -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = false,
        -- If true disables the random hyprland logo / anime girl background. :(
    },
})

hl.config({
    input = {
        kb_layout = "es",
        follow_mouse = 1,
        sensitivity = 0,
        -- -1.0 - 1.0, 0 means no modification.
        numlock_by_default = true,
        touchpad = {
            natural_scroll = false,
        },
    },
})