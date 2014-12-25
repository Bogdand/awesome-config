-- {{{ Battery widget
local wibox = require("wibox")

batteryWidget = {}
batteryWidget.widget = wibox.widget.textbox()
batteryWidget.icon = wibox.widget.imagebox()
batteryWidget.icon:set_image(beautiful.widget_battery)
batteryWidget.lastVolume = "100"

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

			if ((args[1] == "-") and (args[2] < 20)) then				
				naughty.notify({
				title = "Battery level critically low: " .. args[2],
			    icon = beautiful.widget_battery,
			    fg = color,
			    screen = 1,
			    text = "Please connect your laptop to a power source"
			    })		
			end

			batteryWidget.lastVolume = args[2]
			return "<span color='" .. color .. "'>".. args[2] .. "%</span>"
		end
	end, 61, "BAT1")


batteryWidget.tooltip = awful.tooltip({ objects = { batteryWidget.widget, batteryWidget.icon },})
batteryWidget.tooltip:set_text("Battery: " .. batteryWidget.lastVolume .. "%")