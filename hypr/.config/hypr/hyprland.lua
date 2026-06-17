-- Down here you can write or source anything that you want to override from Ambxst's settings.
-- Ambxst
loadfile(os.getenv("HOME") .. "/.local/share/ambxst/hyprland.lua")()

-- OVERRIDES
-- Down here you can write or source anything that you want to override from Ambxst's settings.

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "ghostty"
local fileManager = "dolphin"
local menu = "hyprlauncher"

loadfile(os.getenv("HOME") .. "/.config/hypr/input.lua")()
loadfile(os.getenv("HOME") .. "/.config/hypr/keybindings.lua")()
loadfile(os.getenv("HOME") .. "/.config/hypr/env.lua")()
