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

-- less battery drainage
hl.config({ decoration = { blur = { enabled = false } } })
hl.config({ decoration = { shadow = { enabled = false } } })

require("input")
require("keybindings")
require("env")
require("execute")
