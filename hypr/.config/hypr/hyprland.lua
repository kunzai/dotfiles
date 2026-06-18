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

local home = os.getenv("HOME")

local ws_rules = home .. "/.config/hypr/workspace-rules-active.lua"
local ws_chunk, ws_err = loadfile(ws_rules)
if ws_chunk then
	ws_chunk()
else
	print("Failed to load workspace rules: " .. ws_err)
end

local monitor_rules = home .. "/.config/hypr/monitor-profile-active.lua"
local mon_chunk, mon_err = loadfile(monitor_rules)
if mon_chunk then
	mon_chunk()
else
	print("Failed to load monitor profile: " .. mon_err)
end
