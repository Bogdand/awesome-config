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
			local color = 'white'
			if (args[2] < 30) then
				color = 'yellow'
			end 
			if (args[2] < 10) then
				color = 'red'
			end			

			if (args[2] < 20) then				
				naughty.notify({
				title = "Battery level critically low: " .. args[2],
			    icon = beautiful.widget_battery,
			    fg = color,
			    screen = 1,
			    text = "Please connect your laptop to a power source"
			    })		
			end

			return "<span color='" .. color .. "'>".. args[2] .. "%</span>"
		end
	end, 61, "BAT0")

batteryWidget.tooltip = awful.tooltip({ objects = { batteryWidget.widget, batteryWidget.icon },})
batteryWidget.tooltip:set_text("Battery")