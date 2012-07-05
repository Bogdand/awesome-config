--- {{{ keyboard indicator
keyboardWidget = {}
keyboardWidget.widget = widget({ type = "imagebox", align = "right" })
keyboardWidget.updateKeyboardLayout = function()
	local fd = io.popen("skb a")
    local key_layout = fd:read()
    fd:close()
    -- dbg(key_layout)
--     if string.find(status, "on", 1, true) then
-- 		volume = volume .. "%"
-- 		awful.util.spawn_with_shell("amixer -c 0 sset Speaker unmute") 
-- 		awful.util.spawn_with_shell("amixer -c 0 sset Headphone unmute") 
-- --		io.popen("amixer -c 0 sset Master unmute")
-- --		io.popen("amixer -c 0 sset Front unmute")
-- --		io.popen("amixer -c 0 sset Headphone unmute")
--        else

--     beautiful.widget_volume

--     keyboardWidget.widget.image = image(home_dir .. "/.icons/flags/" .. key_layout .. ".png")
    return
end

-- awful.hooks.timer.register(1,  keyboardWidget.updateKeyboardLayout)
-- dbus.add_match("session", "member='LayoutUpdated'")

-- dbus.add_match("session", "member='LayoutUpdated'")
-- dbus.add_signal("org.ayatana.dbusmenu", mykey_update)
-- dbus.add_match("session", "member='DeviceChanged'")
-- dbus.add_signal("org.freedesktop.UPower", keyboardWidget.updateKeyboardLayout)
-- dbus.add_match("session", "member=''")
-- dbus.add_signal("org.ayatana.dbusmenu", keyboardWidget.updateKeyboardLayout)
--- keyboard indicator }}}