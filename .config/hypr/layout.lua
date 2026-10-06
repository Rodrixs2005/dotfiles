---@module 'hl'

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 0.5,
        focus_fit_method = 1,
        follow_focus = true,
        follow_min_visible = 1,
        wrap_focus = true,
        wrap_swapcol = true,
        direction = "left",
    },
})

local mainMod = "SUPER"

hl.bind(mainMod .. " + R", hl.dsp.layout("colresize +conf"))

hl.bind(mainMod .. " + SHIFT + CTRL + Right", hl.dsp.layout("consume"))
hl.bind(mainMod .. " + SHIFT + CTRL + Left", hl.dsp.layout("expel"))