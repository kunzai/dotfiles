-- My personal keybinding namespace. If I ever change baseline OSes, this may
-- need to change, since Ctrl+Shift is a much more common combo on Linux and
-- Windows.
hyper_keys = {"ctrl", "alt", "cmd"}
move_keys = {"alt"}
application_keys = {"cmd", "shift"}

-- hs.hotkey.bindSpec({ { "ctrl", "cmd", "alt" }, "y" }, hs.toggleConsole)

-- Give me a way to reload config when I want to. Auto-reloading is possible
-- but seems like it will cause unpredictable breakage when I'm working on the
-- config file.
hs.hotkey.bind(hyper_keys, "R", hs.reload)

-- This is a stupid shortcut but I want *something* that does this, and "E"
-- (for evaluate) and "L" (for Lua) are already taken.
hs.hotkey.bind(hyper_keys, "0", hs.toggleConsole)
