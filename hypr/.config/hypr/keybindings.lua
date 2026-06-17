hl.bind("SUPER + T", hl.dsp.exec_cmd("ghostty"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("zen-browser"))

-- fullscreen
hl.bind("SUPER + f", function()
	-- some logic...
	hl.dispatch(hl.dsp.window.fullscreen({ action = "toggle" }))
end)
