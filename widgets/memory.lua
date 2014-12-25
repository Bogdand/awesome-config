-- {{{ RAM usage widget
local wibox = require("wibox")

memoryWidget = {}
memoryWidget.widget = awful.widget.progressbar()
memoryWidget.widget:set_width(20)
memoryWidget.widget:set_height(20)
memoryWidget.widget:set_vertical(true)
memoryWidget.widget:set_background_color('#494B4F')
memoryWidget.widget:set_color({ type = "linear", from = { 0, 20 }, to = { 0, 0 }, stops = { {0, "#AECF96"}, {0.5, "#88A175"}, 
                    {1, "#FF5656"}}})
memoryWidget.icon = wibox.widget.imagebox(beautiful.widget_memory)

memoryWidget.tooltip = awful.tooltip({ objects = { memoryWidget.widget, memoryWidget.icon},})

vicious.cache(vicious.widgets.mem)
vicious.register(memoryWidget.widget, vicious.widgets.mem,
                function (widget, args)
            		memoryWidget.tooltip:set_text(" RAM: " .. args[2] .. "MB / " .. args[3] .. "MB ")
            	return args[1]
                end, 13)
-- }}}

