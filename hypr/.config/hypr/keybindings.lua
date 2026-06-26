local home = os.getenv("HOME")
local monitorMenu = home .. "/.local/bin/monitor-menu.sh"

hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd(monitorMenu))

hl.bind("SUPER + T", hl.dsp.exec_cmd("ghostty"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("zen-browser"))

-- fullscreen
hl.bind("SUPER + f", function()
	-- some logic...
	hl.dispatch(hl.dsp.window.fullscreen({ action = "toggle" }))
end)

-- toggle floating
hl.bind("SUPER + ALT + SPACE", function()
	hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
	hl.dispatch(hl.dsp.window.center())
end)
