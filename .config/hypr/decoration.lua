---@module 'hl'

local themes_current = require("themes.current")

hl.config({
    decoration = {
        rounding = 12,
        rounding_power = 3.2,
        dim_inactive = true,
        dim_strength = 0.10,
        dim_special = 1,

        shadow = {
            enabled = true,
            color = "rgba(" .. themes_current.color .. ")",
            color_inactive = "rgba(1a1a1acc)",
            range = 10,
            render_power = 3,
            sharp = false,
        },

        motion_blur = {
            enabled = true,
            samples = 6,
        },
    },
})
