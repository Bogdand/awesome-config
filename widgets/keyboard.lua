--- {{{ keyboard indicator
keyboardWidget = {}
keyboardWidget.widget = widget({ type = "imagebox", align = "right" })
keyboardWidget.updateKeyboardLayout = function()
	local fd = io.popen("setxkbmap -print | grep xkb_symbols | awk '{print $4}' | awk -F'+' '{print $2}'")    
    local key_layout = fd:read()
    fd:close()    
    local flag
    if     key_layout == "ru" then flag = "ru"
    elseif key_layout == "us" then flag = "en"
    else 
    	flag = "en"
    end

	local flag_icon = 'lang_' .. flag
	keyboardWidget.widget.image = image(beautiful[flag_icon])
    return
end

dbus.add_match("session", "interface='ca.desrt.dconf.Writer', arg0path='/org/gnome/desktop/input-sources/'")
dbus.add_signal("ca.desrt.dconf.Writer", keyboardWidget.updateKeyboardLayout)
 
keyboardWidget.updateKeyboardLayout()