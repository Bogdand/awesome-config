--- {{{ keyboard indicator
keyboardWidget = {}
keyboardWidget.widget = widget({ type = "imagebox", align = "right" })
keyboardWidget.updateKeyboardLayout = function()
	local fd = io.popen("xset -q | grep -A 0 'LED' | cut -c59-67")
    local key_layout = fd:read()
    fd:close()
    local flag
    if     key_layout == "00001000" then flag = "ru"
    elseif key_layout == "00000000" then flag = "en"
    else 
    	flag = "en"
    end

	local flag_icon = 'lang_' .. flag
	keyboardWidget.widget.image = image(beautiful[flag_icon])
    return
end

awful.hooks.timer.register(1,  keyboardWidget.updateKeyboardLayout)
-- dbus.add_match("session", "member='LayoutUpdated'")

-- dbus.add_match("session", "member='LayoutUpdated'")
-- dbus.add_signal("org.ayatana.dbusmenu", mykey_update)
-- dbus.add_match("session", "member='DeviceChanged'")
-- dbus.add_signal("org.freedesktop.UPower", keyboardWidget.updateKeyboardLayout)
-- dbus.add_match("session", "member=''")
-- dbus.add_signal("org.ayatana.dbusmenu", keyboardWidget.updateKeyboardLayout)
--- keyboard indicator }}}