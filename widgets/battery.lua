-- {{{ Battery widget
batteryWidget = {}
batteryWidget.widget = widget({ type = "textbox" })
batteryWidget.icon = widget({ type = "imagebox" })
batteryWidget.icon.image = image(beautiful.widget_battery)

-- Register widget
vicious.register(batteryWidget.widget, vicious.widgets.bat,
	function (widget, args)
		if args[2] == 0 then return ""
		else
			return "<span color='white'>".. args[2] .. "%</span>"
		end
	end, 61, "BAT0"
)
batteryWidget.tooltip = awful.tooltip({ objects = { batteryWidget.widget, batteryWidget.icon },})
batteryWidget.tooltip:set_text("Battery")
-- }}}