-- global monitor config
hl.config({
	scrolling = {
		column_width = 0.8,
		follow_focus = true,
		direction = "right",
	},
})

-- monitor rules
hl.window_rule({
	name = "steam-on-ws9",
	match = { class = "^(steam)$" },
	workspace = "9 silent",
})

-- TradeskillMaster
hl.window_rule({
	name = "tsm-trading-on-ws0-floating",
	match = { class = "^(steam_app_4023158823)$" },
	workspace = "10 silent",
	float = true,
})
