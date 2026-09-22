---@module 'hl'

hl.config({
    dwindle = {
        --pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true,
        -- You probably want this
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
        focus_fit_method = 1,
        follow_focus = true,
        direction = "left"
    },
})