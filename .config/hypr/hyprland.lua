---@module 'hl'

local themes_current = require("themes.current")
local general = require("general")
local decoration = require("decoration")
local binds = require("binds")
local animations = require("animations")
local layout = require("layout")

hl.monitor({
    output   = "",
    mode     = "1920x1080@144",
    position = "0x0",
    scale    = 1,
})





hl.env("XCURSOR_THEME", "Qogir-Dark")

hl.env("XCURSOR_SIZE", 24)

hl.env("HYPRCURSOR_THEME", "Qogir-Dark")

hl.env("HYPRCURSOR_SIZE", 24)

hl.gesture({
    ["fingers"] = 3,
    ["direction"] = "horizontal",
    ["action"] = "workspace",
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

hl.window_rule({
    name  = "xwayland-video-bridge-fixes",
    match = {
        class = "xwaylandvideobridge",
    },
    no_initial_focus = true,
    no_focus = true,
    no_anim = true,
    no_blur = true,
    max_size = "1 1",
    opacity = 0.0,
})

--windowrule = suppressevent maximize, class:.*

--windowrule = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & swaync & hyprpaper & hyprlock & xwaylandvideobridge &")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE &")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")
    hl.exec_cmd("hyprctl setcursor Qogir-Dark 24")
end)
