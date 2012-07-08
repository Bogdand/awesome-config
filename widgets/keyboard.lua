--- {{{ keyboard indicator
keyboardWidget = {}
keyboardWidget.widget = widget({ type = "imagebox", align = "right" })
keyboardWidget.updateKeyboardLayout = function()
	local fd = io.popen("xset -q | grep -A 0 'LED' | cut -c59-67")
    local key_layout = fd:read()
    fd:close()
    local flag
    if     key_layout == "00001002" then flag = "ru"
    elseif key_layout == "00000002" then flag = "en"
    else 
    	flag = "en"
    end

	local flag_icon = 'lang_' .. flag
	keyboardWidget.widget.image = image(beautiful[flag_icon])
    return
end

dbus.add_match("session", "member='XAyatanaNewLabel'")
dbus.add_signal("org.kde.StatusNotifierItem", keyboardWidget.updateKeyboardLayout)